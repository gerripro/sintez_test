// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_list_item_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedListItemViewModel on _FeedListItemViewModel, Store {
  Computed<bool>? _$isLikedComputed;

  @override
  bool get isLiked => (_$isLikedComputed ??= Computed<bool>(() => super.isLiked,
          name: '_FeedListItemViewModel.isLiked'))
      .value;

  late final _$postAtom =
      Atom(name: '_FeedListItemViewModel.post', context: context);

  @override
  PostDto get post {
    _$postAtom.reportRead();
    return super.post;
  }

  bool _postIsInitialized = false;

  @override
  set post(PostDto value) {
    _$postAtom.reportWrite(value, _postIsInitialized ? super.post : null, () {
      super.post = value;
      _postIsInitialized = true;
    });
  }

  late final _$_isLikedAtom =
      Atom(name: '_FeedListItemViewModel._isLiked', context: context);

  @override
  bool get _isLiked {
    _$_isLikedAtom.reportRead();
    return super._isLiked;
  }

  @override
  set _isLiked(bool value) {
    _$_isLikedAtom.reportWrite(value, super._isLiked, () {
      super._isLiked = value;
    });
  }

  late final _$handleLikeAsyncAction =
      AsyncAction('_FeedListItemViewModel.handleLike', context: context);

  @override
  Future<void> handleLike() {
    return _$handleLikeAsyncAction.run(() => super.handleLike());
  }

  @override
  String toString() {
    return '''
post: ${post},
isLiked: ${isLiked}
    ''';
  }
}
