import 'package:flutter/material.dart';
import '../../../configs/themes/app_color.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';

class RouteTile extends StatefulWidget {
  const RouteTile({
    super.key,
    required this.type,
    required this.name,
    this.driver,
    required this.bus,
    this.color = logoBlack,
    this.onTap,
  });

  final String name;
  final String? driver;
  final String bus;
  final String type;
  final Color color;
  final Future<void> Function()? onTap;

  @override
  State<RouteTile> createState() => _RouteTileState();
}

class _RouteTileState extends State<RouteTile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultPadding)),
      color: isLoading ? widget.color.withOpacity(0.7) : widget.color,
      child: InkWell(
        onTap: widget.onTap != null
            ? isLoading
                ? null
                : tapFunction
            : null,
        hoverColor: widget.onTap != null ? Colors.black12 : null,
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white60,
                      )
                    : Chip(
                        label: Text(
                          widget.type,
                          style: kChipTextStyle,
                        ),
                      ),
                kWidthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: kTileTitle),
                    if (widget.driver != null)
                      Text(widget.driver!, style: kTileSubTitle),
                    Text(widget.bus, style: kTileSubTitle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void tapFunction() async {
    setState(() {
      isLoading = true;
    });

    // await widget.onTap();
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }
}
