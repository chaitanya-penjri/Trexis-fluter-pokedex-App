import 'package:bloc/bloc.dart';
import 'package:pokedex_app/blocs/pokemon_event.dart';
import 'package:pokedex_app/blocs/pokemon_state.dart';
import 'package:pokedex_app/repository/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is PokemonPageRequest) {
        emit(PokemonLoadInProgress());

        try {
          final pokemonPageResponse = await _pokemonRepository.getPokemonPage(0);

          emit(PokemonPageLoadSuccess(
              pokemonListings: pokemonPageResponse.pokemonListings,
              canLoadNextPage: pokemonPageResponse.canLoadNextPage));
        } catch (e) {
          emit(PokemonPageLoadFailed(error: (e as Error)));
        }
      }
    });
  }
}
