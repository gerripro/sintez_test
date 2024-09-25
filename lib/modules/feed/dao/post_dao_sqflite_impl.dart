import 'package:injectable/injectable.dart';
import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sintez_test/app/db/sintez_sql_db.dart';
import 'package:sintez_test/modules/feed/dao/post_dao.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class PostDaoSqfliteImpl implements PostDao {
  final SDatabase _database;

  PostDaoSqfliteImpl({required SDatabase database}) : _database = database;

  @override
  Future<List<PostDto>> getAllPosts() async {
    final List<Map<String, dynamic>> queryMap =
        await _database.instance.query(SDbConfigs.postsTable);
    return List.generate(queryMap.length, (i) => PostDto.fromJson(queryMap[i]));
  }

  @override
  Future<void> insertPost(PostDto post) async {
    await _database.instance.insert(SDbConfigs.postsTable, post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  @override
  Future<void> deletePostById(String id) async {
    await _database.instance.delete(
      SDbConfigs.postsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> updatePost(PostDto post) async {
    await _database.instance.update(
      SDbConfigs.postsTable,
      post.toJson(),
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }
}
