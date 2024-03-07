import 'package:flutter/material.dart';

class QuizUp extends StatefulWidget {
  const QuizUp({super.key});

  @override
  State createState() => _MQuizAppState();
}

class AppData {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const AppData({this.question, this.options, this.answerIndex});
}

class _MQuizAppState extends State {
  List allQuestions = [
    const AppData(
      question: "1. Which programming language is developed by Google?",
      options: ["Java", "C++", "Python", "Dart"],
      answerIndex: 3,
    ),
    const AppData(
      question: "2. What is the purpose of firewall in computer security?",
      options: [
        "Protect against viruses",
        "Control unauthorized access",
        "Regulate internet speed",
        "Monitor social media usage"
      ],
      answerIndex: 1,
    ),
    const AppData(
      question:
          "3. In context of internet speed what does the acronym 'Mbps' stand for ?",
      options: [
        "MegaByte per Second",
        "MicroBits per Second",
        "Megabits per Second",
        "Milliseconds per Second"
      ],
      answerIndex: 0,
    ),
    const AppData(
      question:
          "4. Which company's slogan is 'Think Different' and has been a major player of personal computers?",
      options: ["Dell", "Apple", "Microsoft", "HP"],
      answerIndex: 1,
    ),
    const AppData(
      question:
          "5. Which file format is commonly used for compressed archives, especially on Windows systems?",
      options: ["PNG", "PDF", "ZIP", "GIF"],
      answerIndex: 2,
    ),
  ];

  int questionScreen = 0;
  int questionIndex = 0;
  int selectedIndex = -1;
  int selectionCount = 0;
  int score = 0;

  MaterialStateProperty<Color?> checkAnswer(int option) {
    if (selectedIndex != -1) {
      if (option == allQuestions[questionIndex].answerIndex) {
        if (option == selectedIndex && selectionCount == 1) {
          score++;
        }
        return const MaterialStatePropertyAll(Colors.green);
      } else if (option == selectedIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return MaterialStatePropertyAll(Colors.amber[100]);
      }
    } else {
      return MaterialStatePropertyAll(Colors.amber[100]);
    }
  }

  void pageNevigation() {
    selectionCount = 0;
    if (selectedIndex != -1) {
      questionIndex++;
      selectedIndex = -1;
      if (questionIndex > allQuestions.length - 1) {
        questionScreen = 2;
      }
    }
    setState(() {});
  }

  Scaffold whichScreen() {
    if (questionScreen == 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "QuizUp",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Time for a",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                "assets/images/quiz2.png",
                height: 330,
                width: 330,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    questionScreen = 1;
                    setState(() {});
                  },
                  child: Text(
                    "Let's Begin",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (questionScreen == 1) {
      return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.laptop_mac,
            size: 35,
          ),
          title: const Text(
            "Tech Quiz",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Question: ${questionIndex + 1}/${allQuestions.length}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${allQuestions[questionIndex].question}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 0;
                    }
                    selectionCount++;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.only(left: 35),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(0),
                  ),
                  child: Text(
                    "A. ${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 1;
                    }
                    selectionCount++;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.only(left: 35),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(1),
                  ),
                  child: Text(
                    "B. ${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 2;
                    }
                    selectionCount++;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.only(left: 35),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(2),
                  ),
                  child: Text(
                    "C. ${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 3;
                    }
                    selectionCount++;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.only(left: 35),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(3),
                  ),
                  child: Text(
                    "D. ${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    pageNevigation();
                  },
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.only(left: 130),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.amber,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "QuizUp",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.amber[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Congratulations!!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assets/images/trophy3.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You have completed the Quiz successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Score: ",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$score/",
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${allQuestions.length}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        questionIndex = 0;
                        questionScreen = 1;
                        selectedIndex = -1;
                        score = 0;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          Colors.amber,
                        ),
                      ),
                      child: const Text(
                        "Restart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            questionIndex = 0;
            questionScreen = 0;
            selectedIndex = -1;
            score = 0;
            setState(() {});
          },
          child: const Icon(Icons.home),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return whichScreen();
  }
}
