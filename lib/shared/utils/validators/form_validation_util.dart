abstract class FormValidationUtil {
  static String? requiredField(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}