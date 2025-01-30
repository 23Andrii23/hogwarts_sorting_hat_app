// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_screen.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterDetailsScreenControllerHash() =>
    r'7532420154efda5ad7304daad8e3bee94689cbf4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CharacterDetailsScreenController
    extends BuildlessAutoDisposeAsyncNotifier<CharacterInfo> {
  late final String characterId;

  FutureOr<CharacterInfo> build(
    String characterId,
  );
}

/// See also [CharacterDetailsScreenController].
@ProviderFor(CharacterDetailsScreenController)
const characterDetailsScreenControllerProvider =
    CharacterDetailsScreenControllerFamily();

/// See also [CharacterDetailsScreenController].
class CharacterDetailsScreenControllerFamily
    extends Family<AsyncValue<CharacterInfo>> {
  /// See also [CharacterDetailsScreenController].
  const CharacterDetailsScreenControllerFamily();

  /// See also [CharacterDetailsScreenController].
  CharacterDetailsScreenControllerProvider call(
    String characterId,
  ) {
    return CharacterDetailsScreenControllerProvider(
      characterId,
    );
  }

  @override
  CharacterDetailsScreenControllerProvider getProviderOverride(
    covariant CharacterDetailsScreenControllerProvider provider,
  ) {
    return call(
      provider.characterId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'characterDetailsScreenControllerProvider';
}

/// See also [CharacterDetailsScreenController].
class CharacterDetailsScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        CharacterDetailsScreenController, CharacterInfo> {
  /// See also [CharacterDetailsScreenController].
  CharacterDetailsScreenControllerProvider(
    String characterId,
  ) : this._internal(
          () => CharacterDetailsScreenController()..characterId = characterId,
          from: characterDetailsScreenControllerProvider,
          name: r'characterDetailsScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterDetailsScreenControllerHash,
          dependencies: CharacterDetailsScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              CharacterDetailsScreenControllerFamily._allTransitiveDependencies,
          characterId: characterId,
        );

  CharacterDetailsScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.characterId,
  }) : super.internal();

  final String characterId;

  @override
  FutureOr<CharacterInfo> runNotifierBuild(
    covariant CharacterDetailsScreenController notifier,
  ) {
    return notifier.build(
      characterId,
    );
  }

  @override
  Override overrideWith(CharacterDetailsScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CharacterDetailsScreenControllerProvider._internal(
        () => create()..characterId = characterId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        characterId: characterId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CharacterDetailsScreenController,
      CharacterInfo> createElement() {
    return _CharacterDetailsScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterDetailsScreenControllerProvider &&
        other.characterId == characterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, characterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CharacterDetailsScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<CharacterInfo> {
  /// The parameter `characterId` of this provider.
  String get characterId;
}

class _CharacterDetailsScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        CharacterDetailsScreenController,
        CharacterInfo> with CharacterDetailsScreenControllerRef {
  _CharacterDetailsScreenControllerProviderElement(super.provider);

  @override
  String get characterId =>
      (origin as CharacterDetailsScreenControllerProvider).characterId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
