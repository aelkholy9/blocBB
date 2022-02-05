class Character {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  Character({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  Character.fromJson(dynamic json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation =
        json['occupation'] != null ? json['occupation'].cast<String>() : [];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance =
        json['appearance'] != null ? json['appearance'].cast<int>() : [];
    portrayed = json['portrayed'];
    category = json['category'];
    if (json['better_call_saul_appearance'] != null) {
      betterCallSaulAppearance = [];
      json['better_call_saul_appearance'].forEach((v) {
        betterCallSaulAppearance?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = charId;
    map['name'] = name;
    map['birthday'] = birthday;
    map['occupation'] = occupation;
    map['img'] = img;
    map['status'] = status;
    map['nickname'] = nickname;
    map['appearance'] = appearance;
    map['portrayed'] = portrayed;
    map['category'] = category;
    if (betterCallSaulAppearance != null) {
      map['better_call_saul_appearance'] =
          betterCallSaulAppearance?.map((v) => v).toList();
    }
    return map;
  }
}
