import 'package:hogwarts/models/character_info_model.dart';
import 'package:hogwarts/screens/main_page/controller/main_page.controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_page.controller.g.dart';

@riverpod
class ListPageController extends _$ListPageController {
  @override
  FutureOr<List<CharacterInfo>> build() {
    final mainController = ref.read(mainPageControllerProvider.notifier);
    final filteredList = mainController.characterInfo
        .where((element) => element.failedAttempts > 0 && element.isSucceed)
        .toList();
    return filteredList;
  }
}
