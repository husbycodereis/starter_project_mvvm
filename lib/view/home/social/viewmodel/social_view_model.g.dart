// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocialViewModel on _SoicalViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_SoicalViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$socialUserListAtom =
      Atom(name: '_SoicalViewModelBase.socialUserList');

  @override
  List<SocialUser> get socialUserList {
    _$socialUserListAtom.reportRead();
    return super.socialUserList;
  }

  @override
  set socialUserList(List<SocialUser> value) {
    _$socialUserListAtom.reportWrite(value, super.socialUserList, () {
      super.socialUserList = value;
    });
  }

  final _$fetchAllUsersAsyncAction =
      AsyncAction('_SoicalViewModelBase.fetchAllUsers');

  @override
  Future<void> fetchAllUsers() {
    return _$fetchAllUsersAsyncAction.run(() => super.fetchAllUsers());
  }

  final _$_SoicalViewModelBaseActionController =
      ActionController(name: '_SoicalViewModelBase');

  @override
  void fetchAllSearchQuery(String text) {
    final _$actionInfo = _$_SoicalViewModelBaseActionController.startAction(
        name: '_SoicalViewModelBase.fetchAllSearchQuery');
    try {
      return super.fetchAllSearchQuery(text);
    } finally {
      _$_SoicalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_SoicalViewModelBaseActionController.startAction(
        name: '_SoicalViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_SoicalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
socialUserList: ${socialUserList}
    ''';
  }
}
