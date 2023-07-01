// import 'package:flutter/material.dart';
// import 'package:flutter_project_structure/helper/constants/colors_resources.dart';
// import 'package:flutter_project_structure/helper/constants/dimensions_resources.dart';
// import 'package:flutter_project_structure/helper/constants/strings_resources.dart';
// import 'package:flutter_project_structure/helper/theme/text_styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/global_varibales.dart';

// class DialogUtils {
//   static Future<bool?> showAlertDialog(
//       {required BuildContext context,
//       required String title,
//       required String message}) async {
//     return await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title,
//               style:
//                   textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
//           content: Text(message,
//               style: textTheme.bodySmall
//                 ?..copyWith(fontWeight: FontWeight.w700)),
//           actions: <Widget>[
//             CustomButton(
//               btnText: StringsResouces.ok,
//               onPressed: () => Navigator.of(context).pop(true),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   static Future<bool?> customDialogWithTwoButtons({
//     required BuildContext context,
//     required String title,
//     required String message,
//     String? action,
//     bool error = false,
//     String? firstBtnText,
//     String? btnText,
//     Color? btnColor,
//     Color? titleColor,
//     Color? firstBtnColor,
//     Color? firstBtnTextColor,
//   }) async {
//     return await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: DimensionsResouces.p_15.w,
//               vertical: DimensionsResouces.p_20.h),
//           backgroundColor: ColorsResouces.whiteColor,
//           titlePadding: EdgeInsets.only(
//               left: DimensionsResouces.p_20.w,
//               right: DimensionsResouces.p_20.w,
//               top: DimensionsResouces.p_20.h),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(DimensionsResouces.r_12.r)),
//           title: CustomTextView(
//             textScaleFactor: true,
//             align: TextAlign.center,
//             text: title,
//             textStyle: textTheme.bodyLarge?.copyWith(
//                 fontWeight: FontWeight.w600,
//                 color: titleColor ?? ColorsResouces.primaryColor),
//           ),
//           content: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomTextView(
//                     textScaleFactor: true,
//                     text: message,
//                     textStyle: textTheme.bodyMedium?.copyWith(
//                         fontWeight: FontWeight.w400,
//                         color: ColorsResource.LIGHT_TEXT_COLOR)),
//                 SizedBox(height: DimensionsResouces.d_14.h),
//                 action != null
//                     ? CustomTextView(
//                         textScaleFactor: true,
//                         align: TextAlign.start,
//                         text: action,
//                         textStyle: textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: ColorsResource.LIGHT_TEXT_COLOR),
//                       )
//                     : Container(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                         child: CustomButton(
//                       textScaleFactor: true,
//                       btnText: firstBtnText ??
//                           Languages.of(context)?.STR_CLOSE ??
//                           "",
//                       btnColor: firstBtnColor ?? ColorsResource.COLOR_GREY,
//                       btnTextColor:
//                           firstBtnTextColor ?? ColorsResouces.whiteColor,
//                       onPressed: () {
//                         Navigator.of(context).pop(false);
//                       },
//                     )),
//                     if (btnText != null)
//                       SizedBox(width: DimensionsResouces.d_15.w),
//                     if (btnText != null)
//                       Expanded(
//                           child: CustomButton(
//                         textScaleFactor: true,
//                         btnText: btnText,
//                         btnColor: btnColor ?? ColorsResouces.primaryColor,
//                         onPressed: () => Navigator.of(context).pop(true),
//                       )),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static Future<bool?> showNoInternetDialog(
//       {required BuildContext context,
//       Function()? onRetry,
//       bool hideRetry = false}) async {
//     return await showDialog<bool>(
//       barrierDismissible: false,
//       context: context,
//       useRootNavigator: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: DimensionsResouces.p_15.w,
//               vertical: DimensionsResouces.p_20.h),
//           backgroundColor: ColorsResouces.whiteColor,
//           titlePadding: EdgeInsets.only(
//               left: DimensionsResouces.d_20.w,
//               right: DimensionsResouces.d_20.w,
//               top: DimensionsResouces.d_20.h),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(DimensionsResouces.r_12.r)),
//           title: CustomTextView(
//               text: StringsResouces.noInternet,
//               textStyle:
//                   textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
//           content: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomTextView(
//                   text: Languages.of(context)?.STR_CHECK_YOUR_INTERNET ?? '',
//                   textStyle: textTheme.bodyMedium,
//                 ),
//                 SizedBox(height: DimensionsResouces.d_25.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                         child: CustomOutlinedButton(
//                       btnText: StringsResouces.close,
//                       onPressed: () {
//                         Navigator.of(context).pop(true);
//                         //TODO check this code
//                         // if (hideRetry &&
//                         //     HiveBox()
//                         //         .getValue(key: SHOW_HOME_INTERNET_DIALOG) ==
//                         //         false) {
//                         //   Future.delayed(
//                         //     Duration(seconds: ENDPOINT_DELAY),
//                         //         () => HiveBox().setValue(
//                         //         key: SHOW_HOME_INTERNET_DIALOG, value: true),
//                         //   );
//                       },
//                     )),
//                     if (!hideRetry) SizedBox(width: DimensionsResouces.d_15.w),
//                     if (!hideRetry)
//                       Expanded(
//                           child: CustomButton(
//                         btnText: Languages.of(context)?.STR_RETRY ?? '',
//                         btnColor: ColorsResouces.primaryColor,
//                         onPressed: () {
//                           Navigator.pop(navigator.currentContext ?? context);
//                           onRetry!();
//                         },
//                       )),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
