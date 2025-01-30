import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/screens/main_page/controller/main_page.controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_screen.controller.g.dart';

@riverpod
class ListScreenController extends _$ListScreenController {
  final List<CharacterInfo> _charactersInfo = [];
  List<CharacterInfo> _filteredList = [];

  @override
  FutureOr<List<CharacterInfo>> build() {
    final mainState = ref.watch(mainPageControllerProvider);

    return mainState.when(
      data: (state) {
        final mainController = ref.read(mainPageControllerProvider.notifier);
        _filteredList = mainController.characterInfo
            .where((element) => element.isSucceed || element.failedAttempts > 0)
            .toList();
        _charactersInfo.clear();
        _charactersInfo.addAll(_filteredList);
        return _filteredList;
      },
      loading: () => [],
      error: (_, __) => [],
    );
  }

  void searchCharacter(String? name) {
    if (name == null || name.isEmpty) {
      state = AsyncData(_filteredList);
      return;
    }
    final searchResults = _filteredList
        .where((element) =>
            element.name!.toLowerCase().contains(name.toLowerCase()))
        .toList();
    state = AsyncData(searchResults);
  }

  void resetSearch() {
    state = AsyncData(_filteredList);
  }

  void setCharacterInfo(CharacterInfo characterInfo) {
    ref
        .read(mainPageControllerProvider.notifier)
        .setCharacterInfo(characterInfo);
  }
}
