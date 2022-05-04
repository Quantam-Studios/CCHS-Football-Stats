// Games
import 'game.dart';
// Hive
import 'package:hive/hive.dart';
part 'season.g.dart';

// This class holds the data relevant to a season
@HiveType(typeId: 2)
class Season extends HiveObject {
  // Name
  @HiveField(0)
  late String years;
  // Games
  // this holds all relevant games in the season
  @HiveField(1)
  List<Game> games = [];
  // Total Game Count
  @HiveField(2)
  late int totalGames;
}
