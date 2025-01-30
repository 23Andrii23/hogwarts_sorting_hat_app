import 'package:hogwarts/models/character_info_model.dart';
import 'package:hogwarts/screens/main_page/controller/main_page.controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_page.controller.g.dart';

@riverpod
class ListPageController extends _$ListPageController {
  final List<CharacterInfo> _charactersInfo = [];
  @override
  FutureOr<List<CharacterInfo>> build() {
    final mainState = ref.watch(mainPageControllerProvider);

    return mainState.when(
      data: (state) {
        final mainController = ref.read(mainPageControllerProvider.notifier);
        return mainController.characterInfo
            .where((element) => element.failedAttempts > 0)
            .toList();
      },
      loading: () => [],
      error: (_, __) => [],
    );
  }

  void searchCharacter(String name) {
    final mainController = ref.read(mainPageControllerProvider.notifier);
    final filteredList = mainController.characterInfo
        .where((element) => element.name!.contains(name))
        .toList();
    _charactersInfo.clear();
    _charactersInfo.addAll(filteredList);
    state = AsyncData(filteredList);
  }

  void resetSearch() {
    final mainController = ref.read(mainPageControllerProvider.notifier);
    final filteredList = mainController.characterInfo
        .where((element) => element.failedAttempts > 0 && element.isSucceed)
        .toList();
    _charactersInfo.clear();
    _charactersInfo.addAll(filteredList);
    state = AsyncData(filteredList);
  }
}
