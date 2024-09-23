import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';

class FeedListItem extends StatelessWidget {
  final PostDto post;

  const FeedListItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        Text("Posted on: ${post.datePosted}"),
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.blue,
        ),
        Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
        Observer(builder: (context) {
          return InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.heart_fill,
                ),
                Text(post.likeCount.toString()),
              ],
            ),
          );
        }),
      ],
    );
  }
}
