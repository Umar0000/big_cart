class Data {
  int? id;
  String? title;
  String? icon;
  String? color;

  Data({this.id, this.title, this.icon, this.color});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['color'] = this.color;
    return data;
  }
}
