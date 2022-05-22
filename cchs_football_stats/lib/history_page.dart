// General
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172226),
      // List of all seasons
      body: ListView(
        children: [
          _Season("2021-2022", ""),
          _Season("2022-2023", ""),
          _Season("2023-2024", ""),
          _Season("2024-2025", ""),
          _Season("2025-2026", ""),
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
_Season(
  String year,
  String record,
) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    color: const Color(0xFF121b1f),
    margin:
        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
    child: Row(
      children: [
        Text(
          year,
          style: const TextStyle(color: Colors.grey),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
  );
}
