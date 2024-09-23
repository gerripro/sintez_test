// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedViewModel on _FeedViewModel, Store {
  Computed<List<PostDto>>? _$postsComputed;

  @override
  List<PostDto> get posts =>
      (_$postsComputed ??= Computed<List<PostDto>>(() => super.posts,
              name: '_FeedViewModel.posts'))
          .value;
  Computed<bool>? _$postsFetchingComputed;

  @override
  bool get postsFetching =>
      (_$postsFetchingComputed ??= Computed<bool>(() => super.postsFetching,
              name: '_FeedViewModel.postsFetching'))
          .value;

  late final _$_postsAtom =
      Atom(name: '_FeedViewModel._posts', context: context);

  @override
  List<PostDto> get _posts {
    _$_postsAtom.reportRead();
    return super._posts;
  }

  @override
  set _posts(List<PostDto> value) {
    _$_postsAtom.reportWrite(value, super._posts, () {
      super._posts = value;
    });
  }

  late final _$_postsFetchingAtom =
      Atom(name: '_FeedViewModel._postsFetching', context: context);

  @override
  bool get _postsFetching {
    _$_postsFetchingAtom.reportRead();
    return super._postsFetching;
  }

  @override
  set _postsFetching(bool value) {
    _$_postsFetchingAtom.reportWrite(value, super._postsFetching, () {
      super._postsFetching = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_FeedViewModel.getPosts', context: context);

  @override
  Future<void> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
postsFetching: ${postsFetching}
    ''';
  }
}
