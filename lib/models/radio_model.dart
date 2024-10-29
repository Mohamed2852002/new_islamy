class RadioModel {
  final String radioName;
  final String radioUrl;
  const RadioModel({required this.radioName, required this.radioUrl});

  factory RadioModel.radioFromJson(json, int index) {
    return RadioModel(
        radioName: json["radios"][index]["name"],
        radioUrl: json["radios"][index]["url"]);
  }
  factory RadioModel.reciterFromJson(json, int index) {
    return RadioModel(
        radioName: json["reciters"][index]["name"],
        radioUrl: json["reciters"][index][ "moshaf"][0]["server"]);
  }
}
