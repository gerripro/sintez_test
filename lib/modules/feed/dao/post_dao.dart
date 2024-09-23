import 'package:sintez_test/modules/feed/models/post_dto.dart';

abstract interface class PostDao {
  Future<List<PostDto>> getAllPosts();
  // TODO: add paginated list
  // Future<List<PostDto>> getPostsPaginated()
  Future<void> insertPost(PostDto post);
  Future<void> deletePostById(String id);
  Future<void> updatePost(PostDto post);
}
