// Combos
import 'combo.dart';
// Hive
import 'package:hive/hive.dart';
part 'allTimeStats.g.dart';

@HiveType(typeId: 3)
class AllTimeStats extends HiveObject {
  // List of all combos
  @HiveField(0)
  late List<Combo> allCombos;
  // List of all combos in current season
  @HiveField(1)
  late List<Combo> seasonCombos;
  // List of all combos the opponent has seen
  @HiveField(3)
  late List<Combo> revealedCombos;
}
