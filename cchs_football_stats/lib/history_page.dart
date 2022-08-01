// General
import 'dart:math';

import 'package:cchs_football_stats/addFileFunction.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:flutter/material.dart';
// Accordions
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'addFileFunction.dart';
import 'main.dart';
import 'models/game.dart';
import 'models/combo.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // List of all seasons
      body: ListView(controller: ScrollController(), children: makeSeasonList()
          //[
          //accordion(),
          //season(2021, 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
          //],
          ),
    );
  }
}

List<Accordion> makeSeasonList() {
  List<Accordion> seasonsAccordions = <Accordion>[];
  for (int x = 0; x < seasons.length; x++) {
    seasonsAccordions.add(Accordion(
      maxOpenSections: 2,
      headerBackgroundColorOpened: const Color(0xFF10181b),
      headerBackgroundColor: const Color(0xFF0b1113),
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      contentBackgroundColor: const Color(0xFF172226),
      contentBorderColor: Colors.grey,
      children: [
        AccordionSection(
            header: Text(seasons[x].years.toString()),
            content: Accordion(
                children: makeGameList(seasons[x]),
                header: Text(seasons[x].years.toString())))
      ], //makeGameList(seasons[x]),
    ));
  }
  return seasonsAccordions;
}

List<AccordionSection> makeGameList(Season season) {
  List<AccordionSection> section = <AccordionSection>[];
  for (int x = 0; x < season.games.length; x++) {
    section.add(
      AccordionSection(
          header: Row(children: const [
            Icon(Icons.sports_football_rounded),
            Text("Opponent")
          ]),
          contentBackgroundColor: Color.fromARGB(255, 33, 243, 166),
          headerBackgroundColor: Color.fromARGB(255, 9, 112, 55),
          content: DataTable(columns: const [
            DataColumn(label: Text("Combo #")),
            DataColumn(label: Text("Type")),
            DataColumn(label: Text("Motion")),
            DataColumn(label: Text("O/D")),
            DataColumn(label: Text("Efficient"))
          ], rows: makePlays(season.games[x]))),
    );
  }
  return section;
}

List<DataRow> makePlays(Game game) {
  List<DataRow> plays = <DataRow>[];
  for (int x = 0; x < game.combos.length; x++) {
    Combo combo = game.combos[x];
    plays.add(DataRow(cells: [
      DataCell(Text(combo.playNumber.toString())),
      DataCell(Text(combo.play.toString())),
      DataCell(Text("")),
      DataCell(Text(combo.isOffense.toString())),
      DataCell(Text(combo.efficient.toString())),
    ]));
  }
  return plays;
}

// THE FOLLOWING CLASSES ARE TEMPORARY AND ARE ONLY FOR THE
// PURPOSES OF BUILDING OUT THE APP MORE BEFORE EVENTUALLY
// ADDING CUSTOM BUILD FUNCTIONS THAT ARE DYNAMIC AND USER
// -DATA BASED

// SEASON
// returns a container for displaying seasons
season(
  int year,
  int totalGames,
) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    decoration: const BoxDecoration(
      color: Color(0xFF121b1f),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    margin:
        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
    child: Row(
      children: [
        // Year of season
        Text(
          year.toString(),
          style: const TextStyle(color: Colors.grey),
        ),
        const Spacer(),
        // Total games
        Text(
          "$totalGames",
          style: const TextStyle(color: Colors.grey),
        ),
        const Spacer(),
        const Spacer(),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}

accordion(Season season) {
  return Accordion(
      maxOpenSections: 2,
      headerBackgroundColorOpened: const Color(0xFF10181b),
      headerBackgroundColor: const Color(0xFF0b1113),
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      contentBackgroundColor: const Color(0xFF172226),
      contentBorderColor: Colors.grey,
      children: makeGameList(season)
      // Season

      );
}
