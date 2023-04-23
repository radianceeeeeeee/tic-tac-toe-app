import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/title_letter.dart';
import 'package:tic_tac_toe/pages/game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GridView.count(
          padding: const EdgeInsets.all(72.0),
          shrinkWrap: true,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          crossAxisCount: 3,
          children: const <Widget>[
            TitleTile(letter: 'T'),
            TitleTile(letter: 'I'),
            TitleTile(letter: 'C'),
            TitleTile(letter: 'T'),
            TitleTile(letter: 'A'),
            TitleTile(letter: 'C'),
            TitleTile(letter: 'T'),
            TitleTile(letter: 'O'),
            TitleTile(letter: 'E'),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Game()));
            },
            child: const Text('Play Game'))
      ],
    );
  }
}
