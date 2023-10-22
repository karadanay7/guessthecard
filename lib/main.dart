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
        body: const CardPage(),
      ),
    ),
  );
}

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool leftButton = true;
  bool rightButton = true;
  bool isGuessed = false;
  int randomNumber = 1;
  int guessedTrue = 0;
  int guessedFalse = 0;
  int totalGuesses = 0;
  String getSuccessRatio() {
    if (totalGuesses == 0) {
      return '0.0%';
    }
    double successRatio = (guessedTrue / totalGuesses) * 100;
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
          const Text('Did you guess the card?',style: TextStyle(
              fontFamily: " Indie FLower",
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(
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
                    onPressed: rightButton || isGuessed
                        ? null
                        : () => setState(() {
                              guessedTrue = guessedTrue + 1;
                              totalGuesses = totalGuesses + 1;
                              isGuessed = true;
                            }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    child: const Text('YES', style: TextStyle(
                        fontFamily: " Indie FLower",
                      fontWeight: FontWeight.bold
                    ),),
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
                    onPressed: rightButton || isGuessed
                        ? null
                        : () => setState(() {
                              guessedFalse = guessedFalse + 1;
                              totalGuesses = totalGuesses + 1;
                              isGuessed = true;
                            }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text('NO',style: TextStyle(
                        fontFamily: " Indie FLower",
                        fontWeight: FontWeight.bold
                    ),),
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
                        isGuessed = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple.shade900)),
                    child: const Text('Restart',style: TextStyle(
                        fontFamily: " Indie FLower",
                        fontWeight: FontWeight.bold
                    ),),
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
                        isGuessed = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple.shade900)),
                    child: Text(rightButton ? ' Show ' : 'Next',style: const TextStyle(
                          fontFamily: " Indie FLower",
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Your success ratio is ${getSuccessRatio()}',style: const TextStyle(
              fontFamily: " Indie FLower",
              fontWeight: FontWeight.w400
          ),),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: 130,
              height: 34,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResultRoute()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurple.shade900)),
                child: const Text('See your result',style: TextStyle(
                    fontFamily: " Indie FLower",
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultRoute extends StatelessWidget {
  const ResultRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Go Back'),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: const [
            Card(
                child: ListTile(
              leading: Image(image: AssetImage('images/result1.png')),
              title: Text('0% to 1% ',style: TextStyle(
                  fontFamily: " Indie FLower",
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(
                  'You are taking your first steps into the world of card guessing. Do not  be discouraged by the low ratio. Every guess brings you closer to success!',style: TextStyle(
                  fontFamily: " Indie FLower",
                  color: Colors.black87
              ),),
            )),
            SizedBox(
              height: 60,
            ),
            Card(
                child: ListTile(
              leading: Image(image: AssetImage('images/result2.png')),
              title: Text('1% to 5% ',style: TextStyle(
                  fontFamily: " Indie FLower",
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(
                  'Well done, intermediates! You are making strides in this challenging game. Keep honing your skills, and you will soon be in the ranks of the experts!',style: TextStyle(
                  fontFamily: " Indie FLower",
                  color: Colors.black87,
              ),),
            )),
            SizedBox(
              height: 60,
            ),
            Card(
                child: ListTile(
              leading: Image(image: AssetImage('images/result3.png')),
              title: Text('5% and above',style: TextStyle(
                  fontFamily: " Indie FLower",
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(
                  'You are in the top tier of card guessers! Your consistent success ratio shows your exceptional ability. Keep aiming for perfection and inspire others!',style: TextStyle(
                  fontFamily: " Indie FLower",
                  color: Colors.black87,
              ),),

            )),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Each practice session brings you closer to perfection. Stay committed to your training, and you will achieve great results!', style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 21,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
