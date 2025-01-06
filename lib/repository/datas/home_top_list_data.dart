import 'home_list_data.dart';

/// data : [{"adminAdd":false,"apkLink":"","audit":1,"author":"分享","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":29376,"isAdminAdd":false,"link":"https://mp.weixin.qq.com/s/1IDnciwR4SfehB04ghRSgA","niceDate":"10小时前","niceShareDate":"10小时前","origin":"","prefix":"","projectLink":"","publishTime":1736136481000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1736136464000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"职场人必读！这篇文章或许能够帮你突破职场瓶颈，找到提升个人竞争力的方法，更轻松应对多种职场难题！✨分享大家快来看！","type":1,"userId":-1,"visible":1,"zan":0}]
/// errorCode : 0
/// errorMsg : ""

class HomeTopListData {
  HomeTopListData({
      List<HomeListItemData>? data,
      num? errorCode, 
      String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  HomeTopListData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(HomeListItemData.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  List<HomeListItemData>? _data;
  num? _errorCode;
  String? _errorMsg;
HomeTopListData copyWith({  List<HomeListItemData>? data,
  num? errorCode,
  String? errorMsg,
}) => HomeTopListData(  data: data ?? _data,
  errorCode: errorCode ?? _errorCode,
  errorMsg: errorMsg ?? _errorMsg,
);
  List<HomeListItemData>? get data => _data;
  num? get errorCode => _errorCode;
  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }

}

/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : "分享"
/// canEdit : false
/// chapterId : 249
/// chapterName : "干货资源"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : true
/// host : ""
/// id : 29376
/// isAdminAdd : false
/// link : "https://mp.weixin.qq.com/s/1IDnciwR4SfehB04ghRSgA"
/// niceDate : "10小时前"
/// niceShareDate : "10小时前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1736136481000
/// realSuperChapterId : 248
/// selfVisible : 0
/// shareDate : 1736136464000
/// shareUser : ""
/// superChapterId : 249
/// superChapterName : "干货资源"
/// tags : []
/// title : "职场人必读！这篇文章或许能够帮你突破职场瓶颈，找到提升个人竞争力的方法，更轻松应对多种职场难题！✨分享大家快来看！"
/// type : 1
/// userId : -1
/// visible : 1
/// zan : 0

// class HomeListItemData {
//   HomeListItemData({
//       bool? adminAdd,
//       String? apkLink,
//       num? audit,
//       String? author,
//       bool? canEdit,
//       num? chapterId,
//       String? chapterName,
//       bool? collect,
//       num? courseId,
//       String? desc,
//       String? descMd,
//       String? envelopePic,
//       bool? fresh,
//       String? host,
//       num? id,
//       bool? isAdminAdd,
//       String? link,
//       String? niceDate,
//       String? niceShareDate,
//       String? origin,
//       String? prefix,
//       String? projectLink,
//       num? publishTime,
//       num? realSuperChapterId,
//       num? selfVisible,
//       num? shareDate,
//       String? shareUser,
//       num? superChapterId,
//       String? superChapterName,
//       List<dynamic>? tags,
//       String? title,
//       num? type,
//       num? userId,
//       num? visible,
//       num? zan,}){
//     _adminAdd = adminAdd;
//     _apkLink = apkLink;
//     _audit = audit;
//     _author = author;
//     _canEdit = canEdit;
//     _chapterId = chapterId;
//     _chapterName = chapterName;
//     _collect = collect;
//     _courseId = courseId;
//     _desc = desc;
//     _descMd = descMd;
//     _envelopePic = envelopePic;
//     _fresh = fresh;
//     _host = host;
//     _id = id;
//     _isAdminAdd = isAdminAdd;
//     _link = link;
//     _niceDate = niceDate;
//     _niceShareDate = niceShareDate;
//     _origin = origin;
//     _prefix = prefix;
//     _projectLink = projectLink;
//     _publishTime = publishTime;
//     _realSuperChapterId = realSuperChapterId;
//     _selfVisible = selfVisible;
//     _shareDate = shareDate;
//     _shareUser = shareUser;
//     _superChapterId = superChapterId;
//     _superChapterName = superChapterName;
//     _tags = tags;
//     _title = title;
//     _type = type;
//     _userId = userId;
//     _visible = visible;
//     _zan = zan;
// }
//
//   HomeListItemData.fromJson(dynamic json) {
//     _adminAdd = json['adminAdd'];
//     _apkLink = json['apkLink'];
//     _audit = json['audit'];
//     _author = json['author'];
//     _canEdit = json['canEdit'];
//     _chapterId = json['chapterId'];
//     _chapterName = json['chapterName'];
//     _collect = json['collect'];
//     _courseId = json['courseId'];
//     _desc = json['desc'];
//     _descMd = json['descMd'];
//     _envelopePic = json['envelopePic'];
//     _fresh = json['fresh'];
//     _host = json['host'];
//     _id = json['id'];
//     _isAdminAdd = json['isAdminAdd'];
//     _link = json['link'];
//     _niceDate = json['niceDate'];
//     _niceShareDate = json['niceShareDate'];
//     _origin = json['origin'];
//     _prefix = json['prefix'];
//     _projectLink = json['projectLink'];
//     _publishTime = json['publishTime'];
//     _realSuperChapterId = json['realSuperChapterId'];
//     _selfVisible = json['selfVisible'];
//     _shareDate = json['shareDate'];
//     _shareUser = json['shareUser'];
//     _superChapterId = json['superChapterId'];
//     _superChapterName = json['superChapterName'];
//     if (json['tags'] != null) {
//       _tags = [];
//       json['tags'].forEach((v) {
//         _tags?.add(HomeListItemData.fromJson(v));
//       });
//     }
//     _title = json['title'];
//     _type = json['type'];
//     _userId = json['userId'];
//     _visible = json['visible'];
//     _zan = json['zan'];
//   }
//   bool? _adminAdd;
//   String? _apkLink;
//   num? _audit;
//   String? _author;
//   bool? _canEdit;
//   num? _chapterId;
//   String? _chapterName;
//   bool? _collect;
//   num? _courseId;
//   String? _desc;
//   String? _descMd;
//   String? _envelopePic;
//   bool? _fresh;
//   String? _host;
//   num? _id;
//   bool? _isAdminAdd;
//   String? _link;
//   String? _niceDate;
//   String? _niceShareDate;
//   String? _origin;
//   String? _prefix;
//   String? _projectLink;
//   num? _publishTime;
//   num? _realSuperChapterId;
//   num? _selfVisible;
//   num? _shareDate;
//   String? _shareUser;
//   num? _superChapterId;
//   String? _superChapterName;
//   List<dynamic>? _tags;
//   String? _title;
//   num? _type;
//   num? _userId;
//   num? _visible;
//   num? _zan;
// Data copyWith({  bool? adminAdd,
//   String? apkLink,
//   num? audit,
//   String? author,
//   bool? canEdit,
//   num? chapterId,
//   String? chapterName,
//   bool? collect,
//   num? courseId,
//   String? desc,
//   String? descMd,
//   String? envelopePic,
//   bool? fresh,
//   String? host,
//   num? id,
//   bool? isAdminAdd,
//   String? link,
//   String? niceDate,
//   String? niceShareDate,
//   String? origin,
//   String? prefix,
//   String? projectLink,
//   num? publishTime,
//   num? realSuperChapterId,
//   num? selfVisible,
//   num? shareDate,
//   String? shareUser,
//   num? superChapterId,
//   String? superChapterName,
//   List<dynamic>? tags,
//   String? title,
//   num? type,
//   num? userId,
//   num? visible,
//   num? zan,
// }) => Data(  adminAdd: adminAdd ?? _adminAdd,
//   apkLink: apkLink ?? _apkLink,
//   audit: audit ?? _audit,
//   author: author ?? _author,
//   canEdit: canEdit ?? _canEdit,
//   chapterId: chapterId ?? _chapterId,
//   chapterName: chapterName ?? _chapterName,
//   collect: collect ?? _collect,
//   courseId: courseId ?? _courseId,
//   desc: desc ?? _desc,
//   descMd: descMd ?? _descMd,
//   envelopePic: envelopePic ?? _envelopePic,
//   fresh: fresh ?? _fresh,
//   host: host ?? _host,
//   id: id ?? _id,
//   isAdminAdd: isAdminAdd ?? _isAdminAdd,
//   link: link ?? _link,
//   niceDate: niceDate ?? _niceDate,
//   niceShareDate: niceShareDate ?? _niceShareDate,
//   origin: origin ?? _origin,
//   prefix: prefix ?? _prefix,
//   projectLink: projectLink ?? _projectLink,
//   publishTime: publishTime ?? _publishTime,
//   realSuperChapterId: realSuperChapterId ?? _realSuperChapterId,
//   selfVisible: selfVisible ?? _selfVisible,
//   shareDate: shareDate ?? _shareDate,
//   shareUser: shareUser ?? _shareUser,
//   superChapterId: superChapterId ?? _superChapterId,
//   superChapterName: superChapterName ?? _superChapterName,
//   tags: tags ?? _tags,
//   title: title ?? _title,
//   type: type ?? _type,
//   userId: userId ?? _userId,
//   visible: visible ?? _visible,
//   zan: zan ?? _zan,
// );
//   bool? get adminAdd => _adminAdd;
//   String? get apkLink => _apkLink;
//   num? get audit => _audit;
//   String? get author => _author;
//   bool? get canEdit => _canEdit;
//   num? get chapterId => _chapterId;
//   String? get chapterName => _chapterName;
//   bool? get collect => _collect;
//   num? get courseId => _courseId;
//   String? get desc => _desc;
//   String? get descMd => _descMd;
//   String? get envelopePic => _envelopePic;
//   bool? get fresh => _fresh;
//   String? get host => _host;
//   num? get id => _id;
//   bool? get isAdminAdd => _isAdminAdd;
//   String? get link => _link;
//   String? get niceDate => _niceDate;
//   String? get niceShareDate => _niceShareDate;
//   String? get origin => _origin;
//   String? get prefix => _prefix;
//   String? get projectLink => _projectLink;
//   num? get publishTime => _publishTime;
//   num? get realSuperChapterId => _realSuperChapterId;
//   num? get selfVisible => _selfVisible;
//   num? get shareDate => _shareDate;
//   String? get shareUser => _shareUser;
//   num? get superChapterId => _superChapterId;
//   String? get superChapterName => _superChapterName;
//   List<dynamic>? get tags => _tags;
//   String? get title => _title;
//   num? get type => _type;
//   num? get userId => _userId;
//   num? get visible => _visible;
//   num? get zan => _zan;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['adminAdd'] = _adminAdd;
//     map['apkLink'] = _apkLink;
//     map['audit'] = _audit;
//     map['author'] = _author;
//     map['canEdit'] = _canEdit;
//     map['chapterId'] = _chapterId;
//     map['chapterName'] = _chapterName;
//     map['collect'] = _collect;
//     map['courseId'] = _courseId;
//     map['desc'] = _desc;
//     map['descMd'] = _descMd;
//     map['envelopePic'] = _envelopePic;
//     map['fresh'] = _fresh;
//     map['host'] = _host;
//     map['id'] = _id;
//     map['isAdminAdd'] = _isAdminAdd;
//     map['link'] = _link;
//     map['niceDate'] = _niceDate;
//     map['niceShareDate'] = _niceShareDate;
//     map['origin'] = _origin;
//     map['prefix'] = _prefix;
//     map['projectLink'] = _projectLink;
//     map['publishTime'] = _publishTime;
//     map['realSuperChapterId'] = _realSuperChapterId;
//     map['selfVisible'] = _selfVisible;
//     map['shareDate'] = _shareDate;
//     map['shareUser'] = _shareUser;
//     map['superChapterId'] = _superChapterId;
//     map['superChapterName'] = _superChapterName;
//     if (_tags != null) {
//       map['tags'] = _tags?.map((v) => v.toJson()).toList();
//     }
//     map['title'] = _title;
//     map['type'] = _type;
//     map['userId'] = _userId;
//     map['visible'] = _visible;
//     map['zan'] = _zan;
//     return map;
//   }
//
// }