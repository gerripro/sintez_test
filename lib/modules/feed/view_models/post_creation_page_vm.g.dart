// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_creation_page_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostCreationPageViewModel on _PostCreationPageViewModel, Store {
  late final _$mediaUrlAtom =
      Atom(name: '_PostCreationPageViewModel.mediaUrl', context: context);

  @override
  String? get mediaUrl {
    _$mediaUrlAtom.reportRead();
    return super.mediaUrl;
  }

  @override
  set mediaUrl(String? value) {
    _$mediaUrlAtom.reportWrite(value, super.mediaUrl, () {
      super.mediaUrl = value;
    });
  }

  late final _$pickMediaAsyncAction =
      AsyncAction('_PostCreationPageViewModel.pickMedia', context: context);

  @override
  Future<void> pickMedia({required BuildContext context}) {
    return _$pickMediaAsyncAction.run(() => super.pickMedia(context: context));
  }

  @override
  String toString() {
    return '''
mediaUrl: ${mediaUrl}
    ''';
  }
}
