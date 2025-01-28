import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hogwarts/models/character_info_model.dart';
import 'package:http/http.dart' as http;

class MainInfo {
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
}
