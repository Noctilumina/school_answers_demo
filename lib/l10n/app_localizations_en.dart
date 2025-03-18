// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Gynzy questions';

  @override
  String get submitButton => 'Submit';

  @override
  String get feedbackText => 'Your answer';

  @override
  String get error => 'Error';
}
