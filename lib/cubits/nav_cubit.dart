import 'package:flutter_bloc/flutter_bloc.dart';
import 'pokemon_detail_cubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit}) : super(0);

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.pokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedexPage() {
    pokemonDetailsCubit.clearPokemonDetails();
    emit(0);
  }
}