// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/setting/presentation/controllers/setting_controller.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "settings".tr,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.toggleTheme();
            },
            child: Text("Change")),
      ),
      // body: Column(
      //   children: SettingEntity.settings
      //       .map(
      //         (setting) => _SettingItem(
      //           setting: setting,
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }
}

// class _SettingItem extends StatelessWidget {
//   const _SettingItem({Key? key, required this.setting}) : super(key: key);
//   final SettingEntity setting;

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
//           setting.title,
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
