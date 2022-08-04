// IMPORTANT: this file holds code that could be useful later on in development.
// the formatting goes:
// TITLE/NAME (should be all caps)
// an explanation of what the code does and wehat it returns if applicable.
// the actual code.

// ---------------------------------------------------------

// // BUILD COMBOS
// // Contruction of the combos list happens here
// Widget buildCombos(List<Combo> gameCombos) {
//   // Check if any combos exist
//   if (gameCombos.isEmpty) {
//     // if not then tell the user
//     return const Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Text(
//         "No Combos Exist For This Game.",
//         style: TextStyle(color: Colors.grey, fontSize: 18),
//       ),
//     );
//   } else {
//     return Column(
//       children: [
//         ListView.builder(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.all(0.0),
//           shrinkWrap: true,
//           itemCount: gameCombos.length,
//           itemBuilder: (BuildContext context, int index) {
//             final newCombo = gameCombos[index];
//             return buildCombo(context, newCombo, index);
//           },
//         ),
//       ],
//     );
//   }
// }

// ---------------------------------------------------------

// // BUILD COMBO
// // This returns combo data
// Widget buildCombo(BuildContext context, Combo comboInfo, int index) {
//   // Styling
//   const _headerStyle = TextStyle(
//       color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
//   const _contentStyleHeader =
//       TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

//   return Accordion(
//     maxOpenSections: 2,
//     headerBackgroundColorOpened: const Color(0xFF10181b),
//     headerBackgroundColor: const Color(0xFF0b1113),
//     headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//     sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
//     sectionClosingHapticFeedback: SectionHapticFeedback.light,
//     contentBackgroundColor: const Color(0xFF172226),
//     contentBorderColor: Colors.grey,
//     children: [
//       AccordionSection(
//         header: Text('Temporary: ${index}'),
//         content: AccordionSection(
//           header: Row(children: const [
//             Icon(Icons.sports_football_rounded),
//             Text("Opponent", style: _headerStyle)
//           ]),
//           content: DataTable(
//             sortAscending: true,
//             sortColumnIndex: 1,
//             dataRowHeight: 40,
//             showBottomBorder: false,
//             columns: const [
//               DataColumn(
//                   label: Text(
//                 "Combo #",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "Type",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "Motion",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "Te",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "RB",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "O/D",
//                 style: _contentStyleHeader,
//               )),
//               DataColumn(
//                   label: Text(
//                 "Efficient",
//                 style: _contentStyleHeader,
//               ))
//             ],
//             rows: makePlays(gameInfo.combos),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// ---------------------------------------------------------


