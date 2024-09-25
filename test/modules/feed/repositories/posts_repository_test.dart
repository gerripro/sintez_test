import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:test/test.dart';

import '../../../mocks.dart';

void main() {
  late MockPostDao postDao;
  late PostRepository postRepository;
  var testPostDto = PostDto(
      id: 'id',
      title: 'Test Post',
      content: 'content',
      mediaUrl: 'mediaUrl',
      creationDate: 1);

  setUpAll(() {
    postDao = MockPostDao();
    postRepository = PostRepository(postDao: postDao);
  });


  test(
      'Should return a list of PostDto '
          'on getAllPosts', () async {
    when(() => postDao.getAllPosts()).thenAnswer((_) async => [testPostDto]);

    final result = await postRepository.getAllPosts();

    expect(result, isA<List<PostDto>>());
    expect(result.length, 1);
    expect(result[0].id, 'id');
    verify(() => postDao.getAllPosts()).called(1);
  });

  test('Should call insertPost with correct post'
      'on addPost', () async {
    when(() => postDao.insertPost(testPostDto)).thenAnswer((_) async =>
        Future.value());

    await postRepository.addPost(testPostDto);

    verify(() => postDao.insertPost(testPostDto)).called(1);
  });

  test('Should call updatePost with correct post'
      'on updatePost', () async {
    when(() => postDao.updatePost(testPostDto)).thenAnswer((_) async =>
        Future.value());

    await postRepository.updatePost(testPostDto);

    verify(() => postDao.updatePost(testPostDto)).called(1);
  });

  test('Should call deletePost with correct id'
      'on deletePostById', () async {
    const postId = '1';
    when(() => postDao.deletePostById(postId)).thenAnswer((_) async =>
        Future.value());

    await postRepository.deletePost(postId);

    verify(() => postDao.deletePostById(postId)).called(1);
  });
}