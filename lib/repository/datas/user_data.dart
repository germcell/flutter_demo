/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : []
/// email : ""
/// icon : ""
/// id : 165998
/// nickname : "germ001"
/// password : ""
/// publicName : "germ001"
/// token : ""
/// type : 0
/// username : "germ001"

class UserData {
  bool? admin;
  List<dynamic>? chapterTops;
  num? coinCount;
  List<dynamic>? collectIds;
  String? email;
  String? icon;
  num? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  num? type;
  String? username;

  UserData({
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      admin: json['admin'],
      chapterTops: json['chapterTops'] != null
          ? List<dynamic>.from(json['chapterTops'].map((x) => x))
          : null,
      coinCount: json['coinCount'],
      collectIds: json['collectIds'] != null
          ? List<dynamic>.from(json['collectIds'].map((x) => x))
          : null,
      email: json['email'],
      icon: json['icon'],
      id: json['id'],
      nickname: json['nickname'],
      password: json['password'],
      publicName: json['publicName'],
      token: json['token'],
      type: json['type'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin'] = admin;
    if (chapterTops != null) {
      data['chapterTops'] = chapterTops!.map((v) => v).toList();
    }
    data['coinCount'] = coinCount;
    if (collectIds != null) {
      data['collectIds'] = collectIds!.map((v) => v).toList();
    }
    data['email'] = email;
    data['icon'] = icon;
    data['id'] = id;
    data['nickname'] = nickname;
    data['password'] = password;
    data['publicName'] = publicName;
    data['token'] = token;
    data['type'] = type;
    data['username'] = username;
    return data;
  }

  UserData copyWith({
    bool? admin,
    List<dynamic>? chapterTops,
    num? coinCount,
    List<dynamic>? collectIds,
    String? email,
    String? icon,
    num? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    num? type,
    String? username,
  }) {
    return UserData(
      admin: admin ?? this.admin,
      chapterTops: chapterTops ?? this.chapterTops,
      coinCount: coinCount ?? this.coinCount,
      collectIds: collectIds ?? this.collectIds,
      email: email ?? this.email,
      icon: icon ?? this.icon,
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      publicName: publicName ?? this.publicName,
      token: token ?? this.token,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return 'UserData{admin: $admin, chapterTops: $chapterTops, coinCount: $coinCount, collectIds: $collectIds, email: $email, icon: $icon, id: $id, nickname: $nickname, password: $password, publicName: $publicName, token: $token, type: $type, username: $username}';
  }
}
