import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

import '../../../mocks.dart';

void main() {
  late MockSDatabase sqFliteDatabase;
  const postsTable = SDbConfigs.postsTable;
  var testPostDto = PostDto(
      id: 'id',
      title: 'Test Post',
      content: 'content',
      mediaUrl: 'mediaUrl',
      creationDate: 1);
  late Map<String, dynamic> testPostDtoJson;

  setUpAll(() {
    sqFliteDatabase = MockSDatabase();
    testPostDtoJson = testPostDto.toJson();
  });

  test(
      'Should return a list of PostDto '
      'on getAllPosts', () async {
    var postDaoSqfliteImpl = PostDaoSqfliteImpl(database: sqFliteDatabase);
    var mockSQFliteDatabase = MockSQFliteDatabase();
    when(() => sqFliteDatabase.instance).thenReturn(mockSQFliteDatabase);
    when(() => mockSQFliteDatabase.query(postsTable))
        .thenAnswer((_) async => [testPostDtoJson]);

    final result = await postDaoSqfliteImpl.getAllPosts();

    expect(result, isA<List<PostDto>>());
    expect(result.length, 1);
    expect(result[0].id, 'id');
    expect(result[0].title, 'Test Post');
  });

  test(
      'Should insert a post into the database'
      'on insertPost', () async {
    var postDaoSqfliteImpl = PostDaoSqfliteImpl(database: sqFliteDatabase);
    var mockSQFliteDatabase = MockSQFliteDatabase();
    when(() => sqFliteDatabase.instance).thenReturn(mockSQFliteDatabase);
    when(() => mockSQFliteDatabase.insert(
          postsTable,
          testPostDtoJson,
          conflictAlgorithm: ConflictAlgorithm.fail,
        )).thenAnswer((_) async => 1);

    await postDaoSqfliteImpl.insertPost(testPostDto);

    verify(() => mockSQFliteDatabase.insert(
          postsTable,
          testPostDtoJson,
          conflictAlgorithm: ConflictAlgorithm.fail,
        )).called(1);
  });

  test(
      'Should delete a post from the database'
      'on deletePostById', () async {
    var postDaoSqfliteImpl = PostDaoSqfliteImpl(database: sqFliteDatabase);
    var mockSQFliteDatabase = MockSQFliteDatabase();
    when(() => sqFliteDatabase.instance).thenReturn(mockSQFliteDatabase);
    when(() => mockSQFliteDatabase.delete(
          postsTable,
          where: 'id = ?',
          whereArgs: ['id'],
        )).thenAnswer((_) async => 1);

    await postDaoSqfliteImpl.deletePostById('id');

    verify(() => mockSQFliteDatabase.delete(
          postsTable,
          where: 'id = ?',
          whereArgs: ['id'],
        )).called(1);
  });

  test(
      'Should update a post from the database'
      'on updatePost', () async {
    var postDaoSqfliteImpl = PostDaoSqfliteImpl(database: sqFliteDatabase);
    var mockSQFliteDatabase = MockSQFliteDatabase();
    when(() => sqFliteDatabase.instance).thenReturn(mockSQFliteDatabase);
    when(() => mockSQFliteDatabase.update(
          postsTable,
          testPostDtoJson,
          where: 'id = ?',
          whereArgs: ['id'],
        )).thenAnswer((_) async => 1);

    await postDaoSqfliteImpl.updatePost(testPostDto);

    verify(() => mockSQFliteDatabase.update(
          postsTable,
          testPostDtoJson,
          where: 'id = ?',
          whereArgs: ['id'],
        )).called(1);
  });
}
