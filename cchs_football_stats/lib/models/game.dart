// Plays
import 'play.dart';
// Hive
import 'package:hive/hive.dart';
part 'game.g.dart';

// This class manages relvanyt info to a game
// (amount of various plays, etc...)
@HiveType(typeId: 1)
class Game extends HiveObject {
  // Opponentflutte
  @HiveField(0)
  late String opponent;
  // Plays (list of all plays)
  @HiveField(1)
  late List<Play> plays;
  // Away Or Not
  @HiveField(2)
  late bool away;
}
