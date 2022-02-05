import 'package:bloc_breaking_bad/buisness_logic/cubit/characters_cubit.dart';
import 'package:bloc_breaking_bad/data/repos/characters_repo.dart';
import 'package:bloc_breaking_bad/data/services/character_service.dart';
import 'package:bloc_breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(CharacterWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharactersCubit(charactersRepo),
            child: CharactersScreen(),
          ),
        );
    }
  }
}
