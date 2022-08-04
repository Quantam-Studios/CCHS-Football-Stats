// IMPORTANT: this file holds code that could be useful later on in development.
// more specifically the code used to be used, and may need to be referenced later on.
// the formatting goes:
// TITLE/NAME (should be all caps)
// an explanation of what the code does and wehat it returns if applicable.
// the actual code.

// ---------------------------------------------------------

// MAKE SEASONS LIST
// This was used before hive was implemented and aided in the building of the season accordians history page.
// List<Accordion> makeSeasonList() {
//   List<Accordion> seasonsAccordions = <Accordion>[];
//   for (int x = 0; x < seasons.length; x++) {
//     seasonsAccordions.add(
//       Accordion(
//         maxOpenSections: 2,
//         headerBackgroundColorOpened: const Color(0xFF10181b),
//         headerBackgroundColor: const Color(0xFF0b1113),
//         headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//         sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
//         sectionClosingHapticFeedback: SectionHapticFeedback.light,
//         contentBackgroundColor: const Color(0xFF172226),
//         contentBorderColor: Colors.grey,
//         children: [
//           AccordionSection(
//             header: Text(seasons[x].years.toString()),
//             content: Accordion(
//               maxOpenSections: 1,
//               contentBackgroundColor: const Color(0xFF39545e),
//               headerBackgroundColor: const Color(0xFF5a8696),
//               headerBackgroundColorOpened: const Color(0xFF8fb0bc),
//               headerPadding:
//                   const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//               children: makeGameList(seasons[x]),
//               header: Row(
//                 children: [
//                   const Icon(Icons.sports_football_sharp),
//                   Text(
//                     seasons[x].years.toString(),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ], //makeGameList(seasons[x]),
//       ),
//     );
//   }
//   return seasonsAccordions;
// }

// ---------------------------------------------------------

// MAKEGAMELIST
// This was used before hive was implemented, and aided in the building of the game accordians.
// List<AccordionSection> makeGameList(Season season) {
//   const _headerStyle = TextStyle(
//       color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
//   const _contentStyleHeader =
//       TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
//   List<AccordionSection> section = <AccordionSection>[];
//   for (int x = 0; x < season.games.length; x++) {
//     section.add(
//       AccordionSection(
//           header: Row(children: const [
//             Icon(Icons.sports_football_rounded),
//             Text("Opponent", style: _headerStyle)
//           ]),
//           content: DataTable(
//               sortAscending: true,
//               sortColumnIndex: 1,
//               dataRowHeight: 40,
//               showBottomBorder: false,
//               columns: const [
//                 DataColumn(
//                     label: Text(
//                   "Combo #",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "Type",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "Motion",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "Te",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "RB",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "O/D",
//                   style: _contentStyleHeader,
//                 )),
//                 DataColumn(
//                     label: Text(
//                   "Efficient",
//                   style: _contentStyleHeader,
//                 ))
//               ],
//               rows: makePlays(season.games[x].combos))),
//     );
//   }
//   return section;
// }