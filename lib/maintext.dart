import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

class Content extends StatefulWidget {
  const Content({super.key});
  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<Icon> scorekeeper = [];

  void checkAnswer(bool userpickedanswer) {
    bool check = quizbrain.getanswer();
    setState(() {
      if (quizbrain.isfinished() == true) {
        Alert(
                context: context,
                title: "Finished",
                desc: "You are done with the Quiz")
            .show();
        quizbrain.reset();
        scorekeeper = [];
      } else {
        if (userpickedanswer == check) {
          scorekeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizbrain.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizbrain.getQuestiontext(),
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Container(
                    color: Colors.green,
                    // width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Container(
                    color: Colors.red,
                    // width: MediaQuery.of(context).size.width,
                    child: const Center(
                        child: Text(
                      "False",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              // create a row to store the answer of the var:
              Row(
                children: scorekeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
