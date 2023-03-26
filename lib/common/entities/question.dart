class QuestionItem {
  final String text;
  final String? text2;
  final List<Option> options;
  bool oneAnswer;
  List<Option>? selectedOptions;

  QuestionItem({
    required this.text,
    this.text2,
    required this.options,
    this.oneAnswer = true,
    this.selectedOptions,
  });
}

class Option {
  final String code;
  final String text;
  final bool isCorrect;

  Option({
    required this.code,
    required this.text,
    required this.isCorrect,
  });
}
