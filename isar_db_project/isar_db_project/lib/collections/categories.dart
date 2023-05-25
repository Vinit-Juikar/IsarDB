import 'package:isar/isar.dart';
part 'categories.g.dart';

@Collection()
class Category {
  Id categoryId = Isar.autoIncrement;
  @Index(unique: true)
  late String name;
}
