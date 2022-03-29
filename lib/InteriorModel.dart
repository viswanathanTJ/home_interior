class InteriorModel{
  int _likes;

  int get likes => _likes;

  set likes(int likes) {
    _likes = likes;
  }

  String _title;

  String get title => _title;

  set title(String title) {
    _title = title;
  }

  List<String> _imagePaths;

  List<String> get imagePaths => _imagePaths;

  set imagePaths(List<String> imagePaths) {
    _imagePaths = imagePaths;
  }

  String _description;

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  InteriorModel(this._likes, this._title, this._imagePaths, this._description);
}