class Validator {
  Validator._(_);
  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static ValidationState validate(String? input,
      {required List<String> rules}) {
    for (var i = 0; i < rules.length; i++) {
      final String rule = rules[i];
      if (rule == "required") {
        if (input == null || input.trim() == "") {
          return ValidationState(error: " is required");
        }
      }
      if (rule == "postId") {
        if (input == null || input == "") {
          return ValidationState(error: " is required");
        }
      }

      if (rule == "description") {
        if (input == null || input == "") {
          return ValidationState(error: " is required");
        }
      }

      if (rule == "email") {
        if (input == null || input == "") {
          return ValidationState(error: " is required");
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: "format is invalid");
        }
      }

      if (rule == "firstName") {
        if (input == null || input == "") {
          return ValidationState(error: " is required");
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: "format is invalid");
        }
      }

      if (rule == "lastName") {
        if (input == null || input == "") {
          return ValidationState(error: " is required");
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: "format is invalid");
        }
      }

      if (rule.startsWith("min:")) {
        try {
          final int letterCount = int.tryParse(rule.replaceAll("min:", ""))!;
          if (input!.length < letterCount) {
            return ValidationState(
                error: " should be min $letterCount character long");
          }
        } catch (_) {
          return ValidationState(error: " - $rule is incorrect");
        }
      }

      if (rule == "number_only") {
        final RegExp regex = RegExp(r"(\d+)");
        if (!regex.hasMatch(input!)) {
          return ValidationState(error: ' is not a number');
        }
      }
    }

    return ValidationState(status: true);
  }
}

class ValidationState {
  bool status;
  String? error;

  ValidationState({this.status = false, this.error});
}
