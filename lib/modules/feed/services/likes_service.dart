import 'package:sintez_test/modules/feed/models/like_data.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';
import 'package:sintez_test/modules/feed/repositories/likes_repository.dart';

class LikesService {
  final LikesRepository repository;

  LikesService({required this.repository});

  /// it is a temporary solution since we dont have user/auth service
  static const _currentUserId = 'mockId';

  Future<LikeData> getLikeDataByPost({required String postId}) async {
    var likeList = await repository.getLikedUserIdsForPost(postId: postId);
    var hasLike = likeList.contains(_currentUserId);
    return LikeData(
        postId: postId,
        likeCount: likeList.length,
        likedByCurrentUser: hasLike);
  }

  Future<void> addLike({required String postId}) async {
    await repository.addLike(
        like: LikeDto(userId: _currentUserId, postId: postId));
  }

  Future<void> removeLike({required String postId}) async {
    await repository.removeLike(
        like: LikeDto(userId: _currentUserId, postId: postId));
  }
}
