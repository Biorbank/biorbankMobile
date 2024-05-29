mixin Validation {
  final RegExp nameRegExp = RegExp('[a-zA-Z]');

  String? nameValidation({
    required String? value,
    required String slug,
  }) {
    String? res = (value?.isEmpty ?? true)
        ? 'Enter your $slug name'
        : (nameRegExp.hasMatch(value ?? "")
            ? null
            : 'Enter a valid $slug name');
    return res;
  }

  String? slugValidation({
    required String? value,
    int? length,
    required String slug,
  }) {
    if (value?.trim().isEmpty ?? true) {
      return '$slug can not be empty';
    }

    if (length != null && (value?.trim().length ?? 0) != length) {
      return '$slug must be at least $length characters long';
    }
    return null;
  }

  String? confirmValidate({
    required String? value,
    required String slug,
    required String confirm,
  }) {
    String? res = (value?.isEmpty ?? true)
        ? "Enter $slug"
        : (value != confirm ? 'Your $slug does not match' : null);
    return res;
  }

  // String? wordValidation({
  //   required String? value,
  //   required String confirm,

  // }) {
  //   String? res = (value?.trim().isEmpty ?? true)
  //       ? 'Enter your name'
  //       : (nameRegExp.hasMatch(value ?? "")
  //           ? null
  //           : 'Enter a valid name');
  //   return res;
  // }
}
