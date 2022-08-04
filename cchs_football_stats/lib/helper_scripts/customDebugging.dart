// Hive Data Base
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cchs_football_stats/helper_scripts/boxes.dart';
// Model types
import 'package:cchs_football_stats/models/combo.dart';
import 'package:cchs_football_stats/models/game.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:cchs_football_stats/models/allTimeStats.dart';

// DEBUGGING FUNCTIONS
// the following are custom functions made for the purposes of debugging.

// Delete all seasons
void deleteSeasons() {
  Boxes.getSeasons().clear();
}

// Delete all games in a season
void deleteGames(Season season) {
  Boxes.getSeasons().get(season)?.games = [];
}
