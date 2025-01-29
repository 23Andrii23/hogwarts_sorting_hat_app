import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hogwarts/screens/list_screen/controller/list_page.controller.dart';
import 'package:hogwarts/screens/list_screen/widgets/character_list_item.dart';
import 'package:hogwarts/screens/list_screen/widgets/search_field.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(listPageControllerProvider);

    return listState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(error.toString())),
      data: (characters) {
        return Column(
          children: [
            const SearchField(),
            const SizedBox(height: 10),
            if (characters.isEmpty)
              const Center(
                child: Text('No characters found'),
              )
            else
              ...characters.map(
                (character) => CharacterListItem(
                  name: character.name ?? '',
                  attempts: character.failedAttempts,
                  imageUrl: character.image ?? '',
                  isSuccess: character.isSucceed,
                ),
              ),
          ],
        );
      },
    );
  }
}
