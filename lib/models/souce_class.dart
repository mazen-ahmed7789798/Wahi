/// This Module is used to define the Source class which will be used to store the Source data in the application.
/// ignore_for_file: dangling_library_doc_comments
/// The Source class has the following properties:
/// - `id`: The unique identifier of the Source by Using uuid.
/// - `sourceName`: The name of the Source (e.g., Sahih Bukhari, Sahih Muslim, etc.).
/// - `description`: A brief description of the Source.
/// - `hadithCount`: An integer value representing the number of Hadiths in the Source.
/// - `isFavorite`: A boolean value indicating whether the Source is marked as a favorite by the user.
/// - `isBookmarked`: A boolean value indicating whether the Source is bookmarked by the user
/// - `sharedCount`: An integer value representing the number of times the Source has been shared by the user.
/// - `lastAccessed`: A DateTime value representing the last time the Source was accessed by the user.
/// - `viewsCount`: An integer value representing the number of times the Source has been viewed
/// by the user.
/// - `notes`: A string value representing any notes added by the user for the Source.
/// - `lastViewed`: A DateTime value representing the last time the Source was viewed by the user.

import 'package:uuid/uuid.dart';
import 'package:wahi/models/hadith_class.dart';

enum SourceType {
  sahihBukhari,
  sahihMuslim,
  sunanAbuDawood,
  sunanTirmidhi,
  sunanNasai,
  sunanIbnMajah,
  musnadAhmad,
  other,
}

class Source {
  late final String _id;
  late final SourceType _sourceName;
  late final String? _description;
  int? _hadithCount;
  bool? _isFavorite;
  bool? _isBookmarked;
  int? _sharedCount;
  DateTime? _lastAccessed;
  int _viewsCount = 0;
  StringBuffer? _notes;
  DateTime? _lastViewed;
  List<Hadith> _hadiths = [];

  void useSource() {
    _lastAccessed = DateTime.now();
    _viewsCount++;
  }

  Source({
    required SourceType sourceName,
    String? description,
    StringBuffer? notes,
  }) {
    _id = Uuid().v4();
    _sourceName = sourceName;
    _description = description;
    _hadithCount = 0;
    _isFavorite = false;
    _isBookmarked = false;
    _sharedCount = 0;
    _viewsCount = 0;
    _notes = notes;
  }

  String get id => _id;
  SourceType get sourceName => _sourceName;
  String? get description => _description;
  int? get hadithCount => _hadithCount;
  bool? get isFavorite => _isFavorite;
  bool? get isBookmarked => _isBookmarked;
  int? get sharedCount => _sharedCount;
  DateTime? get lastAccessed => _lastAccessed;
  int get viewsCount => _viewsCount;
  StringBuffer? get notes => _notes;
  DateTime? get lastViewed => _lastViewed;
  List<Hadith> get hadiths => _hadiths;
}

void main() {
  Source source = Source(
    sourceName: SourceType.sahihMuslim,
    description: "A collection of authentic Hadiths compiled by Imam Muslim.",
  );
  print("Source ID: ${source.id}");
}
