import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Guess the Card'),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  bool leftButton = true;
  bool rightButton = true;
  int randomNumber = 1;
  int guessedTrue = 0;
  int guessedFalse = 0;
  int totalGuesses = 0;
  String getSuccessRatio() {
    if (totalGuesses == 0) {
      return '0.0%';
    }
    double successRatio = guessedTrue / totalGuesses * 100;
    return '${successRatio.toStringAsFixed(1)}%';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: rightButton
                ? Image.asset('images/card.jpg')
                : Image.asset('images/$randomNumber.png'),
          ),
          Text('Did you guess the card?'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 60,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: rightButton
                        ? null
                        : () => setState(() {
                              guessedTrue = guessedTrue + 1;
                              totalGuesses = totalGuesses + 1;
                            }),
                    child: Text('YES'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                  ),
                ),
              ),
              const SizedBox(
                  width: 10), // Add some spacing between the buttons.
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 60,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: rightButton
                        ? null
                        : () => setState(() {
                              guessedFalse = guessedFalse + 1;
                              totalGuesses = totalGuesses + 1;
                            }),
                    child: Text('NO'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 80,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        leftButton = !leftButton;
                        guessedTrue = 0;
                        guessedFalse = 0;
                        totalGuesses = 0;
                      });
                    },
                    child: Text('Restart'),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple.shade900)),


                  ),
                ),
              ),
              const SizedBox(
                  width: 10), // Add some spacing between the buttons.
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 80,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        randomNumber = Random().nextInt(52) + 1;
                        rightButton = !rightButton;
                      });
                    },
                    child: Text(rightButton ? ' Show ' : 'Next'),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple.shade900)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Your success ratio is ' + getSuccessRatio()),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: 130,
              height: 34,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text( 'See your result'),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple.shade900)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
