// General
import 'package:flutter/material.dart';
// Accordions
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
// Hive Models
import 'models/season.dart';
import 'models/game.dart';
import 'models/combo.dart';
// Hive DataBase
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cchs_football_stats/helper_scripts/boxes.dart';
// Custom Debugging
import 'helper_scripts/customDebugging.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  HistoryPageContent createState() => HistoryPageContent();
}

// This holds the real content of the history page.
class HistoryPageContent extends State {
  // This function is called when the page is "active"
  @override
  void initState() {
    super.initState();
  }

  // This builds the page content.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // List of all seasons
      body:
          ListView(shrinkWrap: true, controller: ScrollController(), children: [
        ValueListenableBuilder<Box<Season>>(
          valueListenable: Boxes.getSeasons().listenable(),
          builder: (context, box, _) {
            final newSeasons = box.values.toList().cast<Season>();
            return buildSeasons(newSeasons);
          },
        ),
      ]),
    );
  }
}

// BUILD SEASONS
// Contruction of the season list happens here
Widget buildSeasons(List<Season> allSeasons) {
  // Check if any seasons exist
  if (allSeasons.isEmpty) {
    // if not then tell the user
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "No Seasons Exist.",
        style: TextStyle(color: Colors.grey, fontSize: 18),
      ),
    );
  } else {
    return Column(
      children: [
        // this dynamically creates a new accordian for each season
        ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: allSeasons.length,
          itemBuilder: (BuildContext context, int index) {
            final newClass = allSeasons[index];
            return buildSeason(context, newClass, index);
          },
        ),
      ],
    );
  }
}

// BUILD SEASON
// This returns a season accordian
Widget buildSeason(BuildContext context, Season seasonInfo, int index) {
  return Accordion(
    maxOpenSections: 1,
    headerBackgroundColorOpened: const Color(0xFF10181b),
    headerBackgroundColor: const Color(0xFF0b1113),
    headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
    sectionClosingHapticFeedback: SectionHapticFeedback.light,
    contentBackgroundColor: const Color(0xFF172226),
    contentBorderColor: Colors.grey,
    children: [
      AccordionSection(
          header: Text(seasonInfo.years.toString()),
          content: buildGames(seasonInfo.games)),
    ],
  );
}

// BUILD GAMES
// Contruction of the games list happens here
Widget buildGames(List<Game> seasonGames) {
  // Check if any games exist
  if (seasonGames.isEmpty) {
    // if not then tell the user
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "No Games Exist For This Season.",
        style: TextStyle(color: Colors.grey, fontSize: 18),
      ),
    );
  } else {
    return Column(
      children: [
        // this dynamically creates a new accordian for each game
        ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: seasonGames.length,
          itemBuilder: (BuildContext context, int index) {
            final newGame = seasonGames[index];
            return buildGame(context, newGame, index);
          },
        ),
      ],
    );
  }
}

// BUILD GAME
// This returns a game accordian
Widget buildGame(BuildContext context, Game gameInfo, int index) {
  // Styling
  const _headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  const _contentStyleHeader =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  return Accordion(
    maxOpenSections: 1,
    headerBackgroundColorOpened: const Color(0xFF10181b),
    headerBackgroundColor: const Color(0xFF0b1113),
    headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
    sectionClosingHapticFeedback: SectionHapticFeedback.light,
    contentBackgroundColor: const Color(0xFF172226),
    contentBorderColor: Colors.grey,
    children: [
      AccordionSection(
        header: Row(children: [
          const Icon(
            Icons.sports_football_rounded,
            color: Colors.white,
          ),
          Text("Opponent ${gameInfo.date.toIso8601String().substring(0, 10)}",
              style: _headerStyle)
        ]),
        content: DataTable(
          sortAscending: true,
          sortColumnIndex: 1,
          dataRowHeight: 40,
          showBottomBorder: false,
          columns: [
            DataColumn(
                label: Text(
              "Combo # of ${gameInfo.totalPlays}",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "Type",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "Motion",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "Te",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "RB",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "O/D",
              style: _contentStyleHeader,
            )),
            const DataColumn(
                label: Text(
              "Efficient",
              style: _contentStyleHeader,
            ))
          ],
          rows: makeCombos(gameInfo.combos),
        ),
      ),
    ],
  );
}

// MAKE COMBOS
// this method returns the list of combos in a game in way that data_table package can understand them.
List<DataRow> makeCombos(List<Combo> combos) {
  const _contentStyle = TextStyle(
      color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal);
  List<DataRow> plays = <DataRow>[];
  for (int x = 0; x < combos.length; x++) {
    Combo combo = combos[x];
    plays.add(DataRow(cells: [
      DataCell(Text(
        x.toString(),
        style: _contentStyle,
      )),
      DataCell(Text(
        combo.play.toString(),
        style: _contentStyle,
      )),
      const DataCell(Text(
        "",
        style: _contentStyle,
      )),
      const DataCell(Text(
        "combo.te.toString()",
        style: _contentStyle,
      )),
      const DataCell(Text(
        "combo.rb.toString()",
        style: _contentStyle,
      )),
      DataCell(Text(
        combo.isOffense.toString(),
        style: _contentStyle,
      )),
      DataCell(Text(
        combo.efficient.toString(),
        style: _contentStyle,
      )),
    ]));
  }
  return plays;
}
