// import 'package:flutter/material.dart';
//
// extension CallConfirmationDialog on StatelessWidget {
//   Future<void>
//       callConfirmationDialog<T extends void Function(BuildContext context)>({
//     required BuildContext context,
//     required String dialogTitle,
//     required String actionDescription,
//     required String negativeActionTitle,
//     required String positiveActionTitle,
//     required T onConfirm,
//   }) async =>
//           showDialog(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               title: Text(dialogTitle),
//               content: Text(actionDescription),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text(negativeActionTitle),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     onConfirm(context);
//                     Navigator.pop(context);
//                   },
//                   child: Text(positiveActionTitle),
//                 ),
//               ],
//             ),
//           );
// }
