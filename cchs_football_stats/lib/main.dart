import 'dart:ffi';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:cchs_football_stats/models/game.dart';
import 'package:cchs_football_stats/models/play.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:flutter/material.dart';
import './models/game.dart';
import './models/season.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white),
          button: TextStyle(color: Colors.white),
          overline: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'CCHS Football Stats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Season> seasons = <Season>[];
  List<String> theLetters = <String>[];

  int getCurrentSeason() {
    if (seasons.length != 0) {
      for (int x = seasons.length - 1; x < 0; x--) {
        String year = seasons[x].years;
        if (year == DateTime.now().year.toString()) {
          return x;
        }
      }
      return -2;
    } else {
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // TOP NAVIGATION
      appBar: AppBar(
        backgroundColor: const Color(0xFF20343B),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              pickFile();
            },
            icon: Text("+",
                style: TextStyle(
                    color: Color.fromARGB(192, 224, 9, 9), fontSize: 30))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(size: 12.0),
      ),
      //
    );
  }

  pickFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      withData: true,
    );
    //withReadStream: true); // makes a file picker window
    if (file == null) return; // checks if you selected a file

    Directory directory = Directory("This PC/Documents/football games");

    print(directory.path.isEmpty);

    PlatformFile theFile = file.files.single;
    Uint8List? theByteCode = theFile.bytes;

    //print(String.fromCharCode(80));

    //int theString = theByteCode.forEach((element) {convert(element);});
    //theByteCode.remove();
    //theByteCode.forEach( => (int));
    //print("this is the byte code");
    //print(theFile.bytes);
    String theFileName = theFile.name;
    Game game = Game(); // makes a new game
    game.plays = [];
    int currentSeasonIndex = getCurrentSeason();
    if (currentSeasonIndex == -1) {
      Season season = Season();
      season.years = DateTime.now().year.toString();
      seasons.add(season);
      currentSeasonIndex = seasons.length - 1;
      season.games = [];
    }

    seasons[currentSeasonIndex].games.add(game);
    int currentGameIndex = seasons[currentSeasonIndex].games.indexOf(game);
    //print(seasons);
    if (theByteCode != null) {
      Excel excelFile = Excel.decodeBytes(theByteCode);
      List<List<Data?>> excelSheet = excelFile.sheets.values.single.rows;
      excelSheet.forEach(
          (element) => makePlay(element, currentGameIndex, currentSeasonIndex));
      //print(excelFile.toString());
      print(excelSheet.toString());
    } else {
      print("the byte code is null");
    }
  }

  void makePlay(List<Data?> data, int gameIndex, int seasonIndex) {
    Play play = Play();

    seasons[seasonIndex].games[gameIndex].plays.add(play);
  }
}
