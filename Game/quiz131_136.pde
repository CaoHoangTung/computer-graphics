Question quiz131_136_questions[] = { 
  new Question(
    "9a. Randy paid $16 in all for 11 two-dollar and one-dollar stamps.How many two-dollar stamps did he buy ?",
    "5",
    new ImageFigure("./img/ore/dollar.png", 250, 250)
  ),

  new Question(
    "9b. Randy paid $16 in all for 11 two-dollar and one-dollar stamps.How many one-dollar stamps did he buy ?",
    "6",
    new ImageFigure("./img/ore/dollar.png", 250, 250)
  ),

  new Question(
    "10a. A truck as 6 wheels . A car has 4 wheels. 14 trucks and cars parked in a car park have a total of 72 wheels. How many trucks are there ?",
    "8",
    new ImageFigure("./img/ore/truck.png", 250, 250)
  ),

  new Question(
    "10b. A truck as 6 wheels . A car has 4 wheels. 14 trucks and cars parked in a car park have a total of 72 wheels. How many cars are there ?",
    "6",
    new ImageFigure("./img/ore/car.png", 250, 250)
  ),

  new Question(
    "1. Complete the number patterns",
    "9,11,12,17,25,36,47,95",
    new TableFigure(
      4, 6, 50, 50, 320, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 8, 10, 
      new String[][] {
        {"1", "3", "5", "7", "?", "?"}, 
        {"2", "3", "5", "8", "?", "?"},
        {"1", "4", "9", "16", "?", "?"},
        {"2", "5", "11", "23", "?", "?"}
      }
    )
  ),

  new Question(
    "2. Look at each pattern carefully and find the missing number",
    "8",
    new StarGraphFigure(
      new String[][] { 
        {"7", "5", "2", "4"}, 
        {"1", "6", "8", "3"},
        {"?", "7", "3", "4"}
      }, 
      3
    )
  ),

  new Question(
    "3a. Look at each number pattern and find the unknown numbers",
    "12,10",
    new MultiFigure(
      new TableFigure(
        2, 2, 50, 50, 250, 200, 0, 0, 10,
        new String[][] {
          {"12", "3"},
          {"10", "5"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 400, 200, 0, 0, 10,
        new String[][] {
          {"8", "3"},
          {"6", "5"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 550, 200, 0, 0, 10,
        new String[][] {
          {"14", "4"},
          {"A", "6"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 700, 200, 0, 0, 10,
        new String[][] {
          {"16", "2"},
          {"8", "B"}
        }
      )
    )
  ),

  new Question(
    "3b. Look at each number pattern and find the unknown numbers",
    "6,7",
    new MultiFigure(
      new TableFigure(
        2, 2, 50, 50, 250, 200, 0, 0, 10,
        new String[][] {
          {"13", "4"},
          {"7", "2"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 400, 200, 0, 0, 10,
        new String[][] {
          {"12", "5"},
          {"3", "4"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 550, 200, 0, 0, 10,
        new String[][] {
          {"18", "8"},
          {"C", "4"}
        }
      ),
      new TableFigure(
        2, 2, 50, 50, 700, 200, 0, 0, 10,
        new String[][] {
          {"22", "3"},
          {"12", "D"}
        }
      )
    )
  )
};


  
