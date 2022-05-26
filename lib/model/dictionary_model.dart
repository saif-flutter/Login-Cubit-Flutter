class DictionaryModel {
  List<Definitions>? definitions;
  String? word;
  String? pronunciation;

  DictionaryModel({this.definitions, this.word, this.pronunciation});

  DictionaryModel.fromJson(Map<String, dynamic> json) {
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add( Definitions.fromJson(v));
      });
    }
    word = json['word'];
    pronunciation = json['pronunciation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.definitions != null) {
      data['definitions'] = this.definitions!.map((v) => v.toJson()).toList();
    }
    data['word'] = this.word;
    data['pronunciation'] = this.pronunciation;
    return data;
  }
}

class Definitions {
  String? type;
  String? definition;
  String? example;
  String? imageUrl;
  String? emoji;

  Definitions(
      {this.type, this.definition, this.example, this.imageUrl, this.emoji});

  Definitions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    definition = json['definition'];
    example = json['example'];
    imageUrl = json['image_url'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['definition'] = this.definition;
    data['example'] = this.example;
    data['image_url'] = this.imageUrl;
    data['emoji'] = this.emoji;
    return data;
  }
}