import 'package:flutter/material.dart';
import 'package:sintez_test/modules/feed/errors/field_validation_error.dart';
import 'package:sintez_test/modules/feed/view_models/post_creation_page_vm.dart';
import 'package:sintez_test/shared/constants/spacings.dart';
import 'package:sintez_test/shared/utils/notifiers/snackbars.dart';
import 'package:sintez_test/shared/widgets/input_fields/text_form_field.dart';

class PostCreationPage extends StatelessWidget {
  final PostCreationPageViewModel viewModel;

  const PostCreationPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.postCreationFormKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacings.medium),
                child: Column(
                  children: [
                    STextFormField(
                      controller: viewModel.titleController,
                      labelText: "Title",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is mandatory";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Spacings.small),
                    STextFormField(
                      controller: viewModel.contentController,
                      labelText: "Content",
                      maxLines: 5,
                    ),
                    const SizedBox(height: Spacings.small),
                    ElevatedButton(
                        onPressed: () async {
                          await viewModel.pickMedia(context: context);
                        },
                        child: const Text("Upload media file")),
                    const SizedBox(height: Spacings.small),
                    MaterialButton(
                      onPressed: () async {
                        try {
                          await viewModel.tryCreatePost();
                        } catch (e) {
                          if (e is FieldValidationError) {
                            SnackBars.callRegularSnackBar(
                                context: context,
                                text: "Please fill in the required fields");
                          }
                        }
                      },
                      color: Colors.blueAccent,
                      child: const Text("Create Post"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
