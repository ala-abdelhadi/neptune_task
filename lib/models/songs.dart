class SongsModel {
  List<Song>? _songs;
  int? _totalCount;

  SongsModel({List<Song>? songs, int? totalCount}) {
    if (songs != null) {
      _songs = songs;
    }
    if (totalCount != null) {
      _totalCount = totalCount;
    }
  }

  List<Song>? get songs => _songs;
  set songs(List<Song>? songs) => _songs = songs;
  int? get totalCount => _totalCount;
  set totalCount(int? totalCount) => _totalCount = totalCount;

  SongsModel.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      _songs = <Song>[];
      json['songs'].forEach((v) {
        _songs!.add(Song.fromJson(v));
      });
    }
    _totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_songs != null) {
      data['songs'] = _songs!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = _totalCount;
    return data;
  }
}

class Song {
  String? _title;
  String? _label;
  String? _duration;
  int? _id;

  Song({String? title, String? label, String? duration, int? id}) {
    if (title != null) {
      _title = title;
    }
    if (label != null) {
      _label = label;
    }
    if (duration != null) {
      _duration = duration;
    }
    if (id != null) {
      _id = id;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get label => _label;
  set label(String? label) => _label = label;
  String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
  int? get id => _id;
  set id(int? id) => _id = id;
  Song.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _label = json['label'];
    _duration = json['duration'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['label'] = _label;
    data['id'] = _id;
    data['duration'] = _duration;
    return data;
  }
}
