import 'package:flutter/material.dart';

class PhotoExample extends StatelessWidget {
  const PhotoExample({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.image_rounded,
          size: 250,
          color: Colors.blue,
        ),
      ),
    );
  }
}
