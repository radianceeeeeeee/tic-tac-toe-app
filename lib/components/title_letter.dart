import 'package:flutter/material.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    required this.letter,
    super.key,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 72,
            color: Colors.grey,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
    );
  }
}
