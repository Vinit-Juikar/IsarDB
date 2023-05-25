import 'package:isar/isar.dart';

import 'package:isar_db_project/collections/categories.dart';
part 'routine.g.dart';

@Collection()
class Routine {
  Id routineId = Isar.autoIncrement;
// dateTime, title, category, day

  late String title;

  @Index()
  late DateTime startTime;

  @Index(caseSensitive: false)
  late String day;

  @Index(composite: [CompositeIndex('title')])
  final category = IsarLink<Category>();
}
