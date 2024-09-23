import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/feed/view_models/feed_page_vm.dart';
import 'package:sintez_test/modules/feed/widgets/feed_list_item.dart';
import 'package:sintez_test/shared/constants/spacings.dart';

class FeedPage extends StatelessWidget {
  final FeedPageViewModel viewModel;

  const FeedPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          var posts = viewModel.posts;
          if (viewModel.postsFetching) return const CircularProgressIndicator();
          if (viewModel.posts.isEmpty) {
            return const Center(
                child: Text("There are no news at this moment"));
          }
          return ListView.separated(
            itemCount: posts.length,
            padding: const EdgeInsets.all(Spacings.small),
            separatorBuilder: (context, index) {
              return const SizedBox(height: Spacings.small);
            },
            itemBuilder: (context, index) {
              var post = posts[index];
              return FeedListItem(post: post);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.openPostCreation(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
