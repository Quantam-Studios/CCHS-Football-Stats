// General
import 'dart:io';
import 'package:flutter/material.dart';
// Page References
import 'history_page.dart';
// Side Bar
import 'package:side_navigation/side_navigation.dart';
// Class References
import './models/game.dart';
import './models/season.dart';
import './models/combo.dart';
// Excel Reading
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

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
      // General Styling
      // Text Color White
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

// MAIN DYNAMIC CLASS OF THE APP
// The currently selected index of the bar
int selectedIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  List<Season> seasons = <Season>[];
  List<String> theLetters = <String>[];

  int getCurrentSeason() {
    if (seasons.isNotEmpty) {
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
    // PAGES
    // only a list of page classes.
    // all pages should be separate scripts.
    List<Widget> views = const [
      // HISTORY
      HistoryPage(),
      // PLAY BOOK
      Center(
        child: Text('Play Book'),
      ),
      // PREDICTIONS
      Center(
        child: Text('Predictions'),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // The row is needed to display the current page
      // The mechanics are similar to the Flutter BottomNavigationBar()
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.history_edu_rounded,
                label: 'History',
              ),
              SideNavigationBarItem(
                icon: Icons.menu_book_rounded,
                label: 'Play Book',
              ),
              SideNavigationBarItem(
                icon: Icons.query_stats_rounded,
                label: 'Predictions',
              ),
            ],
            toggler: SideBarToggler(
              expandIcon: Icons.keyboard_arrow_left_rounded,
              shrinkIcon: Icons.keyboard_arrow_right_rounded,
              onToggle: () {},
            ),
            theme: SideNavigationBarTheme(
              backgroundColor: const Color(0xFF121b1f),
              togglerTheme: const SideNavigationBarTogglerTheme(
                  expandIconColor: Colors.grey, shrinkIconColor: Colors.grey),
              itemTheme: const SideNavigationBarItemTheme(
                  selectedItemColor: Colors.white),
              dividerTheme: SideNavigationBarDividerTheme.standard(),
            ),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }

// SAVED FOR LATER DO NOT DELETE
// floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFF5a8696),
//         onPressed: () {
//           pickFile();
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),

// FILE READING
//IMPORTANT: needs to be moved to a separate script and made reference-able by pages.
  pickFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      // ensures excel files only can be added
      allowedExtensions: ['xlsx', 'xls'],
      withData: true,
    );
    // withReadStream: true); // makes a file picker window
    // checks if you selected a file
    if (file == null) return;
    //IMPORTANT: this will only work if it exists, but it's not already made yet
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
    Game game = Game(); // makes a new game
    game.combos = [];
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
    Combo combo = Combo();
    seasons[seasonIndex].games[gameIndex].combos.add(combo);
  }
}
