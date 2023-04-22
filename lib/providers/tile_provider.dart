import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/tile_states.dart';

class TileChange with ChangeNotifier {
  final List<TileState> _tileStates = [
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty,
    TileState.empty
  ];

  bool _isCirclesTurn = true;

  List<TileState> get tileStates => _tileStates;
  bool get isCirclesTurn => _isCirclesTurn;

  void move(int index) {
    if (_tileStates[index] != TileState.empty) return;

    if (_isCirclesTurn) {
      _tileStates[index] = TileState.circle;
    } else {
      _tileStates[index] = TileState.cross;
    }
    _isCirclesTurn = !_isCirclesTurn;
    notifyListeners();
  }

  void reset() {
    for (int index = 0; index < 9; index++) {
      _tileStates[index] = TileState.empty;
    }
    _isCirclesTurn = true;
    notifyListeners();
  }
}
