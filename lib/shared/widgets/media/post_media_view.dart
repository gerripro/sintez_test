import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class PostMediaView extends StatelessWidget {
  final String? mediaUrl;
  final bool isVideo;

  const PostMediaView({Key? key, required this.mediaUrl, required this.isVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isVideo) {
      return Container(
        constraints: const BoxConstraints(maxHeight: 300),
        alignment: Alignment.center,
        child: VideoProvider(
          media: MediaFile.file(
              id: UniqueKey().toString(),
              file: File(mediaUrl!),
              type: MediaType.video),
        ),
      );
    }

    if (mediaUrl != null && !isVideo) {
      return Container(
          constraints: const BoxConstraints(maxHeight: 300),
          alignment: Alignment.center,
          child: Image.file(
            File(mediaUrl!),
          ));
    }
    return const SizedBox();
  }
}
