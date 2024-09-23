
import 'package:sintez_test/modules/feed/models/like_dto.dart';

abstract interface class LikesDao {
  Future<void> insertLike(LikeDto likeDto);
  Future<void> deleteLike(LikeDto likeDto);
  Future<List<String>> getLikedUserIdsForPost(String postId);
}