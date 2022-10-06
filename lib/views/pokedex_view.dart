import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/blocs/pokemon_bloc.dart';

import '../blocs/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex App'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case PokemonLoadInProgress:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            case PokemonPageLoadSuccess:
              {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: (state as PokemonPageLoadSuccess)
                        .pokemonListings
                        .length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: GridTile(
                          child: Column(
                            children: [
                              Image.network(state.pokemonListings[index].imageUrl),
                              Text(state.pokemonListings[index].name)
                            ],
                          ),
                        ),
                      );
                    });
              }

            case PokemonPageLoadFailed:
              {
                return Center(
                  child: Text(
                    (state as PokemonPageLoadFailed).error.toString(),
                  ),
                );
              }
          }

          return Container();
        },
      ),
    );
  }
}
