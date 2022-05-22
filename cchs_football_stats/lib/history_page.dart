// General
import 'package:flutter/material.dart';
// Accordions
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // List of all seasons
      body: ListView(
        controller: ScrollController(),
        children: [
          accordian(),
          accordian(),
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
          // season("2021-2022", 16),
          // season("2022-2023", 16),
          // season("2023-2024", 16),
          // season("2024-2025", 16),
          // season("2025-2026", 16),
        ],
      ),
    );
  }
}

// THE FOLLOWING CLASSES ARE TEMPORARY AND ARE ONLY FOR THE
// PURPOSES OF BUILDING OUT THE APP MORE BEFORE EVENTUALLY
// ADDING CUSTOM BUILD FUNCTIONS THAT ARE DYNAMIC AND USER
// -DATA BASED

// SEASON
// returns a container for displaying seasons
season(
  String year,
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
          year,
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

accordian() {
  const _headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  const _contentStyleHeader =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  const _contentStyle = TextStyle(
      color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal);

  return Accordion(
    maxOpenSections: 2,
    headerBackgroundColorOpened: const Color(0xFF10181b),
    headerBackgroundColor: const Color(0xFF0b1113),
    headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
    sectionClosingHapticFeedback: SectionHapticFeedback.light,
    contentBackgroundColor: const Color(0xFF172226),
    contentBorderColor: Colors.grey,
    children: [
      // Season
      AccordionSection(
        isOpen: false,
        leftIcon:
            const Icon(Icons.format_list_numbered_rounded, color: Colors.white),
        header: Row(
          children: const [
            Text("Season #"),
            Spacer(),
            // number of games in season
            Text("#"),
            Spacer(),
            Spacer(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        contentBorderColor: Colors.grey,
        // Collection of Games
        content: Accordion(
          maxOpenSections: 1,
          contentBackgroundColor: const Color(0xFF39545e),
          headerBackgroundColor: const Color(0xFF5a8696),
          headerBackgroundColorOpened: const Color(0xFF8fb0bc),
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.sports_football_rounded,
                  color: Colors.white),
              header: const Text('Game #   Opponent', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: const [
                  DataColumn(
                      label: Text('Combo #', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Combo Name', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Motion', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('RB', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('TE', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Effecient', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('D/O', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      // Combo #
                      DataCell(Text('#',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // Combo Name
                      DataCell(Text('Play Name', style: _contentStyle)),
                      // Motion
                      DataCell(Text('Motion',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      // RB
                      DataCell(Text('#', style: _contentStyle)),
                      // TE
                      DataCell(Text('#', style: _contentStyle)),
                      //Effecient
                      DataCell(Text('Y/N', style: _contentStyle)),
                      // D/O
                      DataCell(Text('D/O', style: _contentStyle)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
