import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  var line = stdin.readLineSync(encoding: utf8);
  print(line);
}

class CatFacts {
  Language factLanguage = Language.eng;

  CatFacts();

  void start() {

  }

  Language _getLanguagePreference() {
    showLanguageSelectionMenu();

    String? userInput = stdin.readLineSync(encoding: utf8);

    if()

  }

  bool validateLanguagePreferenceInput

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
  eng,
  rus,
  esp, //esp - espana - spanish
}
