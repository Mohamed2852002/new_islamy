class RadioModel {
  final String radioName;
  final String radioUrl;
  RadioModel({required this.radioName, required this.radioUrl});

  factory RadioModel.fromJson(json, int index) {
    return RadioModel(
        radioName: json["radios"][index]["name"],
        radioUrl: json["radios"][index]["url"]);
  }
}
