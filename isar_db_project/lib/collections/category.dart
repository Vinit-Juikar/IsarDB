// here we have to add only one thing and that is name

import 'package:isar/isar.dart';

@Collection()
class Category {
  Id categoryId = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
}
