import 'package:bloc_breaking_bad/buisness_logic/cubit/characters_cubit.dart';
import 'package:bloc_breaking_bad/constants/app_colors.dart';
import 'package:bloc_breaking_bad/data/models/Character.dart';
import 'package:bloc_breaking_bad/presentation/common_widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildCharactersListWidget();
        }
        return buildErrorWidget();
      },
    );
  }

  Widget buildCharactersListWidget() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [buildCharactersGrid()],
        ),
      ),
    );
  }

  Widget buildCharactersGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: Character(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Characters',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
