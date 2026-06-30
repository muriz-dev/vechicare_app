import 'package:flutter/material.dart';

class CancelScanningButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelScanningButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Text(
        'Batalkan',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
