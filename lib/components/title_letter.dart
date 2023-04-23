import 'package:flutter/material.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    required this.letter,
    super.key,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Text(
              letter,
              style: TextStyle(
                fontSize: constraints.maxHeight * 0.75,
                color: Colors.grey,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
        );
      },
    );
  }
}
