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
                maxOpenSections: 1,
                contentBackgroundColor: const Color(0xFF39545e),
                headerBackgroundColor: const Color(0xFF5a8696),
                headerBackgroundColorOpened: const Color(0xFF8fb0bc),
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: makeGameList(seasons[x]),
                header: Row(children: [
                  const Icon(Icons.sports_football_sharp),
                  Text(seasons[x].years.toString())
                ])))
      ], //makeGameList(seasons[x]),
    ));
  }
  return seasonsAccordions;
}

List<AccordionSection> makeGameList(Season season) {
  const _headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  const _contentStyleHeader =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  List<AccordionSection> section = <AccordionSection>[];
  for (int x = 0; x < season.games.length; x++) {
    section.add(
      AccordionSection(
          header: Row(children: const [
            Icon(Icons.sports_football_rounded),
            Text("Opponent", style: _headerStyle)
          ]),
          content: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              dataRowHeight: 40,
              showBottomBorder: false,
              columns: const [
                DataColumn(
                    label: Text(
                  "Combo #",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "Type",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "Motion",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "Te",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "RB",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "O/D",
                  style: _contentStyleHeader,
                )),
                DataColumn(
                    label: Text(
                  "Efficient",
                  style: _contentStyleHeader,
                ))
              ],
              rows: makePlays(season.games[x].combos))),
    );
  }
  return section;
}

List<DataRow> makePlays(List<Combo> combos) {
  const _contentStyle = TextStyle(
      color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal);
  List<DataRow> plays = <DataRow>[];
  for (int x = 0; x < combos.length; x++) {
    Combo combo = combos[x];
    plays.add(DataRow(cells: [
      DataCell(Text(
        combo.playNumber.toString(),
        style: _contentStyle,
      )),
      DataCell(Text(
        combo.play.toString(),
        style: _contentStyle,
      )),
      DataCell(Text(
        "",
        style: _contentStyle,
      )),
      DataCell(Text(
        "combo.te.toString()",
        style: _contentStyle,
      )),
      DataCell(Text(
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
