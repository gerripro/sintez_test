import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class GalleryPickerWrapper {
  Future<MediaFile?> pickMedia({required BuildContext context}) async {
    List<MediaFile>? media = await GalleryPicker.pickMedia(
        context: context,
        singleMedia: true,
        startWithRecent: true);
    return media?.first;
  }
}