// Hive
import 'package:hive/hive.dart';
part 'combo.g.dart';

// This holds data about a play
// (direction, route etc...)
@HiveType(typeId: 0)
class Combo extends HiveObject {
  // Name
  @HiveField(0)
  late String? play;
  // Motion
  @HiveField(1)
  late String? motion;
  // Formation
  @HiveField(2)
  late String? formation;
  // Personnel
  // rb = total running backs on field
  // te = total tight ends on field
  @HiveField(3)
  late int? rb;
  @HiveField(4)
  late int? te;
  @HiveField(5)
  late bool? efficient;
  // Combo type (offense or defense)
  @HiveField(6)
  late bool? isOffense;
  //Play Number
  late int? playNumber;
  // Direction
  // @HiveField(some Int)
  // late String direction;
}
