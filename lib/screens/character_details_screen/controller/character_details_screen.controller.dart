import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/service/main_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_details_screen.controller.g.dart';

@riverpod
class CharacterDetailsScreenController
    extends _$CharacterDetailsScreenController {
  final _mainInfo = MainInfo();

  @override
  FutureOr<CharacterInfo> build(String characterId) async {
    final characterInfo = await _mainInfo.fetchCharacterById(characterId);
    return characterInfo;
  }
}
