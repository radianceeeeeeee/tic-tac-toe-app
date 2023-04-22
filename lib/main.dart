import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/grid.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/components/which_turn.dart';
import 'package:tic_tac_toe/providers/tile_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TileChange())],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe"),
        ),
        body: Column(
          children: const <Widget>[
            Expanded(flex: 9, child: Grid()),
            Expanded(flex: 3, child: WhichTurn()),
          ],
        ),
      ),
    );
  }
}
