import 'package:flutter/material.dart';
import 'package:pokedex_app/app_navigator.dart';
import 'package:pokedex_app/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/blocs/pokemon_event.dart';
import 'package:pokedex_app/cubits/nav_cubit.dart';
import 'package:pokedex_app/cubits/pokemon_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PokemonDetailCubit pokemonDetailCubit = PokemonDetailCubit();

    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.redAccent)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0))),
          BlocProvider(create: (context) => NavCubit(pokemonDetailsCubit: pokemonDetailCubit)),
          BlocProvider(create: (context) => pokemonDetailCubit)
        ],
        child: AppNavigator(),
      ),
    );
  }
}
