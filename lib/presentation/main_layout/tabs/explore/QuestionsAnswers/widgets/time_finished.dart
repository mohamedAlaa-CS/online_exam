import 'package:flutter/material.dart';

class TimeFinished extends StatelessWidget {
  const TimeFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Time's Up!"),
      content: const Text("The exam has ended."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/nextPage');
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
