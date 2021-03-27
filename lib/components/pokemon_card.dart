import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final pokemon;

  PokemonCard({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: getBackgroundColor(pokemon.primaryType),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ditto.png"),
              ),
            ),
          ),
          Text(pokemon.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("tipo 1"),
              Text("tipo 2"),
            ],
          ),
        ],
      ),
    );
  }

  getBackgroundColor(type) {
    switch (type) {
      case "bug":
        return Color(0xff92bc2c);
        break;
      case "dark":
        return Color(0xff595761);
        break;
      case "dragon":
        return Color(0xff0c69c8);
        break;
      case "electric":
        return Color(0xfff2d94e);
        break;
      case "fire":
        return Color(0xfffba54c);
        break;
      case "fairy":
        return Color(0xffee90e6);
        break;
      case "fighting":
        return Color(0xffd3425f);
        break;
      case "flying":
        return Color(0xffa1bbec);
        break;
      case "ghost":
        return Color(0xff5f6dbc);
        break;
      case "grass":
        return Color(0xff5fbd58);
        break;
      case "ground":
        return Color(0xffda7c4d);
        break;
      case "ice":
        return Color(0xff75d0c1);
        break;
      case "normal":
        return Color(0xffa0a29f);
        break;
      case "poison":
        return Color(0xffb763cf);
        break;
      case "psychic":
        return Color(0xfffa8581);
        break;
      case "rock":
        return Color(0xffc9bb8a);
        break;
      case "steel":
        return Color(0xff5695a3);
        break;
      case "water":
        return Color(0xff539ddf);
        break;
      default:
        return Color(0xffffffff);
    }
  }
}
