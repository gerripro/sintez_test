import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';

class PostRepository {
  final PostDaoSqfliteImpl _postDao;

  PostRepository({required PostDaoSqfliteImpl postDao}) : _postDao = postDao;

  Future<List<PostDto>> getAllPosts() async {
    return _postDao.getAllPosts();
  }

  Future<void> addPost(PostDto post) async {
    await _postDao.insertPost(post);
  }

  Future<void> updatePost(PostDto post) async {
    await _postDao.updatePost(post);
  }

  Future<void> deletePost(String id) async {
    await _postDao.deletePostById(id);
  }
}