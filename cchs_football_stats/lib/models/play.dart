// Hive
import 'package:hive/hive.dart';
part 'play.g.dart';

// This holds data about a play
// (direction, route etc...)
@HiveType(typeId: 0)
class Play extends HiveObject {
  // Name
  @HiveField(0)
  late String name;
  // Direction
  @HiveField(1)
  late String direction;
}
