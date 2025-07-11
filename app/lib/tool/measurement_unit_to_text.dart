import 'package:fitapp_domain/domain.dart';

import '../generated/l10n.dart';

String measurementUnitToText(MeasurementUnit measurementUnit, S text) {
  switch (measurementUnit) {
    case MeasurementUnit.milliliters:
      return text.millilitersShort;
    case MeasurementUnit.grams:
      return text.gramsShort;
  }
}
