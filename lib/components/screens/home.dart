import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_card_list.dart';
import 'package:flutter_pokedex/models/pokemon.dart';

class Home extends StatelessWidget {
  Future<PokemonList> getPokemons(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("/application.json");
    final json = jsonDecode(data);

    return PokemonList.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: FutureBuilder(
        future: getPokemons(context),
        builder: (BuildContext context, AsyncSnapshot<PokemonList> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return HomeBody(
            pokemons: snapshot.data,
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final PokemonList pokemons;

  const HomeBody({Key key, @required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Pokedex",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          Text(
            "Pokedex information for all the 151 pokemons (1st generation)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            "*Pokémon and Pokémon character names are trademarks of Nintendo.",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              // fontSize: 16,
              color: Colors.white,
            ),
          ),
          Container(
            height: 500,
            child: PokemonCardList(
              pokemons: this.pokemons,
            ),
          ),
        ],
      ),
    );
  }
}
