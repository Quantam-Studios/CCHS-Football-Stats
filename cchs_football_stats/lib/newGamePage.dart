import 'package:flutter/material.dart';
import './addFileFunction.dart';

class NewGameButtonPage extends StatelessWidget {
  const NewGameButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      body: Center(
          child: FloatingActionButton(
        onPressed: () {
          pickFile();
        },
        backgroundColor: const Color(0xFFFF0000),
        hoverColor: const Color(0x88FF0000),
        child: Text("+"),
      )),
    );
  }
}
