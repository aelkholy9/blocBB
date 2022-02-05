import 'package:bloc/bloc.dart';
import 'package:bloc_breaking_bad/data/models/Character.dart';
import 'package:bloc_breaking_bad/data/repos/characters_repo.dart';
import 'package:flutter/material.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  late List<Character> characters;
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      this.characters = characters;
      emit(CharactersLoaded(characters));
    });
    return characters;
  }
}
