import 'package:flutter/material.dart';
import 'package:quizapp1/quizmodel.dart';
import 'package:quizapp1/score.dart';

class QuizScreen extends StatefulWidget {
  
  @override
  State<QuizScreen> createState() => QuizScreenState();
}



class QuizScreenState extends State<QuizScreen> {
   List<Question> questionList=getQuestions();
   List<int> scoreList = [];
   int currentQuestionIndex=0;
   int score=0;
   Answer?selectedAnswer;
   
   



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255,5,50,88),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
        child: Column(mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
           const Text(
              "Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),


           ),
          
           
           _questionWidget(),
           _answerList(),  
           _nextButton(),
           _previousButton(),
           
        ]),
       ),


    );
  }
    _questionWidget(){
      Question currentQuestion = questionList[currentQuestionIndex];
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text("Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
             color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.w400,
          ),
          
          ),
            const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                
                child: Text(
                  currentQuestion.questionText,
                  
                //  questionList[currentQuestionIndex].questionText,
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                
              )



         ],

      );
    }
    _answerList(){
        return Column(
          children: questionList[currentQuestionIndex]
          .answerList.map((e) => _answerButton(e),).toList(),

        ); 

    }

  Widget _answerButton(Answer answer)
{
  Question currentQuestion=questionList[currentQuestionIndex];
  bool isSelected=answer==currentQuestion.selectedAnswer;

  return Container(
     width: double.infinity,
     margin: const EdgeInsets.symmetric(vertical: 8),
     height: 48,
     child: ElevatedButton(
            child:Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        shape:const StadiumBorder(),
        backgroundColor:isSelected?Colors.orangeAccent: Colors.white,
        foregroundColor:isSelected?Colors.white: Colors.black,
      ),
      onPressed: (){
         if(currentQuestion.selectedAnswer==null){
          if(answer.isCorrect){
            score++;
          }
         }


        setState(() {
          currentQuestion.selectedAnswer=answer;
        });
      },
     ),


  );
}


 _nextButton(){

bool isLastQuestion=false;
if(currentQuestionIndex==questionList.length-1){
  isLastQuestion=true;
}

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: 48,
    child: ElevatedButton(
      child: Text(isLastQuestion ? "Submit" : "Next"),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: (){
         if(isLastQuestion)
      {
          scoreList.add(score);
        Navigator.push(
            context,
             MaterialPageRoute(builder: (context)=>Testscore(score: score,scoreList: scoreList),),
        );



      }
      else
      {
          setState(() {
            selectedAnswer=null;
            currentQuestionIndex++;
          });
      }
      },
    ),
  );
 }

//  _showScoreDialog(){
 
//   return AlertDialog(
//     title: Text(
//       "Score is $score"),
//   );
//  }

 _previousButton() {
  bool isFirstQuestion = false;
  if (currentQuestionIndex == 0) {
    isFirstQuestion = true;
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: 48,
    child: ElevatedButton(
      child: Text(isFirstQuestion ? "Start" : "Previous"),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        if (isFirstQuestion) {
          // Handle the case when the user is at the first question.
          // You might want to navigate to a different screen or perform some action.
        } else {
          setState(() {
            selectedAnswer = null;
            currentQuestionIndex--;
          });
        }
      },
    ),
  );

  
}

  }
