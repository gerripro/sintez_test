import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/feed/view_models/feed_vm.dart';
import 'package:sintez_test/modules/feed/widgets/feed_list_item.dart';

class Feed extends StatelessWidget {
  final FeedViewModel viewModel;

  const Feed({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Observer(builder: (context) {
          var posts = viewModel.posts;
          if (viewModel.postsFetching) return const CircularProgressIndicator();
          if (viewModel.posts.isEmpty) {
            return const Center(
                child: Text("There are no news at this moment"));
          }
          return ListView.builder(
            itemCount: posts.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) {
              var post = posts[index];
              return FeedListItem(post: post);
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
