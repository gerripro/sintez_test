import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/shared/utils/logger/logger.dart';

part 'feed_list_item_vm.g.dart';

class FeedListItemViewModel = _FeedListItemViewModel
    with _$FeedListItemViewModel;

abstract class _FeedListItemViewModel with Store {
  final PostRepository repository;
  final PostDto postDto;

  _FeedListItemViewModel({required this.repository, required this.postDto}) {
    post = postDto;
    if (post.likeCount > 0) _isLiked = true;
  }

  @observable
  late PostDto post;

  @computed
  bool get isLiked => _isLiked;

  @observable
  bool _isLiked = false;

  // FIXME: like/unlike logic needs to be refactored when system can differentiate users
  @action
  Future<void> handleLike() async {
    try {
      PostDto updatedPost;
      if (post.likeCount > 0) {
        updatedPost = post.copyWith(likeCount: post.likeCount - 1);
        _isLiked = false;
      } else {
        updatedPost = post.copyWith(likeCount: post.likeCount + 1);
        _isLiked = true;
      }
      await repository.updatePost(updatedPost);
      post = updatedPost;
    } catch (e) {
      debugLogger.e(e);
      rethrow;
    }
  }
}
