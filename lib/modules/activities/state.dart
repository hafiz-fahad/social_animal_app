import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesState {
  TextStyle? postTileTextStyle;
  TextStyle? postLikeBarTextStyle;

  ActivitiesState() {
    ///Initialize variables
    postTileTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 16, color: customThemeColor);
    postLikeBarTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black);
  }
}
