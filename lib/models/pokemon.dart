class Pokemon {
  String name;
  String primaryType;

  Pokemon({this.name});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    primaryType = json['types'][0]['type']['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class PokemonList {
  List<Pokemon> firstGeneration;

  PokemonList.fromJson(Map<String, dynamic> json) {
    if (json['first_generation'] != null) {
      firstGeneration = List<Pokemon>();
      json['first_generation'].forEach((v) {
        firstGeneration.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.firstGeneration != null) {
      data['first_generation'] =
          this.firstGeneration.map((pokemon) => pokemon.toJson());
    }
    return data;
  }
}
