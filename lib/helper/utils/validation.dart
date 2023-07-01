// class Validation {
//   static String? validateEmail(String? email) {
//     if (email?.isEmpty ?? true) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.EMAIL_REQUIRED;
//     } else if (!(email?.isValidEmail ?? true)) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.STR_INVALID_EMAIL;
//     } else {
//       return null;
//     }
//   }

//   static String? validateUserName(String? userName) {
//     if (userName?.isEmpty ?? true) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.USERNAME_REQUIRED;
//     } else if (!(userName?.isValidUserName ?? true)) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.STR_INVALID_USERNAME;
//     } else {
//       return null;
//     }
//   }

//   static String? validatePassword(String? password,
//       {String? confirmPassword, String? newPassword}) {
//     if (password?.isEmpty ?? true) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.PASSWORD_REQUIRED;
//     } else if (!(password?.isValidPassword ?? true)) {
//       return Languages.of(NavigationService.navigatorKey.currentContext!)
//           ?.STR_INVALID_PASSWORD;
//     } else if (confirmPassword != null) {
//       if (confirmPassword.isEmpty) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.CONFIRM_PASSWORD_REQUIRED;
//       } else if (!(confirmPassword.isValidPassword)) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.STR_INVALID_PASSWORD;
//       } else if (password != confirmPassword) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.PASSWORD_MISMATCH;
//       } else {
//         return null;
//       }
//     } else if (newPassword != null) {
//       if (newPassword.isEmpty) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.NEW_PASSWORD_REQUIRED;
//       } else if (!(newPassword.isValidPassword)) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.STR_INVALID_PASSWORD;
//       } else if (password != newPassword) {
//         return Languages.of(NavigationService.navigatorKey.currentContext!)
//             ?.PASSWORD_MISMATCH;
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }
// }
