import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/models/pokemon_details.dart';
import 'package:pokedex_app/models/pokemon_info_response.dart';
import 'package:pokedex_app/models/pokemon_species_info.dart';
import 'package:pokedex_app/repository/pokemon_repository.dart';

class PokemonDetailCubit extends Cubit<PokemonDetails?> {
  final _pokemonRepository = PokemonRepository();

  PokemonDetailCubit() : super(null);

  void pokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null);
}
