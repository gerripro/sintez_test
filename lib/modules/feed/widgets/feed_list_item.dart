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
      children: [
        Text(post.title),
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Text(post.content),
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
        Text("Posted on: ${post.datePosted}"),
      ],
    );
  }
}
