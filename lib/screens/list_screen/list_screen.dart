import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hogwarts/screens/list_screen/controller/list_screen.controller.dart';
import 'package:hogwarts/screens/list_screen/widgets/character_list_item.dart';
import 'package:hogwarts/screens/list_screen/widgets/search_field.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(listScreenControllerProvider);
    final notifier = ref.read(listScreenControllerProvider.notifier);

    return listState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(error.toString())),
      data: (characters) {
        return SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top -
              kBottomNavigationBarHeight,
          child: Column(
            children: [
              SearchField(
                onChanged: notifier.searchCharacter,
                onClear: notifier.resetSearch,
              ),
              const SizedBox(height: 10),
              if (characters.isEmpty)
                const Center(
                  child: Text('No characters found'),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      final character = characters[index];
                      return CharacterListItem(
                        character: character,
                        onRefresh: () => notifier.setCharacterInfo(character),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
