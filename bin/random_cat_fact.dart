import 'dart:convert';

import 'package:http/http.dart' as http;

class RandomCatFact {
  final String fact;

  RandomCatFact({required this.fact});

  static Future<RandomCatFact> fetchRandomCatFact () async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return RandomCatFact(fact: json['fact']);
    } else {
      throw Exception('Error fetching random cat fact');
    }
  }

  void display() {
    print(
    '''
    ======================================
    $fact
    ======================================
    '''
    );
  }
}