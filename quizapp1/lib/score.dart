 import 'package:flutter/material.dart';


class Testscore extends StatelessWidget {
  final int score;
   final List<int> scoreList;
   
  const Testscore({required this.score,required this.scoreList});
  //  int calculateHighestScore() {
  //   return scoreList.isNotEmpty ? scoreList.reduce((a, b) => a > b ? a : b) : 0;
  // }
  @override
  Widget build(BuildContext context) {
    // int highestScore =calculateHighestScore();
    return Scaffold(
       appBar: AppBar(
        title: Text(" Result "),
      ),
     backgroundColor: Color.fromARGB(255, 85, 129, 206),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
              "Total Score",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              
            ),
          const  SizedBox(height: 16),
            Text(
              "$score / 3",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            
        
          ],
        ),
      ),
      );
  
  }
}