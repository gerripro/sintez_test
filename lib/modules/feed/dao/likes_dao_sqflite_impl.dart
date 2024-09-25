import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sintez_test/modules/feed/dao/likes_dao.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';
import 'package:sqflite/sqflite.dart';

class LikesDaoSqfliteImpl implements LikesDao {
  final Database _database;

  LikesDaoSqfliteImpl({required Database database}) : _database = database;

  @override
  Future<void> insertLike(LikeDto likeDto) async {
    await _database.insert(SDbConfigs.likesTable, likeDto.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  @override
  Future<void> deleteLike(LikeDto likeDto) async {
    await _database.delete(
      SDbConfigs.likesTable,
      where: 'userId = ? AND postId = ?',
      whereArgs: [likeDto.userId, likeDto.postId],
    );
  }

  @override
  Future<List<String>> getLikedUserIdsForPost(String postId) async {
    final List<Map<String, dynamic>> result = await _database.query(
      'likes',
      columns: ['userId'],
      where: 'postId = ?',
      whereArgs: [postId],
    );
    return result.map((row) => row['userId'] as String).toList();
  }
}
