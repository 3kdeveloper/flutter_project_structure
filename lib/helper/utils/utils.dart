// Future<Locale> getLocale() async {
//   String languageCode =
//       await HiveBox.getValue(key: CommonKeys.STR_APP_LANGUAGE) ??
//           StringsResource.STR_ENGLISH_LANG_CODE;

//   return localeLang(languageCode);
// }

// Locale localeLang(String languageCode) {
//   return languageCode.isNotEmpty
//       ? Locale(languageCode, '')
//       : const Locale(StringsResource.STR_ENGLISH_LANG_CODE, '');
// }

// /// Formatted Time look like 12:00 PM
// String dateTimeFormater(
//     {String? format, required String milliSecondsScienceEpoch}) {
//   return DateFormat(format ?? ConstantsResource.TIME_FORMAT).format(
//       DateTime.fromMillisecondsSinceEpoch(int.parse(milliSecondsScienceEpoch)));
// }

// /// Get current day
// final today = DateTime.now();
// String todayDate =
//     "${today.year}${today.month.toString().padLeft(2, "0")}${today.day.toString().padLeft(2, "0")}";
