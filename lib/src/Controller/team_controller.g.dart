// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeamController on _TeamStoreBase, Store {
  final _$listTeamApiAtom = Atom(name: '_TeamStoreBase.listTeamApi');

  @override
  ObservableFuture<List<Team>> get listTeamApi {
    _$listTeamApiAtom.reportRead();
    return super.listTeamApi;
  }

  @override
  set listTeamApi(ObservableFuture<List<Team>> value) {
    _$listTeamApiAtom.reportWrite(value, super.listTeamApi, () {
      super.listTeamApi = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TeamStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorsAtom = Atom(name: '_TeamStoreBase.errors');

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

  final _$refreshAsyncAction = AsyncAction('_TeamStoreBase.refresh');

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  @override
  String toString() {
    return '''
listTeamApi: ${listTeamApi},
loading: ${loading},
errors: ${errors}
    ''';
  }
}
