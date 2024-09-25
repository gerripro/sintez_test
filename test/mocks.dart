import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/app/db/sintez_sql_db.dart';
import 'package:sintez_test/modules/feed/dao/likes_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/repositories/likes_repository.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/modules/feed/services/likes_service.dart';
import 'package:sintez_test/modules/media_picker/services/media_handler_service.dart';
import 'package:sintez_test/modules/media_picker/wrappers/gallery_picker_wrapper.dart';
import 'package:sintez_test/modules/shared_preferences/wrappers/shared_preferences_wrapper.dart';
import 'package:sintez_test/modules/theme/repositories/theme_repository.dart';
import 'package:sintez_test/shared/utils/helpers/uuid_generator.dart';
import 'package:sqflite/sqflite.dart';

class MockSDatabase extends Mock implements SDatabase {}

class MockSQFliteDatabase extends Mock implements Database {}

class MockPostDao extends Mock implements PostDaoSqfliteImpl {}

class MockLikesDao extends Mock implements LikesDaoSqfliteImpl {}

class MockPostsRepository extends Mock implements PostRepository {}

class MockLikesRepository extends Mock implements LikesRepository {}

class MockLikesService extends Mock implements LikesService {}

class MockGoRouter extends Mock implements GoRouter {}

class MockUuidGenerator extends Mock implements UuidGenerator {}

class MockMediaHandlerService extends Mock implements MediaHandlerService {}

class MockContext extends Mock implements BuildContext {}

class MockGalleryPickerWrapper extends Mock implements GalleryPickerWrapper {}

class MockSharedPreferencesWrapper extends Mock implements SharedPreferencesWrapper {}

class MockThemeRepository extends Mock implements ThemeRepository {}

// class MockFormState extends Mock implements FormState {}
