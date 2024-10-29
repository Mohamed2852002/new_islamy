class ReciterModel {
  final String reciterUrl;
  const ReciterModel({required this.reciterUrl});

  factory ReciterModel.fromjson (json,index){
    return ReciterModel(reciterUrl: json["audio_files"][index]["audio_url"]);
  }
}
