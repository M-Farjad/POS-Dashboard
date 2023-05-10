import 'package:flutter/material.dart';

import './app_color.dart';

const appBarTitleText =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: iconColor);
const questionText = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const headerText =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black);
const appBarTS = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const msTitleText =
    TextStyle(color: textColorDark, fontWeight: FontWeight.w400, fontSize: 15);

const greyText = TextStyle(color: Colors.black54, fontWeight: FontWeight.w700);
final whiteElevatedButton = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black87,
  textStyle: kTextStyle,
);

const kTextStyle = TextStyle(color: Colors.black);
const kHintStyle = TextStyle(color: Colors.black38);
const kTitleTextStyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

Widget kTextFormLabel(String label) {
  return Container(
    padding: const EdgeInsets.all(7),
    decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
    child: Text(label),
  );
}

const kChipTextStyle = TextStyle(
  color: logoBlack,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const kTileTitle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const kTileSubTitle = TextStyle(
  color: Colors.white70,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
