import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400

    final queryParams = {'limit': 200, 'offset': pageIndex * 200}.map((key, value) => MapEntry(key, value.toString()));

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParams);

    final response = await client.get(uri);

    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }
}
