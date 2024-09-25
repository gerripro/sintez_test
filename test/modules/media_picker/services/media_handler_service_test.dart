import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/media_picker/services/media_handler_service.dart';

import '../../../mocks.dart';

void main() {
  late MockGalleryPickerWrapper mockGalleryPickerWrapper;
  late MediaHandlerService mediaHandlerService;

  setUpAll(() {
    mockGalleryPickerWrapper = MockGalleryPickerWrapper();
    mediaHandlerService =
        MediaHandlerService(galleryPickerWrapper: mockGalleryPickerWrapper);
    registerFallbackValue(MockContext());
  });

  test(
      'should call pick media from gallery picker '
          'on pick media ', () async {
    when(() =>
        mockGalleryPickerWrapper.pickMedia(context: any(named: 'context')))
        .thenAnswer((_) async =>
        MediaFile.file(
            id: 'id', file: File('smth.mp4'), type: MediaType.video));

    mediaHandlerService.pickMedia(context: MockContext());

    verify(() =>
        mockGalleryPickerWrapper.pickMedia(
          context: any(named: 'context'),
        )).called(1);
  });

  test(
      'should return a file path string '
          'on get media path ',
          () async {
        var path = 'smth.mp4';

        var mediaPath = await mediaHandlerService.getMediaPath(MediaFile.file(
            id: 'id', file: File(path), type: MediaType.video));

        expect(mediaPath, path);
      });
}
