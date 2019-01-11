import 'package:flutter/cupertino.dart';

class Validators {
  static emailValidator(TextEditingController controller) {
    var regex = new RegExp(
      r"\S+@\S+\.\S+",
      caseSensitive: false,
      multiLine: false,
    );

    if (controller.text.isEmpty)
      return false;
    else if (!controller.text.contains(regex)) return false;

    return true;
  }
}
