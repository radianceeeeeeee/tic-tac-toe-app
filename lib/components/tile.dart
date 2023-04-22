import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants/results.dart';
import 'package:tic_tac_toe/constants/three_in_a_row.dart';
import 'package:tic_tac_toe/constants/tile_states.dart';
import 'package:tic_tac_toe/providers/tile_provider.dart';

class Tile extends StatefulWidget {
  const Tile({required this.content, required this.index, super.key});

  final TileState content;
  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    TileChange tiles = Provider.of<TileChange>(context);

    bool checkThreeInARow(int a, int b, int c) {
      if (tiles.tileStates[a] == TileState.empty) return false;

      if (tiles.tileStates[a] == tiles.tileStates[b] &&
          tiles.tileStates[b] == tiles.tileStates[c]) {
        return true;
      }
      return false;
    }

    bool isDraw() {
      for (var state in tiles.tileStates) {
        if (state == TileState.empty) {
          return false;
        }
      }
      return true;
    }

    return GestureDetector(
      onTap: () {
        tiles.move(widget.index);

        for (var row in threes) {
          if (checkThreeInARow(row[0], row[1], row[2])) {
            showAlertDialog(context, winner(tiles.tileStates[row[0]]), tiles);
            return;
          }
        }

        if (isDraw()) showAlertDialog(context, Results.draw, tiles);
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            if (tiles.tileStates[widget.index] == TileState.empty) {
              return Container();
            }

            if (tiles.tileStates[widget.index] == TileState.circle) {
              return const Icon(
                Icons.circle_outlined,
                size: 108,
                color: Colors.blue,
              );
            } else {
              return const Icon(
                Icons.close,
                size: 108,
                color: Colors.red,
              );
            }
          })),
    );
  }

  Results winner(TileState tile) =>
      (tile == TileState.circle) ? Results.circle : Results.cross;

  showAlertDialog(BuildContext context, Results result, TileChange tiles) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        tiles.reset();
      },
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "PLAY AGAIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      title: (result == Results.draw)
          ? const Text('Draw')
          : (result == Results.circle)
              ? const Text('Circle wins!')
              : const Text('Cross wins!'),
      actions: [
        okButton,
      ],
      contentPadding: const EdgeInsets.all(8.0),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
