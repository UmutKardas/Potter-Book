import 'dart:convert';

List<Character> characterFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String characterToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  String id;
  String name;
  List<String> alternateNames;
  Species species;
  Gender gender;
  House house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool wizard;
  Ancestry ancestry;
  EyeColour eyeColour;
  HairColour hairColour;
  Wand wand;
  Patronus patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<String> alternateActors;
  bool alive;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    alternateNames: List<String>.from(json["alternate_names"].map((x) => x)),
    species: speciesValues.map[json["species"]]!,
    gender: genderValues.map[json["gender"]]!,
    house: houseValues.map[json["house"]]!,
    dateOfBirth: json["dateOfBirth"],
    yearOfBirth: json["yearOfBirth"],
    wizard: json["wizard"],
    ancestry: ancestryValues.map[json["ancestry"]]!,
    eyeColour: eyeColourValues.map[json["eyeColour"]]!,
    hairColour: hairColourValues.map[json["hairColour"]]!,
    wand: Wand.fromJson(json["wand"]),
    patronus: patronusValues.map[json["patronus"]]!,
    hogwartsStudent: json["hogwartsStudent"],
    hogwartsStaff: json["hogwartsStaff"],
    actor: json["actor"],
    alternateActors: List<String>.from(json["alternate_actors"].map((x) => x)),
    alive: json["alive"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alternate_names": List<dynamic>.from(alternateNames.map((x) => x)),
    "species": speciesValues.reverse[species],
    "gender": genderValues.reverse[gender],
    "house": houseValues.reverse[house],
    "dateOfBirth": dateOfBirth,
    "yearOfBirth": yearOfBirth,
    "wizard": wizard,
    "ancestry": ancestryValues.reverse[ancestry],
    "eyeColour": eyeColourValues.reverse[eyeColour],
    "hairColour": hairColourValues.reverse[hairColour],
    "wand": wand.toJson(),
    "patronus": patronusValues.reverse[patronus],
    "hogwartsStudent": hogwartsStudent,
    "hogwartsStaff": hogwartsStaff,
    "actor": actor,
    "alternate_actors": List<dynamic>.from(alternateActors.map((x) => x)),
    "alive": alive,
    "image": image,
  };
}

enum Ancestry { EMPTY, HALF_BLOOD, MUGGLEBORN, PURE_BLOOD }

final ancestryValues = EnumValues({
  "": Ancestry.EMPTY,
  "half-blood": Ancestry.HALF_BLOOD,
  "muggleborn": Ancestry.MUGGLEBORN,
  "pure-blood": Ancestry.PURE_BLOOD,
});

enum EyeColour { BLACK, BLUE, BROWN, DARK, EMPTY, GREEN, GREY, SILVER }

final eyeColourValues = EnumValues({
  "black": EyeColour.BLACK,
  "blue": EyeColour.BLUE,
  "brown": EyeColour.BROWN,
  "dark": EyeColour.DARK,
  "": EyeColour.EMPTY,
  "green": EyeColour.GREEN,
  "grey": EyeColour.GREY,
  "silver": EyeColour.SILVER,
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

enum HairColour { BLACK, BLOND, BLONDE, BROWN, DARK, EMPTY, RED, SANDY }

final hairColourValues = EnumValues({
  "black": HairColour.BLACK,
  "blond": HairColour.BLOND,
  "blonde": HairColour.BLONDE,
  "brown": HairColour.BROWN,
  "dark": HairColour.DARK,
  "": HairColour.EMPTY,
  "red": HairColour.RED,
  "sandy": HairColour.SANDY,
});

enum House { EMPTY, GRYFFINDOR, HUFFLEPUFF, RAVENCLAW, SLYTHERIN }

final houseValues = EnumValues({
  "": House.EMPTY,
  "Gryffindor": House.GRYFFINDOR,
  "Hufflepuff": House.HUFFLEPUFF,
  "Ravenclaw": House.RAVENCLAW,
  "Slytherin": House.SLYTHERIN,
});

enum Patronus {
  BOAR,
  EMPTY,
  HARE,
  HORSE,
  JACK_RUSSELL_TERRIER,
  NON_CORPOREAL,
  OTTER,
  STAG,
  SWAN,
}

final patronusValues = EnumValues({
  "boar": Patronus.BOAR,
  "": Patronus.EMPTY,
  "hare": Patronus.HARE,
  "horse": Patronus.HORSE,
  "Jack Russell terrier": Patronus.JACK_RUSSELL_TERRIER,
  "Non-Corporeal": Patronus.NON_CORPOREAL,
  "otter": Patronus.OTTER,
  "stag": Patronus.STAG,
  "swan": Patronus.SWAN,
});

enum Species { HUMAN }

final speciesValues = EnumValues({"human": Species.HUMAN});

class Wand {
  Wood wood;
  Core core;
  double? length;

  Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
    wood: woodValues.map[json["wood"]]!,
    core: coreValues.map[json["core"]]!,
    length: json["length"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "wood": woodValues.reverse[wood],
    "core": coreValues.reverse[core],
    "length": length,
  };
}

enum Core {
  DRAGON_HEARTSTRING,
  EMPTY,
  PHOENIX_TAIL_FEATHER,
  UNICORN_HAIR,
  UNICORN_TAIL_HAIR,
}

final coreValues = EnumValues({
  "dragon heartstring": Core.DRAGON_HEARTSTRING,
  "": Core.EMPTY,
  "phoenix tail feather": Core.PHOENIX_TAIL_FEATHER,
  "unicorn hair": Core.UNICORN_HAIR,
  "unicorn tail hair": Core.UNICORN_TAIL_HAIR,
});

enum Wood { ASH, CHERRY, EMPTY, HAWTHORN, HOLLY, VINE, WILLOW, YEW }

final woodValues = EnumValues({
  "ash": Wood.ASH,
  "cherry": Wood.CHERRY,
  "": Wood.EMPTY,
  "hawthorn": Wood.HAWTHORN,
  "holly": Wood.HOLLY,
  "vine": Wood.VINE,
  "willow": Wood.WILLOW,
  "yew": Wood.YEW,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
