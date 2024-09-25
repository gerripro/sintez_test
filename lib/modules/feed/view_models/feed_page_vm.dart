import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/modules/feed/services/likes_service.dart';
import 'package:sintez_test/modules/feed/view_models/feed_list_item_vm.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';
import 'package:sintez_test/shared/utils/logger/logger.dart';

part 'feed_page_vm.g.dart';

class FeedPageViewModel = _FeedPageViewModel with _$FeedPageViewModel;

abstract class _FeedPageViewModel with Store {
  final GoRouter router;
  final PostRepository postsRepository;
  final LikesService likesService;

  _FeedPageViewModel(
      {required this.postsRepository,
      required this.likesService,
      required this.router}) {
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
      _posts = await postsRepository.getAllPosts();
    } catch (e) {
      debugLogger.e(e);
      rethrow;
    } finally {
      _postsFetching = false;
    }
  }

  void openPostCreation() {
    router.push(RoutePath.createPost);
  }

  FeedListItemViewModel createFeedListItemViewModel(PostDto postDto) {
    return FeedListItemViewModel(likesService: likesService, postDto: postDto);
  }
}
