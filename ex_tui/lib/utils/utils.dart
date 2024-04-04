import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static const Color primaryColor = Color.fromRGBO(10, 78, 138, 1);
  static const Color secondaryColor = Color.fromRGBO(193, 224, 251, 1);
  static const Color thirdColor = Color.fromRGBO(134, 199, 255, 1);

  static customInputBox(String text, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 40),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 0),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Utils.primaryColor,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Utils.primaryColor,
            ),
          ),
          label: Text(
            text,
            style: GoogleFonts.poppins(
              color: Utils.primaryColor,
            ),
          ),
          prefixIcon: Icon(
            iconData,
            color: Utils.primaryColor,
          ),
        ),
      ),
    );
  }
}
