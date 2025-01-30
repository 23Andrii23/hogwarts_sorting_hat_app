import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/screens/character_details_screen/character_details_screen.dart';

class CharacterListItem extends StatelessWidget {
  final CharacterInfo character;

  const CharacterListItem({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CharacterDetailsScreen(
                characterId: character.id,
                showInfo: character.isSucceed,
              ),
            ),
          );
        },
        leading: CachedNetworkImage(
          imageUrl: character.image ?? '',
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 40,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          character.name ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Attempts: ${character.totalAttempts}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!character.isSucceed)
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
              ),
            Icon(
              character.isSucceed ? Icons.check_circle : Icons.cancel,
              color: character.isSucceed ? Colors.green : Colors.red,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
