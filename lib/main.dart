import 'package:flutter/material.dart';
import 'package:pokedex_app/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/blocs/pokemon_event.dart';
import 'package:pokedex_app/views/pokedex_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.redAccent)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0)))
        ],
        child: PokedexView(),
      ),
    );
  }
}
