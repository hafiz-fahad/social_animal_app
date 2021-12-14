import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  bool? multiSelectorForCommentActive = false;
  int? multiSelectorCommentCount = 0;
  List<MultiSelectBox> multiSelectForDeleteCommentList = [
    MultiSelectBox(isSelected: false),
    MultiSelectBox(isSelected: false),
    MultiSelectBox(isSelected: false),
    MultiSelectBox(isSelected: false),
  ];

  List drawerList = [
    'Home',
    'Activities',
    'Dog Blog',
    'Cat Chat',
    'Exotic Talk',
    'Vet Clinic',
    'Messages',
    'Locate Members',
    'Document Uploader & Reminder',
    'Setting',
    'Logout',
  ];
  drawerNavigation(
    int? index,
    BuildContext context,
  ) {
    switch (index) {
      case 0:
        {
          Navigator.pop(context);
          return Get.offAllNamed(PageRoutes.home);
        }
      case 1:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.activities);
        }
      case 2:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.dogBlog);
        }
      case 3:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.catChat);
        }
      case 4:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.exoticTalk);
        }
      case 5:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.vetClinic);
        }
      case 6:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.messages);
        }
      case 7:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.locateMembers);
        }
      case 8:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.documentUploaderAndReminder);
        }
      case 9:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.settings);
        }
      default:
        {
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          );
        }
    }
  }
}

class MultiSelectBox {
  MultiSelectBox({this.isSelected});

  bool? isSelected;
}
