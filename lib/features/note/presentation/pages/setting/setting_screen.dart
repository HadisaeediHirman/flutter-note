// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/setting_controller.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "settings".tr,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.toggleTheme,
              child: Text("Change"),
            ),
            ElevatedButton(
              onPressed: controller.toggleLocale,
              child: Text("Change Language"),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: controller.settings
      //       .map((item) =>
      //           _SettingItem(title: item.keys.first, items: item.values.first))
      //       .toList(),
      // ),
    );
  }
}

// class _SettingItem extends StatelessWidget {
//   const _SettingItem({
//     Key? key,
//     required this.title,
//     required this.items,
//   }) : super(key: key);
//   final String title;
//   final List<String> items;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       margin: EdgeInsets.all(AppSpacings.xl),
//       decoration: BoxDecoration(
//         // color: Colors.red,
//         borderRadius: BorderRadius.circular(AppSpacings.l),
//       ),
//       child: ExpansionTile(
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//           ),
//         ),
//         trailing: Text(setting.value),
//         children: [
//           Container(
//             padding: const EdgeInsets.all(AppSpacings.xl),
//             child: Row(
//               children: [
//                 Icon(setting.icon),
//                 const SizedBox(width: AppSpacings.m),
//                 Text(
//                   setting.title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//     //   return InkWell(
//     //     child: Container(
//     //       padding: const EdgeInsets.all(AppSpacings.xl),
//     //       child: Row(
//     //         children: [
//     //           Icon(setting.icon),
//     //           const SizedBox(width: AppSpacings.m),
//     //           Text(
//     //             setting.title,
//     //             style: const TextStyle(
//     //               fontSize: 20,
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   );
//   }
// }
