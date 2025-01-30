import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/service/main_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

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
  final List<CharacterInfo> _characterInfo = [];

  List<CharacterInfo> get characterInfo => _characterInfo;
  final Random _random = Random();

  @override
  FutureOr<MainPageState> build() async {
    await init();

    return MainPageState(
      // characterInfo: getRandCharacter(),
      characterInfo: _characterInfo[0],
      totalAttempts: 0,
      successAttempts: 0,
      failedAttempts: 0,
    );
  }

  Future<void> init() async {
    final characterInfo = await _mainInfo.fetchCharacters();
    _characterInfo.addAll(characterInfo);
  }

  CharacterInfo getRandCharacter() {
    var randomItem = _characterInfo[_random.nextInt(_characterInfo.length)];
    return randomItem;
  }

  void checkAnswer(String? house) {
    state.whenData((value) {
      final currentCharacter = value.characterInfo;
      final isCorrectAnswer = (house == null && currentCharacter.house == '') ||
          (house == currentCharacter.house);

      final characterIndex =
          _characterInfo.indexWhere((c) => c.id == currentCharacter.id);
      if (characterIndex != -1) {
        final wasSuccessfulBefore = _characterInfo[characterIndex].isSucceed;

        _characterInfo[characterIndex] = currentCharacter.copyWith(
          failedAttempts: isCorrectAnswer
              ? currentCharacter.failedAttempts
              : currentCharacter.failedAttempts + 1,
          totalAttempts: currentCharacter.totalAttempts + 1,
          isSucceed: isCorrectAnswer,
        );

        state = AsyncData(
          value.copyWith(
            characterInfo: _characterInfo[characterIndex],
            totalAttempts: value.totalAttempts + 1,
            successAttempts: (isCorrectAnswer && !wasSuccessfulBefore)
                ? value.successAttempts + 1
                : value.successAttempts,
            failedAttempts: isCorrectAnswer
                ? value.failedAttempts
                : value.failedAttempts + 1,
          ),
        );
      }
    });
  }

  void pullToRefresh() {
    state.whenData((value) {
      state = AsyncData(value.copyWith(
        characterInfo: getRandCharacter(),
      ));
    });
  }

  void reset() {
    for (final element in _characterInfo) {
      _characterInfo[_characterInfo.indexOf(element)] = element.copyWith(
        failedAttempts: 0,
        totalAttempts: 0,
        isSucceed: false,
      );
    }

    state.whenData((value) {
      state = AsyncData(value.copyWith(
        characterInfo: getRandCharacter(),
        totalAttempts: 0,
        successAttempts: 0,
        failedAttempts: 0,
      ));
    });
  }

  void setCharacterInfo(CharacterInfo characterInfo) {
    state.whenData((value) {
      state = AsyncData(value.copyWith(
        characterInfo: characterInfo,
        totalAttempts: value.totalAttempts,
        successAttempts: value.successAttempts,
        failedAttempts: value.failedAttempts,
      ));
    });
  }
}
