// Hive Data Base
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Model types
import 'package:cchs_football_stats/models/combo.dart';
import 'package:cchs_football_stats/models/game.dart';
import 'package:cchs_football_stats/models/season.dart';
import 'package:cchs_football_stats/models/allTimeStats.dart';

class Boxes {
  static Box<Combo> getCombos() => Hive.box<Combo>('combos');
  static Box<Game> getGames() => Hive.box<Game>('games');
  static Box<Season> getSeasons() => Hive.box<Season>('seasons');
  static Box<AllTimeStats> getAllTimeStats() =>
      Hive.box<AllTimeStats>('allTimeStats');
}
