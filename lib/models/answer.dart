class Answer {
  String? identifier;
  String? answer;
  String? image;

  Answer({this.identifier, this.answer, this.image});

  Answer.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    answer = json['answer'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['answer'] = answer;
    data['image'] = image;
    return data;
  }
}