class Question{
  final String questionText;
  final List<Answer> answerList;
  Answer? selectedAnswer; 
  Question(this.questionText,this.answerList);
  
}
class Answer{
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText,this.isCorrect);
}


List<Question> getQuestions(){
  List<Question> list=[];

  list.add(
    Question("Who developed the Flutter Framework?",
    [
      Answer("Facebook", false),
       Answer("Microsoft", false),
        Answer("Google", true),
         Answer("Oracle", false),

    ],
  )
  );
  list.add(
    Question("Which language is used to build Flutter applications?",
    [
      Answer("Kotlin", false),
       Answer("C#", false),
        Answer("Java", false),
         Answer("Dart", true),

    ],
  )
  );
  list.add(
    Question("How many types of widgets are there in flutter?",
    [
      Answer("2", true),
       Answer("4", false),
        Answer("6", false),
         Answer("8", false),

    ],
  )
  );
  return list;
}

