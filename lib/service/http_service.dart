import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<CharacterInfo>> fetchCharacters() async {
    try {
      final response = await http
          .get(Uri.parse('https://hp-api.onrender.com/api/characters'));

      final List<dynamic> decode = jsonDecode(response.body);
      return decode.map((json) => CharacterInfo.fromJson(json)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> getImageForCharacter(String characterName) async {
    /// This is a endpoint that returns a image for a character
    /// could be some error because the endpoint is not stable
    try {
      final prod = await http.get(Uri.parse(
          'https://n9n213.freemyip.com/webhook/29b73d2b-de4b-49d5-9b58-db58f09d384f?name=$characterName'));
      final json = jsonDecode(prod.body);
      final content = json[0]['message']['content'];
      final imageUrl = _extractUrl(content);
      return imageUrl;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<CharacterInfo> fetchCharacterById(String id) async {
    try {
      final response = await http
          .get(Uri.parse('https://hp-api.onrender.com/api/character/$id'));

      final List<dynamic> decode = jsonDecode(response.body);
      return CharacterInfo.fromJson(decode.first);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  String _extractUrl(String text) {
    if (text.contains('[') && text.contains('](')) {
      final startIndex = text.indexOf('](') + 2;
      final endIndex = text.indexOf(')', startIndex);
      if (endIndex != -1) {
        return text.substring(startIndex, endIndex);
      }
    }
    return text;
  }
}
