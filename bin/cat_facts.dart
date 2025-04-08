import 'dart:convert';
import 'dart:io';
import 'random_cat_fact.dart';

class CatFacts {
  Language factsLanguage = Language.english;
  final List<RandomCatFact> favouriteFacts = [];

  static const languagePreferenceCodes = {
    1: Language.english,
    2: Language.spanish,
    3: Language.french,
  };

  CatFacts() {
    factsLanguage = _getLanguagePreference();
    displayRandomCat();
  }

  Future<void> displayRandomCat() async {
    var catFact = await RandomCatFact.fetchRandomCatFact();
    catFact.display();

    displayCatMenu();
    readCatMenuCommand(catFact);
  }

  void displayCatMenu() {
    print(
    '''
    Enter command:
    "like" - add current fact to favourites and display next.
    "next" - display next.
    "list" - list favourite facts. 
    "q" - quit. 
    '''
    );
  }

  void readCatMenuCommand(RandomCatFact currentCatFact) {
    String? userInput = stdin.readLineSync(encoding: utf8)?.trim();

    if (userInput == null || userInput.isEmpty) {
      print('Invalid command');
      displayCatMenu();
    }

    switch (userInput) {
      case 'like':
        likeFact(currentCatFact);
        displayRandomCat();
      case 'list':
        listLikedFacts();
      case 'next':
        displayRandomCat();
      case 'quit':
        return;
    }
  }

  void likeFact(RandomCatFact fact) {
    favouriteFacts.add(fact);
  }

  void listLikedFacts() {
    for (final fact in favouriteFacts) {
      fact.display();
    }
  }

  Language _getLanguagePreference() {
    showLanguageSelectionMenu();

    String? userInput = stdin.readLineSync(encoding: utf8)?.trim();

    if (userInput == null || userInput.isEmpty) {
      _getLanguagePreference();
    }

    int userLanguageCode = int.parse(userInput!);

    if (!languagePreferenceCodes.containsKey(userLanguageCode)) {
      _getLanguagePreference();
    }

    return languagePreferenceCodes[userLanguageCode] ?? Language.english;
  }

  void showLanguageSelectionMenu() {
    print(
        '''
    ======================================
    Please select language of random cat facts.
    Type 1 if you want ENGLISH.
    Type 2 if you want SPANISH.
    Type 3 if you want FRENCH.
    ======================================
    '''
    );
  }
}

enum Language {
  english,
  spanish,
  french,
}