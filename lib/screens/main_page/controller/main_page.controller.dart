// main_page.controller
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hogwarts/models/character_info_model.dart';
import 'package:hogwarts/service/main_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_page.controller.freezed.dart';
part 'main_page.controller.g.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState({
    required CharacterInfo characterInfo,
    required int totalAttempts,
    required int successAttempts,
    required int failedAttempts,
  }) = _MainPageState;
}

@riverpod
class MainPageController extends _$MainPageController {
  final MainInfo _mainInfo = MainInfo();
  @override
  FutureOr<MainPageState> build() async {
    final characterInfo = await _mainInfo.fetchCharacters();
    return MainPageState(
      characterInfo: characterInfo.first,
      totalAttempts: 4,
      successAttempts: 6,
      failedAttempts: 1,
    );
  }
}
