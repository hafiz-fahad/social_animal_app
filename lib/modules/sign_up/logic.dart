import 'package:get/get.dart';

import 'state.dart';

class SignUpLogic extends GetxController {
  final state = SignUpState();

  String? selectedGender;
  List<String> genderDropDownList = ['Male', 'Female', 'Other'];
}
