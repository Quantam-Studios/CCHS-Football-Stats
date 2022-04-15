// Plays
import 'combo.dart';
// Hive
import 'package:hive/hive.dart';
part 'game.g.dart';

// This class manages relvanyt info to a game
// (amount of various plays, etc...)
@HiveType(typeId: 1)
class Game extends HiveObject {
  // Opponent
  @HiveField(0)
  late String opponent;
  // Combos (list of all combos that were ran in the game)
  @HiveField(1)
  late List<Combo> combos;
  // Away Or Not
  @HiveField(2)
  late bool away;
  // Stats
  // the following variables will hold all calculated stats for the game
  // Total Offense Plays
  @HiveField(3)
  late int totalOffPlays;
  // Total Defense Plays
  @HiveField(4)
  late int totalDefPlays;
  // Total Plays
  @HiveField(5)
  late int totalPlays;
}
