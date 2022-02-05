import 'package:bloc_breaking_bad/constants/app_colors.dart';
import 'package:bloc_breaking_bad/data/models/Character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: character.img!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.img!,
                )
              : const Icon(Icons.clear),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name!,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
