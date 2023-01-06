import 'variant.dart';

class Subject {
  int? subjectId;
  String? subjectName;
  bool? mainSubject;
  List<Variant>? variants;

  Subject({this.subjectId, this.subjectName, this.mainSubject, this.variants});

  Subject.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    mainSubject = json['main_subject'];
    if (json['variants'] != null) {
      variants = <Variant>[];
      json['variants'].forEach((v) {
        variants!.add(Variant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_id'] = subjectId;
    data['subject_name'] = subjectName;
    data['main_subject'] = mainSubject;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}