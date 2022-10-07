import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon_info_response.dart';
import 'package:pokedex_app/models/pokemon_species_info.dart';
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

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon/$pokemonId");

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon-species/$pokemonId");

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
