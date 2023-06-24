import 'package:flutter/material.dart';
import 'package:flutter_random_joke/features/random_jokes/models/jokes_content.dart';
import 'package:flutter_random_joke/features/services/db_helper.dart';
import 'package:flutter_random_joke/features/shared_ui/button/base_btn.dart';

class RandomJokePage extends StatefulWidget {
  const RandomJokePage({super.key});

  @override
  State<RandomJokePage> createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  late int number = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number;
    // randomNumber(number);
  }

  // void updateJokeId(int jokeId) {}
  // int randomNumber(int number) {
  //   int max = jokesList.length;

  //   int randomNumber = Random().nextInt(max) + 1;
  //   return randomNumber;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DatabaseHelper.getAllJokes(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (number == jokesList.length) {
                return const Center(child: Text("Out of Jokes"));
              } else {
                List<Object> data = snapshot.data ?? [];
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.green),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'A joke a day keeps the doctor away',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'If you joke the wrong way your teeth will have to pay',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(snapshot.data![number].content ?? "null"),
                        ),
                      ),
                      // Center(child: Text(firstJoke.content)),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BaseButton(
                              title: 'This is funny',
                              btnColor: Colors.blue,
                              onTap: () {
                                // print(firstJoke.id);
                                print(snapshot.data![3].content);
                                setState(() {
                                  number++;
                                });
                              },
                            ),
                            BaseButton(
                              title: 'This is not funny',
                              btnColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  number++;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
          }
        }),
      ),
    );
  }
}
