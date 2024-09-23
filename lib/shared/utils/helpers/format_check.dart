abstract class FormatCheckHelper {
  static bool isVideo(String? mediaUrl) {
    if (mediaUrl == null) return false;
    String extension = mediaUrl.split('.').last.toLowerCase();
    return extension == "mp4" ||
        extension == "mov" ||
        extension == "wmv" ||
        extension == "m4v" ||
        extension == "3gp" ||
        extension == "avi" ||
        extension == "mpeg" ||
        extension == "mkv" ||
        extension == "webm";
  }
}