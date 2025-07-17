import 'package:fitapp_domain/domain.dart';

import '../generated/l10n.dart';

/// Turns [MeasurementUnit] into a short [String] and returns it.
///
/// [measurementUnit] is the unit to be turned into a [String].
/// [text] is the localization tool.
///
/// Example:
/// ``` dart
/// final text = S.of(context);
///
/// // will print 'gr.' (stands for 'grams')
/// print(measurementUnitToText(MeasurementUnit.grams, text));
///
/// // will print 'ml.' (stands for 'milliliters')
/// print(measurementUnitToText(MeasurementUnit.milliliters, text));
/// ```
String measurementUnitToText(MeasurementUnit measurementUnit, S text) {
  switch (measurementUnit) {
    case MeasurementUnit.milliliters:
      return text.millilitersShort;
    case MeasurementUnit.grams:
      return text.gramsShort;
  }
}
