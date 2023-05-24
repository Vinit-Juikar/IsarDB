import 'package:isar/isar.dart';

@Collection()
class Routine {
  //to make it unique we assign an identifier

  Id routineId = Isar.autoIncrement;
  late String title;

  @Index()
  late DateTime dateTime;

  @Index(caseSensitive: false)
  late String day;

  @Index(composite: [CompositeIndex('title')])
  late String categeory;
}
