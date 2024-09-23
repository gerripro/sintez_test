import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:sintez_test/modules/media_picker/wrappers/gallery_picker_wrapper.dart';

class MediaHandlerService {
  final GalleryPickerWrapper galleryPickerWrapper;

  MediaHandlerService({required this.galleryPickerWrapper});

  Future<MediaFile?> pickMedia({required BuildContext context}) async {
    return await galleryPickerWrapper.pickMedia(context: context);
  }

  Future<String> getMediaPath(MediaFile mediaFile) async {
    var file = await mediaFile.getFile();
    return file.path;
  }
}