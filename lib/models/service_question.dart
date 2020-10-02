class ServiceQuestion {
  String question;
  String answer;
  String id;
  ServiceQuestion({this.question, this.answer, this.id});
  ServiceQuestion.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    id = json['id'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] =  this.answer;
    data['id'] = this.id;
    return data;
  }
}
