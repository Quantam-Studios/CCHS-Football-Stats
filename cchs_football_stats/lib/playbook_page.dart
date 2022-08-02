//General Imports
import 'dart:math';
import 'package:cchs_football_stats/addFileFunction.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:flutter/material.dart';
//Local Files
import 'addFileFunction.dart';
import 'main.dart';
import 'models/game.dart';
import 'models/combo.dart';
import 'history_page.dart';
//Accordions
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class PlayBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF172226),
        body: Accordion(
            maxOpenSections: 2,
            headerBackgroundColorOpened: const Color(0xFF10181b),
            headerBackgroundColor: const Color(0xFF0b1113),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            contentBackgroundColor: const Color(0xFF172226),
            contentBorderColor: Colors.grey,
            children: [
              AccordionSection(
                header: Row(
                  children: const [Text("Breakdown")],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                content: Accordion(children: [
                  AccordionSection(
                      header: Row(children: [
                        Text("Rows, " +
                            (totalPlays()[0] / totalPlaysCount() * 100)
                                .toString()
                                .split(".")[0] +
                            "%")
                      ]),
                      contentBackgroundColor:
                          const Color.fromARGB(255, 33, 243, 166),
                      headerBackgroundColor:
                          const Color.fromARGB(255, 9, 112, 55),
                      content: DataTable(columns: const [
                        DataColumn(label: Text("Combo #")),
                        DataColumn(label: Text("Type")),
                        DataColumn(label: Text("Motion")),
                        DataColumn(label: Text("O/D")),
                        DataColumn(label: Text("Efficient"))
                      ], rows: makePlays(totalPlays()[2][0])))
                ]),
              )
            ]));

    // TODO: implement build
    throw UnimplementedError();
  }

  totalPlays() {
    int runs = 0;
    int passes = 0;
    List<List<Combo>> plays = [[], []];
    for (int x = 0; x < seasons.length; x++) {
      for (int y = 0; y < seasons[x].games.length; y++) {
        for (int z = 0; z < seasons[x].games[y].combos.length; z++) {
          Combo combo = seasons[x].games[y].combos[z];
          if (combo.play == "run" || combo.play == "Run") {
            runs++;
            plays[0].add(combo);
          }
          if (combo.play == "pass" || combo.play == "Pass") {
            passes++;
            plays[1].add(combo);
          }
        }
      }
    }
    return [runs, passes, plays];
  }

  totalPlaysCount() {
    int? totalPlays = 0;
    for (int x = 0; x < seasons.length; x++) {
      for (int y = 0; y < seasons[x].games.length; y++) {
        var totalPlaysInt = seasons[x].games[y].totalPlays;
        if (totalPlaysInt != null) {
          totalPlays = totalPlays! + totalPlaysInt;
        }
      }
    }
    return totalPlays;
  }
}
