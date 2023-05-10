import 'package:flutter/material.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../responsive.dart';
import './components/body.dart';

class DLoginScreen extends StatelessWidget {
  const DLoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Responsive.screenHeightPadding(context),
        child: const Center(
          child: SingleChildScrollView(
            padding: defaultEdgePadding,
            child: Body(),
          ),
        ),
      ),
    );
  }
}
