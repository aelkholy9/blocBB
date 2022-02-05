import 'package:bloc_breaking_bad/data/models/Character.dart';
import 'package:bloc_breaking_bad/data/services/character_service.dart';

class CharactersRepo {
  final CharacterWebService service;
  CharactersRepo(this.service);
  Future<List<Character>> getAllCharacters() async {
    try {
      final data = await service.getAllCharacters();
      final decoded =
          data.map((character) => Character.fromJson(character)).toList();
      return decoded;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
