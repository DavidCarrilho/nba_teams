// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerController on _PlayerStoreBase, Store {
  final _$listPlayerApiAtom = Atom(name: '_PlayerStoreBase.listPlayerApi');

  @override
  ObservableFuture<List<Player>> get listPlayerApi {
    _$listPlayerApiAtom.reportRead();
    return super.listPlayerApi;
  }

  @override
  set listPlayerApi(ObservableFuture<List<Player>> value) {
    _$listPlayerApiAtom.reportWrite(value, super.listPlayerApi, () {
      super.listPlayerApi = value;
    });
  }

  final _$errorsAtom = Atom(name: '_PlayerStoreBase.errors');

  @override
  bool get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(bool value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('_PlayerStoreBase.refresh');

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$fetchPlayersAsyncAction =
      AsyncAction('_PlayerStoreBase.fetchPlayers');

  @override
  Future<void> fetchPlayers({dynamic nextPage = false}) {
    return _$fetchPlayersAsyncAction
        .run(() => super.fetchPlayers(nextPage: nextPage));
  }

  @override
  String toString() {
    return '''
listPlayerApi: ${listPlayerApi},
errors: ${errors}
    ''';
  }
}
