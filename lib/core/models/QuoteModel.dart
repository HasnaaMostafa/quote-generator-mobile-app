import 'package:hive/hive.dart';

part 'QuoteModel.g.dart';

@HiveType(typeId: 0)
class QuoteModel extends HiveObject {
  QuoteModel({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  void setKey(String key) {
    this.key = key;
  }

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
      tags: json['tags'] != null ? json['tags'].cast<String>() : [],
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? content;

  @HiveField(2)
  String? author;

  @HiveField(3)
  List<String>? tags;

  @HiveField(4)
  String? authorSlug;

  @HiveField(5)
  num? length;

  @HiveField(6)
  String? dateAdded;

  @HiveField(7)
  String? dateModified;

  @override
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['content'] = content;
    map['author'] = author;
    map['tags'] = tags;
    map['authorSlug'] = authorSlug;
    map['length'] = length;
    map['dateAdded'] = dateAdded;
    map['dateModified'] = dateModified;
    return map;
  }
}
