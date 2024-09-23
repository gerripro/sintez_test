// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_list_item_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedListItemViewModel on _FeedListItemViewModel, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_FeedListItemViewModel.isLoading'))
          .value;

  late final _$likeDataAtom =
      Atom(name: '_FeedListItemViewModel.likeData', context: context);

  @override
  LikeData? get likeData {
    _$likeDataAtom.reportRead();
    return super.likeData;
  }

  @override
  set likeData(LikeData? value) {
    _$likeDataAtom.reportWrite(value, super.likeData, () {
      super.likeData = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_FeedListItemViewModel._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$handleLikeAsyncAction =
      AsyncAction('_FeedListItemViewModel.handleLike', context: context);

  @override
  Future<void> handleLike() {
    return _$handleLikeAsyncAction.run(() => super.handleLike());
  }

  late final _$_getLikesAsyncAction =
      AsyncAction('_FeedListItemViewModel._getLikes', context: context);

  @override
  Future<void> _getLikes() {
    return _$_getLikesAsyncAction.run(() => super._getLikes());
  }

  @override
  String toString() {
    return '''
likeData: ${likeData},
isLoading: ${isLoading}
    ''';
  }
}
