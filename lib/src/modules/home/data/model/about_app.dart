AboutAppModel authFromJson(Map<String, dynamic> docMap) =>
    AboutAppModel.fromJson(docMap);

class AboutAppModel {
  AboutAppModel({
    this.name,
    this.title,
  });

  factory AboutAppModel.fromJson(Map<String, dynamic> json) => AboutAppModel(
        name: json['name'] as String?,
        title: json['title'] as String?,
      );
  String? name;
  String? title;
}
