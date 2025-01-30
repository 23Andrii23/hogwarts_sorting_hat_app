import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts/screens/details_screen/character_details_screen.dart';

class CharacterListItem extends StatelessWidget {
  final String name;
  final int attempts;
  final String imageUrl;
  final bool isSuccess;

  const CharacterListItem({
    super.key,
    required this.name,
    required this.attempts,
    required this.imageUrl,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CharacterDetailsScreen(name: name),
            ),
          );
        },
        leading: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 40,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Attempts: $attempts',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSuccess)
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
              ),
            Icon(
              isSuccess ? Icons.check_circle : Icons.cancel,
              color: isSuccess ? Colors.green : Colors.red,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
