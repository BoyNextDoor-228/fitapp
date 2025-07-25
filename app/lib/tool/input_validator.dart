import '../generated/l10n.dart';

class InputValidator {
  /// Contains forms input validators, which support localization passed in
  /// [s].
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

  /// Validates only correct non-negative fractional numbers.
  String? fractionalNumberValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return _enterAmount;
    }

    if (input.startsWith('.') || input.endsWith('.')) {
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

  /// Validates non-empty strings.
  String? titleValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return _enterTitle;
    }

    return null;
  }
}
