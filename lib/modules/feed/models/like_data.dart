class LikeData {
  final String postId;
  final int likeCount;
  final bool likedByCurrentUser;

  LikeData(
      {required this.postId,
      required this.likeCount,
      required this.likedByCurrentUser});
}
