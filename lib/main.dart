import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String winner = 'Play Dice';
  List diceOne = [1, 2, 3, 4, 5, 6];
  void rollDiceOne() {
    diceOne.shuffle();
  }

  List diceTwo = [1, 2, 3, 4, 5, 6];
  void rollDiceTwo() {
    diceTwo.shuffle();
  }

  void rolldice() {
    if (diceOne[0] > diceTwo[0]) {
      winner = 'Player One is Winner';
    } else if (diceOne[0] < diceTwo[0]) {
      winner = 'Player Two is Winner';
    } else {
      winner = 'Tie';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(winner),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      rollDiceOne();
                      rolldice();
                    });
                  },
                  child: Image(
                    image: AssetImage('images/dice${diceOne[0]}.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      rollDiceTwo();
                      rolldice();
                    });
                  },
                  child: Image(
                    image: AssetImage('images/dice${diceTwo[0]}.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
