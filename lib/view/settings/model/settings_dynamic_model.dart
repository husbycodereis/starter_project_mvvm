class SettingsDynamicModel {
  final String? url;
  final String title;
  SettingsDynamicModel({
    this.url,
    required this.title,
  });

  factory SettingsDynamicModel.fakeArchitecturePR() {
    return SettingsDynamicModel(
        title: 'Project Contributors', url: 'https://github.com/VB10/flutter-architecture-template');
  }
  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel(title: 'Project Owner');
  }
}
