import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/cubits/nav_cubit.dart';
import 'package:pokedex_app/views/pokedex_details_view.dart';
import 'package:pokedex_app/views/pokedex_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: PokedexView()),
          if (pokemonId != 0) MaterialPage(child: PokedexDetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedexPage();
          return route.didPop(result);
        },
      );
    });
  }
}
