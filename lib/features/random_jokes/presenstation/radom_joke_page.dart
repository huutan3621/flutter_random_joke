import 'package:flutter/material.dart';
import 'package:flutter_random_joke/features/random_jokes/models/jokes_content.dart';
import 'package:flutter_random_joke/features/random_jokes/models/jokes_model.dart';
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
    // number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Image.asset("assets/logo.png"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
              Text(
                "Vo Huu Tan",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "abc@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.jpg")))
        ],
      ),
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
              if (number >= jokesList.length) {
                return const Center(
                    child: Text("That's all for today. Comeback later"));
              } else {
                // List<Object> data = snapshot.data ?? [];
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(snapshot.data![number].content ?? "null"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BaseButton(
                              title: 'This is funny',
                              btnColor: Colors.blue,
                              onTap: () {
                                setState(() {
                                  number++;
                                });
                                if (number < jokesList.length) {
                                  DatabaseHelper.updateJoke(
                                    Jokes(
                                        id: snapshot.data![number].id,
                                        content: snapshot.data![number].content,
                                        hasRead: 1,
                                        hasLiked: 1),
                                  );
                                }
                                print(snapshot.data![number - 1].hasLiked);
                              },
                            ),
                            BaseButton(
                              title: 'This is not funny',
                              btnColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  number++;
                                });
                                if (number < jokesList.length) {
                                  DatabaseHelper.updateJoke(
                                    Jokes(
                                        id: snapshot.data![number].id,
                                        content: snapshot.data![number].content,
                                        hasRead: 1,
                                        hasLiked: 0),
                                  );
                                }
                                print(snapshot.data![number - 1].hasLiked);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.3,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text("Copyright 2023")
                          ],
                        ),
                      ),
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
