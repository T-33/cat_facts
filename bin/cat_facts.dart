import 'dart:convert';
import 'dart:io';
import 'random_cat_fact.dart';

class CatFacts {
  Language factsLanguage = Language.english;

  static const languagePreferenceCodes = {
    1: Language.english,
    2: Language.spanish,
    3: Language.french,
  };

  CatFacts() {
    factsLanguage = _getLanguagePreference();
    while (true) {
      displayRandomCat();
    }
  }

  Future<void> displayRandomCat() async {
    var catFact = await RandomCatFact.fetchRandomCatFact();
    catFact.display();
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