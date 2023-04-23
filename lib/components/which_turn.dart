import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers/tile_provider.dart';

class WhichTurn extends StatelessWidget {
  const WhichTurn({super.key});

  @override
  Widget build(BuildContext context) {
    bool whichTurn = context.watch<TileChange>().isCirclesTurn;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        whichTurn
            ? const Icon(
                Icons.circle_outlined,
                size: 72,
                color: Colors.grey,
              )
            : const Icon(
                Icons.close,
                size: 72,
                color: Colors.grey,
              ),
        const SizedBox(
          width: 15.0,
        ),
        const Text(
          "It's your turn now!",
          style: TextStyle(
              fontSize: 24.0, color: Colors.grey, fontFamily: 'Quicksand'),
        ),
      ],
    );
  }
}
