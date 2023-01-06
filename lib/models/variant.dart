import 'question.dart';

class Variant {
  int? variantId;
  String? text;
  String? textImage;
  List<Question>? questions;

  Variant({this.variantId, this.text, this.textImage, this.questions});

  Variant.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    text = json['text'];
    textImage = json['text_image'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant_id'] = variantId;
    data['text'] = text;
    data['text_image'] = textImage;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}