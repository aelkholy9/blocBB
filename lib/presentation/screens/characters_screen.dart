// ignore_for_file: prefer_final_fields

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
  List<Character> searchedCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: AppColors.textColor,
      decoration: const InputDecoration(
        hintText: "Enter a keyword",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: null,
      ),
      style: const TextStyle(color: AppColors.textColor),
      onChanged: (searchKeyWord) {
        addSearchResultsToSearchedCharactersList(searchKeyWord);
      },
    );
  }

  void addSearchResultsToSearchedCharactersList(String searchKeyWord) {
    searchedCharacters = allCharacters
        .where((character) => character.name!.contains(searchKeyWord))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearchField();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearching();
          },
          icon: const Icon(Icons.search),
        )
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        _stopSearching();
      },
    ));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchField();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchField() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildCharactersListWidget();
        }
        return buildLoadingWidget();
      },
    );
  }

  Widget buildCharactersListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCharactersGrid(),
        ],
      ),
    );
  }

  Widget buildCharactersGrid() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return CharacterItem(
            character: _searchTextController.text.isEmpty
                ? allCharacters[index]
                : searchedCharacters[index],
          );
        },
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedCharacters.length,
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: Image.asset('assets/images/loading.gif'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: _isSearching
            ? buildSearchField()
            : const Text(
                'Characters',
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
