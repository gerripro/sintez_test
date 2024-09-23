import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/feed/errors/field_validation_error.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';
import 'package:sintez_test/shared/utils/helpers/uuid_generator.dart';
import 'package:sintez_test/shared/utils/logger/logger.dart';

part 'post_creation_page_vm.g.dart';

class PostCreationPageViewModel = _PostCreationPageViewModel
    with _$PostCreationPageViewModel;

abstract class _PostCreationPageViewModel with Store {
  final PostRepository repository;
  final UuidGenerator uuidGenerator;
  final GoRouter router;

  _PostCreationPageViewModel(
      {required this.repository,
      required this.uuidGenerator,
      required this.router});

  final GlobalKey<FormState> postCreationFormKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<void> tryCreatePost() async {
    if (!postCreationFormKey.currentState!.validate()) throw FieldValidationError();
    var generatedId = uuidGenerator.generateUuid();
    var post = PostDto(
        id: generatedId,
        title: titleController.text,
        content: contentController.text,
        creationDate: DateTime.now().millisecondsSinceEpoch,
        mediaUrl: null);
    try {
      await repository.addPost(post);
      router.go(RoutePath.feed);
    } catch (e) {
      debugLogger.e(e);
      rethrow;
    }
  }
}
