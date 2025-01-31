import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/service/http_service.dart';
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
    required Map<String, String> characterImages,
  }) = _MainPageState;
}

@riverpod
class MainPageController extends _$MainPageController {
  final _httpService = HttpService();
  final _characterInfo = <CharacterInfo>[];

  List<CharacterInfo> get characterInfo => _characterInfo;
  final _random = Random();

  @override
  FutureOr<MainPageState> build() async {
    await init();
    final character = getRandCharacter();

    return MainPageState(
      characterInfo: character,
      totalAttempts: 0,
      successAttempts: 0,
      failedAttempts: 0,
      characterImages: {},
    );
  }

  Future<void> init() async {
    final characterInfo = await _httpService.fetchCharacters();
    _characterInfo.addAll(characterInfo);
  }

  Future<void> _loadCharacterImage(CharacterInfo character) async {
    if (character.image?.isEmpty ?? true) {
      try {
        final imageUrl =
            await _httpService.getImageForCharacter(character.name ?? '');
        state.whenData((currentState) {
          final updatedImages =
              Map<String, String>.from(currentState.characterImages);
          updatedImages[character.id] = imageUrl;
          state =
              AsyncData(currentState.copyWith(characterImages: updatedImages));
        });
      } catch (e) {
        debugPrint('Error loading image: $e');
      }
    }
  }

  CharacterInfo getRandCharacter() {
    final randomItem = _characterInfo[_random.nextInt(_characterInfo.length)];
    if (randomItem.image?.isEmpty ?? true) {
      _loadCharacterImage(randomItem);
    }
    return randomItem;
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

  void checkAnswer(String? house) {
    state.whenData((value) {
      final currentCharacter = value.characterInfo;

      if (currentCharacter.isSucceed) return;

      final normalizedHouse =
          house?.trim().isEmpty == true ? null : house?.trim();
      final isCorrectAnswer =
          (normalizedHouse == null && currentCharacter.house?.trim() == '') ||
              (normalizedHouse == currentCharacter.house?.trim());

      final characterIndex =
          _characterInfo.indexWhere((c) => c.id == currentCharacter.id);
      if (characterIndex != -1) {
        final wasSuccessfulBefore = _characterInfo[characterIndex].isSucceed;
        final updatedCharacter = currentCharacter.copyWith(
          failedAttempts: isCorrectAnswer
              ? currentCharacter.failedAttempts
              : currentCharacter.failedAttempts + 1,
          totalAttempts: currentCharacter.totalAttempts + 1,
          isSucceed: isCorrectAnswer,
        );

        _characterInfo[characterIndex] = updatedCharacter;

        _loadCharacterImage(updatedCharacter);

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
        characterImages: {},
      ));
    });
  }
}
