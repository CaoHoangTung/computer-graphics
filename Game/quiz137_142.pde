Question quiz137_142_questions[] = { 
  new Question(
    "2a. Look at each pattern carefully and find the missing number.", 
    "12",
    new StarGraphFigure(
      new String[][] { 
        {"2", "3", "5", "10"}, 
        {"2", "2", "4", "8"},
        {"6", "3", "3", "?"}
      }, 
      3
    )
  ),
  new Question(
    "2b. Look at each pattern carefully and find the missing number.", 
    "1",
    new StarGraphFigure(
      new String[][] { 
        {"2", "7", "5", "14"}, 
        {"6", "5", "4", "15"},
        {"?", "8", "2", "11"}
      }, 
      3
    )
  ),
  new Question(
    "2c. Look at each pattern carefully and find the missing number.", 
    "5",
    new StarGraphFigure(
      new String[][] { 
        {"2", "17", "5", "3"}, 
        {"4", "28", "6", "4"},
        {"5", "40", "?", "7"}
      }, 
      3
    )
  ),
  new Question(
    "4a. Look at each number pattern and find the unknown numbers\n" + 
    "Answer in form: A,B",
    "8,15",
    new MultiFigure(
      new TableFigure(2, 2, 60, 60, 150, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"8", "4"}, {"6", "2"}}),
      new TableFigure(2, 2, 60, 60, 450, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"11", "9"}, {"10", "A"}}),
      new TableFigure(2, 2, 60, 60, 750, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"12", "5"}, {"B", "8"}})
    )
  ),
  new Question(
    "4b. Look at each number pattern and find the unknown numbers\n" + 
    "Answer in form: A,B",
    "14,11",
    new MultiFigure(
      new TableFigure(2, 2, 60, 60, 150, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"17", "4"}, {"11", "7"}}),
      new TableFigure(2, 2, 60, 60, 450, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"19", "5"}, {"A", "9"}}),
      new TableFigure(2, 2, 60, 60, 750, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"21", "4"}, {"15", "B"}})
    )
  ),
  new Question(
    "4c. Look at each number pattern and find the unknown numbers\n" + 
    "Answer in form: A,B",
    "22,12",
    new MultiFigure(
      new TableFigure(2, 2, 60, 60, 150, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"20", "5"}, {"3", "8"}}),
      new TableFigure(2, 2, 60, 60, 450, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"A", "6"}, {"4", "10"}}),
      new TableFigure(2, 2, 60, 60, 750, QUESTION_BOX_HEIGHT + PADDING * 6, 0, 0, 10, new String[][] {{"24", "7"}, {"5", "B"}})
    )
  ),
  new Question(
    "7a. Look at each number pattern and find the missing number.",
    "4",
    new TableFigure(3, 3, 60, 60, 420, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 20, 10, new String[][] {{"4", "3", "10"}, {"5", "2", "8"}, {"7", "?", "26"}})
  ),
  new Question(
    "7b. Look at each number pattern and find the missing number.",
    "4",
    new TableFigure(3, 3, 60, 60, 420, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 20, 10, new String[][] {{"1", "2", "9"}, {"3", "2", "15"}, {"?", "5", "27"}})
  )
};
