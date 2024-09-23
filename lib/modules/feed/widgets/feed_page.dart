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
            physics: const BouncingScrollPhysics(),
            itemCount: posts.length,
            padding: const EdgeInsets.only(
                left: Spacings.small,
                right: Spacings.small,
                top: Spacings.small,
                bottom: Spacings.large * 2),
            separatorBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: Spacings.small / 2),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(height: Spacings.small / 2),
                ],
              );
            },
            itemBuilder: (context, index) {
              var post = posts[index];
              return FeedListItem(
                  viewModel: viewModel.createFeedListItemViewModel(post));
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
