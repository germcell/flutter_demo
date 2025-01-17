class ChapterData {
  List<dynamic>? articleList;
  String? author;
  List<ChapterData>? children;
  num? courseId;
  String? cover;
  String? desc;
  num? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  num? order;
  num? parentChapterId;
  num? type;
  bool? userControlSetTop;
  num? visible;

  ChapterData({
    this.articleList,
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      articleList: json['articleList'] != null
          ? List<dynamic>.from(json['articleList'].map((x) => x))
          : null,
      author: json['author'],
      children: json['children'] != null
          ? List<ChapterData>.from(
          json['children'].map((x) => ChapterData.fromJson(x)))
          : null,
      courseId: json['courseId'],
      cover: json['cover'],
      desc: json['desc'],
      id: json['id'],
      lisense: json['lisense'],
      lisenseLink: json['lisenseLink'],
      name: json['name'],
      order: json['order'],
      parentChapterId: json['parentChapterId'],
      type: json['type'],
      userControlSetTop: json['userControlSetTop'],
      visible: json['visible'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articleList != null) {
      data['articleList'] = articleList!.map((v) => v).toList();
    }
    data['author'] = author;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    data['courseId'] = courseId;
    data['cover'] = cover;
    data['desc'] = desc;
    data['id'] = id;
    data['lisense'] = lisense;
    data['lisenseLink'] = lisenseLink;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['type'] = type;
    data['userControlSetTop'] = userControlSetTop;
    data['visible'] = visible;
    return data;
  }
}