import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/grid.dart';
import 'package:tic_tac_toe/components/which_turn.dart';

class Game extends StatelessWidget {
  const Game({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(flex: 9, child: Grid()),
          Expanded(flex: 3, child: WhichTurn()),
        ],
      ),
    );
  }
}
