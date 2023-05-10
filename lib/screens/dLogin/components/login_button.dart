import 'package:flutter/material.dart';

import '../../../configs/themes/app_color.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = logoBlack,
  });
  final Future<void> Function() onTap;
  final Color color;
  final String text;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: widget.color,
      ),
      onPressed: isLoading ? null : asyncFunction,
      child: SizedBox(
        height: 20,
        child: isLoading
            ? const SizedBox(
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: logoBlack,
                ),
              )
            : const Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
      ),
    );
  }

  asyncFunction() async {
    setState(() {
      isLoading = true;
    });
    await widget.onTap();
    setState(() {
      isLoading = false;
    });
  }
}
