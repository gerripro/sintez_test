import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/errors/field_validation_error.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/view_models/post_creation_page_vm.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';

import '../../../mocks.dart';

void main() {
  late PostCreationPageViewModel viewModel;
  late MockPostsRepository mockPostRepository;
  late MockUuidGenerator mockUuidGenerator;
  late MockMediaHandlerService mockMediaHandlerService;
  late MockGoRouter mockRouter;

  setUpAll(() {
    mockPostRepository = MockPostsRepository();
    mockUuidGenerator = MockUuidGenerator();
    mockMediaHandlerService = MockMediaHandlerService();
    mockRouter = MockGoRouter();

    viewModel = PostCreationPageViewModel(
      repository: mockPostRepository,
      uuidGenerator: mockUuidGenerator,
      mediaHandlerService: mockMediaHandlerService,
      router: mockRouter,
    );
    registerFallbackValue(MockContext());
    registerFallbackValue(PostDto(
        id: 'id',
        title: 'title',
        content: 'content',
        mediaUrl: 'mediaUrl',
        creationDate: 1));
  });

  test(
      'Should have empty controllers '
      'on initialization', () {
    expect(viewModel.titleController.text, isEmpty);
    expect(viewModel.contentController.text, isEmpty);
  });
  test(
      'Should have MediaUrl value equals to null '
      'on initialization', () {
    expect(viewModel.mediaUrl, isNull);
    expect(viewModel.isPostMediaVideo, false);
  });

  var videoPath = 'smth.mp4';
  test(
      'Should have mediaUrl value equals to path of mediafile '
      'on pick media ', () async {
    var mediaFile =
        MediaFile.file(id: 'id', file: File(videoPath), type: MediaType.video);
    when(() =>
            mockMediaHandlerService.pickMedia(context: any(named: 'context')))
        .thenAnswer((_) async => mediaFile);
    when(() => mockMediaHandlerService.getMediaPath(mediaFile))
        .thenAnswer((_) async => videoPath);

    await viewModel.tryPickMedia(context: MockContext());

    expect(viewModel.mediaUrl, videoPath);
  });

  test(
      'Should have isPostMediaVideo value equals to true '
      'on pick media '
      'when mediaUrl is of video format', () async {
    var mediaFile =
        MediaFile.file(id: 'id', file: File(videoPath), type: MediaType.video);
    when(() =>
            mockMediaHandlerService.pickMedia(context: any(named: 'context')))
        .thenAnswer((_) async => mediaFile);
    when(() => mockMediaHandlerService.getMediaPath(mediaFile))
        .thenAnswer((_) async => "smth.mp4");

    await viewModel.tryPickMedia(context: MockContext());

    expect(viewModel.isPostMediaVideo, true);
  });

  test(
      'Should have isPostMediaVideo value equals to false '
      'on pick media '
      'when mediaUrl is NOT of video format', () async {
    var path = 'smth.jpg';
    var mediaFile =
        MediaFile.file(id: 'id', file: File(path), type: MediaType.video);
    when(() =>
            mockMediaHandlerService.pickMedia(context: any(named: 'context')))
        .thenAnswer((_) async => mediaFile);
    when(() => mockMediaHandlerService.getMediaPath(mediaFile))
        .thenAnswer((_) async => "smth.jpg");

    await viewModel.tryPickMedia(context: MockContext());

    expect(viewModel.isPostMediaVideo, false);
  });

  test(
      'Should throw a FieldValidationError '
      'on tryCreatePost '
      'when validation failed', () async {
    formStateValidation() => false;

    expect(
      () async {
        return await viewModel.tryCreatePost(formStateValidation);
      },
      throwsA(isA<FieldValidationError>()),
    );
  });

  test(
      'Should generate uuid '
      'on tryCreatePost '
      'when validation passed', () async {
    formStateValidation() => true;
    when(() => mockUuidGenerator.generateUuid()).thenAnswer((_) => 'uuid');
    when(() => mockPostRepository.addPost(any())).thenAnswer((_) async {});
    when(() => mockRouter.go(any())).thenAnswer((_) async {});

    await viewModel.tryCreatePost(formStateValidation);

    verify(() => mockUuidGenerator.generateUuid()).called(1);
  });

  test(
      'Should call add post '
          'on tryCreatePost '
          'when validation passed', () async {
    mockPostRepository = MockPostsRepository();
    var newviewModel = PostCreationPageViewModel(
      repository: mockPostRepository,
      uuidGenerator: mockUuidGenerator,
      mediaHandlerService: mockMediaHandlerService,
      router: mockRouter,
    );
    formStateValidation() => true;
    when(() => mockUuidGenerator.generateUuid()).thenAnswer((_) => 'uuid');
    when(() => mockPostRepository.addPost(any())).thenAnswer((_) async {});
    when(() => mockRouter.go(any())).thenAnswer((_) async {});

    await newviewModel.tryCreatePost(formStateValidation);

    verify(() => mockPostRepository.addPost(any())).called(1);
  });

  test(
      'Should call router go to a feed '
          'on tryCreatePost '
          'when validation passed', () async {
    var newViewModel = PostCreationPageViewModel(
      repository: mockPostRepository,
      uuidGenerator: mockUuidGenerator,
      mediaHandlerService: mockMediaHandlerService,
      router: mockRouter = MockGoRouter(),
    );
    formStateValidation() => true;
    when(() => mockUuidGenerator.generateUuid()).thenAnswer((_) => 'uuid');
    when(() => mockPostRepository.addPost(any())).thenAnswer((_) async {});
    when(() => mockRouter.go(RoutePath.feed)).thenAnswer((_) async {});

    await newViewModel.tryCreatePost(formStateValidation);

    verify(() => mockRouter.go(RoutePath.feed)).called(1);
  });
}
