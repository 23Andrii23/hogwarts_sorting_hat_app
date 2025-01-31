import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hogwarts/screens/character_details_screen/controller/character_details_screen.controller.dart';

class CharacterDetailsScreen extends ConsumerWidget {
  final String characterId;
  final bool showInfo;
  final String? imageUrl;

  const CharacterDetailsScreen({
    required this.characterId,
    required this.showInfo,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState =
        ref.watch(characterDetailsScreenControllerProvider(characterId));

    return characterState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text(error.toString())),
      ),
      data: (character) => Scaffold(
        appBar: AppBar(
          title: Text(
            character.name ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  height: 250,
                  width: 200,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    height: 250,
                    width: 200,
                    color: Colors.grey[300],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error),
                        Text('Image not found'),
                      ],
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 250,
                    width: 200,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              showInfo
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('House', character.house),
                          _buildInfoRow('Date of birth', character.dateOfBirth),
                          _buildInfoRow('Actor', character.actor),
                          _buildInfoRow('Species', character.species),
                          _buildInfoRow('ancestry', character.ancestry),
                          _buildInfoRow('Eye colour', character.eyeColour),
                          _buildInfoRow('Hair colour', character.hairColour),
                          _buildInfoRow('Patronus', character.patronus),
                          _buildInfoRow(
                            'Wand',
                            'Wand made of ${character.wand?.wood}, '
                                'with a core of ${character.wand?.core}, '
                                'measuring ${character.wand?.length} inches',
                            showInfo: character.wand != null &&
                                character.wand?.wood != '',
                          ),
                        ],
                      ),
                    )
                  : Image.asset(
                      'assets/images/access denied.jpg',
                      height: 200,
                      width: 150,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String? value, {
    bool showInfo = true,
  }) {
    return !showInfo
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$label: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    value ?? '...',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
  }
}
