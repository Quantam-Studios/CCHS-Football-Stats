// General
import 'package:cchs_football_stats/newGamePage.dart';
import 'package:cchs_football_stats/playbook_page.dart';
import 'package:flutter/material.dart';
// Page References
import 'history_page.dart';
import 'newGamePage.dart';
// Side Bar
import 'package:side_navigation/side_navigation.dart';
// Hive Database
import 'package:hive_flutter/hive_flutter.dart';
// Hive Models
import 'package:cchs_football_stats/models/combo.dart';
import 'package:cchs_football_stats/models/game.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:cchs_football_stats/models/allTimeStats.dart';

Future main() async {
  // Ensure flutter is ready
  WidgetsFlutterBinding.ensureInitialized();
  // Hive Initialization
  await Hive.initFlutter();
  // Combo
  Hive.registerAdapter(ComboAdapter());
  await Hive.openBox<Combo>('combos');
  // Game
  Hive.registerAdapter(GameAdapter());
  await Hive.openBox<Game>('games');
  // Season
  Hive.registerAdapter(SeasonAdapter());
  await Hive.openBox<Season>('seasons');
  // All Time Stats
  Hive.registerAdapter(AllTimeStatsAdapter());
  await Hive.openBox<AllTimeStats>('allTimeStats');

  runApp(const MyApp());
}

List<Season> seasons = <Season>[];

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

// MAIN DYNAMIC CLASS OF THE APP
// The currently selected index of the bar
int selectedIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  List<String> theLetters = <String>[];

  @override
  Widget build(BuildContext context) {
    // PAGES
    // only a list of page classes.
    // all pages should be separate scripts.
    List<Widget> views = [
      // HISTORY
      const HistoryPage(),
      // PLAY BOOK
      PlayBook(),
      // PREDICTIONS
      const Center(
        child: Text('Predictions'),
      ),
      //NEW GAME BUTTON
      const NewGameButtonPage()
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // The row is needed to display the current page
      // The mechanics are similar to the Flutter BottomNavigationBar()
      body: Row(
        children: [
          SideNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
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
              SideNavigationBarItem(icon: Icons.new_label, label: "New Game")
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
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
      //
    );
  }

  //SAVED FOR LATER DO NOT DELETE
  //floatingActionButton: FloatingActionButton(
  //        backgroundColor: const Color(0xFF5a8696),
  //        onPressed: () {
  //           pickFile();
  //         },
  //         child: const Icon(
  //           Icons.add,
  //           color: Colors.white,
  //         ),
  //       ),

  // FILE READING
  //IMPORTANT: needs to be moved to a separate script and made reference-able by pages.

}
