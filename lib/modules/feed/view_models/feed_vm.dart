import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/shared/utils/logger/logger.dart';

part 'feed_vm.g.dart';

class FeedViewModel = _FeedViewModel with _$FeedViewModel;

abstract class _FeedViewModel with Store {
  final GoRouter router;
  final PostRepository repository;

  _FeedViewModel({required this.repository, required this.router}) {
    getPosts();
  }

  @computed
  List<PostDto> get posts => _posts;

  @observable
  List<PostDto> _posts = [];

  @computed
  bool get postsFetching => _postsFetching;

  @observable
  bool _postsFetching = true;

  @action
  Future<void> getPosts() async {
    _postsFetching = true;
    try {
      _posts = await repository.getAllPosts();
      // _posts = [
      //   PostDto(id: '1', title: 'post1', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post2', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post3', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post4', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post5', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post6', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post7', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      //   PostDto(id: '1', title: 'post8', content: 'cont1', mediaUrl: 'mediaUrl', creationDate: 1727054178, likeCount: 0),
      // ];
    } catch (e) {
      debugLogger.e(e);
    } finally {
      _postsFetching = false;
    }
  }
}
