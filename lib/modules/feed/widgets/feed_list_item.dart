import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:sintez_test/modules/feed/view_models/feed_list_item_vm.dart';
import 'package:sintez_test/shared/constants/colors.dart';

class FeedListItem extends StatelessWidget {
  final FeedListItemViewModel viewModel;

  const FeedListItem({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = viewModel.postDto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge),
        Text(
          "Posted on: ${post.datePosted}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (post.isVideo)
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            alignment: Alignment.center,
            child: VideoProvider(
              media: MediaFile.file(
                  id: post.id,
                  file: File(post.mediaUrl!),
                  type: MediaType.video),
            ),
          ),
        if (post.mediaUrl != null && !post.isVideo)
          Container(
              constraints: const BoxConstraints(maxHeight: 300),
              alignment: Alignment.center,
              child: Image.file(
                File(post.mediaUrl!),
              )),
        Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
        Observer(builder: (context) {
          if (viewModel.isLoading) return const CircularProgressIndicator();
          var likeData = viewModel.likeData!;
          return InkWell(
            onTap: () async => await viewModel.handleLike(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  likeData.likedByCurrentUser
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color:
                      likeData.likedByCurrentUser ? AppColors.likeColor : null,
                ),
                Text(likeData.likeCount.toString()),
              ],
            ),
          );
        }),
      ],
    );
  }
}
