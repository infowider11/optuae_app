import 'package:flutter/material.dart';

import '../constants/global_Keys.dart';


showSnackbar(String text, {int seconds = 4}){
  ScaffoldMessenger.of(MyGlobalKeys.navigatorKey.currentContext!).showSnackBar(
    SnackBar(content: Text(text),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    )
  );
}


// import 'package:flutter/material.dart';
//
// import '../constants/global_Keys.dart';
//
// class showSnackbar extends StatelessWidget {
//
//   const showSnackbar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     showSnackbar( String text){
//       ScaffoldMessenger.of(MyGlobalKeys.navigatorKey.currentContext!).showSnackBar(
//           SnackBar(content: Text(text),
//             duration: Duration(milliseconds: 1500),
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             behavior: SnackBarBehavior.floating,
//           )
//       );
//     }
//     return SnackBar(
//       content: const Text('Yay! A SnackBar!'),
//       action: SnackBarAction(
//         label: 'Undo',
//         onPressed: () {
//           // Some code to undo the change.
//         },
//       ),
//     );
//   }
// }
