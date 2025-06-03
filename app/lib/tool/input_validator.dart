import '../generated/l10n.dart';

class InputValidator {
  InputValidator({required S s}) {
    _enterAmount = s.enterAmount;
    _enterTitle = s.enterTitle;
    _makeSureFractionalNumberIsCorrect = s.makeSureFractionalNumberIsCorrect;
    _enterValidNumber = s.enterValidNumber;
    _numberMustBeNonNegative = s.numberMustBeNonnegative;
  }

  late final String _enterAmount;
  late final String _makeSureFractionalNumberIsCorrect;
  late final String _enterValidNumber;
  late final String _numberMustBeNonNegative;

  late final String _enterTitle;

  String? fractionalNumberValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return _enterAmount;
    }

    if (input.split('').first == '.' || input.split('').last == '.') {
      return _makeSureFractionalNumberIsCorrect;
    }

    final number = double.tryParse(input);

    if (number == null) {
      return _enterValidNumber;
    }

    if (number.isNegative) {
      return _numberMustBeNonNegative;
    }
    return null;
  }

  String? titleValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return _enterTitle;
    }

    return null;
  }
}
