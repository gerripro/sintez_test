import 'package:injectable/injectable.dart';
import 'package:sintez_test/modules/feed/dao/likes_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';

@lazySingleton
class LikesRepository {
  final LikesDaoSqfliteImpl _likesDao;

  LikesRepository({required LikesDaoSqfliteImpl likesDao})
      : _likesDao = likesDao;

  Future<void> addLike({required LikeDto like}) async {
    await _likesDao.insertLike(like);
  }

  Future<void> removeLike({required LikeDto like}) async {
    await _likesDao.deleteLike(like);
  }

  Future<List<String>> getLikedUserIdsForPost({required String postId}) async {
    return await _likesDao.getLikedUserIdsForPost(postId);
  }
}
