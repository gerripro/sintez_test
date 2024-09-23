import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/feed/models/like_data.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/services/likes_service.dart';
import 'package:sintez_test/shared/utils/logger/logger.dart';

part 'feed_list_item_vm.g.dart';

class FeedListItemViewModel = _FeedListItemViewModel
    with _$FeedListItemViewModel;

abstract class _FeedListItemViewModel with Store {
  final LikesService likesService;
  final PostDto postDto;

  _FeedListItemViewModel({required this.likesService, required this.postDto}) {
    _getLikes();
  }

  @observable
  LikeData? likeData;

  @computed
  bool get isLoading => _isLoading;

  @observable
  bool _isLoading = true;

  // FIXME: like/unlike logic needs to be refactored when system can differentiate users
  @action
  Future<void> handleLike() async {
    try {
      if (!likeData!.likedByCurrentUser) {
        await likesService.addLike(postId: postDto.id);
      } else {
        await likesService.removeLike(postId: postDto.id);
      }
      await _getLikes();
    } catch (e) {
      debugLogger.e(e);
      rethrow;
    }
  }

  @action
  Future<void> _getLikes() async {
    _isLoading = true;
    try {
      likeData = await likesService.getLikeDataByPost(postId: postDto.id);
    } catch (e) {
      debugLogger.e(e);
      rethrow;
    } finally {
      _isLoading = false;
    }
  }
}
