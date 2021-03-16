import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_card.dart';
import 'package:flutter_pokedex/models/pokemon.dart';

class PokemonCardList extends StatelessWidget {
  final PokemonList pokemons;

  PokemonCardList({Key key, @required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 150.0,
      ),
      children: pokemons.firstGeneration
          .map(
            (pokemon) => PokemonCard(
              pokemon: pokemon,
            ),
          )
          .toList(),
    );
  }
}
