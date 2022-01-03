int NUM_QUESTIONS = 12;
String QUESTION_TEXTS[] = {
    "8.7a. Look at each number pattern and find the missing number",
    
   "7.1 There are 8 cars and motorcycles in a car park. There are a total of 26 wheels.\n" + 
     "How many cars are in the car park?\n" + 
     "How many motorcycles are in the car park?",
   "7.2 An adult movie ticket cost $8. A child movie ticket cost $5. Mr Fox paid $31 in all for 5 movie tickets.\n" + 
     "How many adult movie tickets did he buy? \n" + 
     "How many child movie tickets did he buy? \n",
   "7.3 A science fiction book cost $5. A book on adventures cost $3. Louisa paid $26 in all for 6 books.\n" + 
     "How many science fiction books did she buy?\n" +
     "How many books on adventures did she buy?",
   "7.4A tricycle has 3 wheels. A bicycle has 2 wheels. 8 tricycles and bicycles have 22 wheels altogether.\n" + 
     "How many tricycles are there?\n" + 
     "How many bicycles are there?",
   "7.5 A farmer has 12 chickens and rabbits. There are 34 legs altogether.\n" + 
     "How many chickens does the farmer have?\n" + 
     "How many rabbits does the farmer have?",
   "7.6 A farmer has 17 chickens and rabbits. Hw counts 52 legs in all.\n" + 
     "How many chickens does he have?\n" + 
     "How many rabbits does he have?",
   "7.7 A big box can hold 12 marbles. A small box can hold 6 marbles. 84 marbles are to be placed into 10 boxes.\n" +
     "How many big boxes are there?\n" + 
     "How many small boxes are there?",
   "7.8 A spider has 8 legs. A dragonfly has 6 legs. 10 spiders and dragonflies have 68 legs altogether.\n" + 
     "How many spiders are there?\n" + 
     "How many dragonflies are there?",

  "2a. Look at each pattern carefully and find the missing number.",
  
  "8.7a. Look at each number pattern and find the missing number",
  "8.7b. Look at each number pattern and find the missing number",
  "8.8. Fill in each blank with the correct answer",
  "8.9a. Look at each number pattern and find the missing number",
  "8.9b. Look at each number pattern and find the missing number",
  "8.9c. Look at each number pattern and find the missing number",
  "8.10a. Look at each number pattern and find the unknown number",
  "8.10b. Look at each number pattern and find the unknown number",
  "8.11a. Find the unknown number",
  "8.11b. Find the unknown number",
  "8.11c. Find the unknown number",
  "8.11d. Find the unknown number",
  "8.12a. Look at each number pattern and find the unknown number",
  "8.12b. Look at each number pattern and find the unknown number",
};

String QUESTION_ANSWERS[] = {
  "4", 
    
  "5,3", 
  "2,3",
  "4,2",
  "6,2",
  "7,5",
  "8,9",
  "6,4",
  "4,6",
  
  "37,91,6,12,24,36",
   
  "4", 
  "4",
  "37,91,6,12,24,36",
  "4",
  "9",
  "14",
  "12,23",
  "18,30",
  "12,9",
  "36,31",
  "6,5",
  "14,32,44",
  "9",
  "7"
};

QuestionFigure QUESTION_FIGURES[] = {
  new TableFigure(3, 3, 30, 30, 100, 100, 0, 0, 10, new String[][] {new String[]{"10", "2", "3"}, new String[]{"4", "5", "6"}, new String[]{"7", "8", "9"}}),
  
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  
  new StarGraphFigure(new String[][] { 
    {"2", "3", "5", "10"}, 
    {"2", "2", "4", "8"},
    {"6", "3", "3", "?"}
  }, 3),
  
  new TableFigure(3, 3, 30, 30, 100, 100, 0, 0, 10, new String[][] {new String[]{"10", "2", "3"}, new String[]{"4", "5", "6"}, new String[]{"7", "8", "9"}}),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure(),
  new EmptyFigure()
  
};

PImage bg;
PFont f;

  
void settings() {
  size(1024, 512);
}
QuizGame game;
void setup() {
  game = new QuizGame(NUM_QUESTIONS, QUESTION_TEXTS, QUESTION_FIGURES, QUESTION_ANSWERS);

  
  bg = loadImageRelative("./img/bg1.jpg");
  f = createFont("Georgia", 26, true);
}

void draw() {
  game.draw();
}

void keyReleased() {
  switch (key) {
    case ENTER:
      game.handleKeyPressed("<ENTER>");
      break;
    case RETURN:
      game.handleKeyPressed("<ENTER>");
      break;
    case BACKSPACE:
      game.handleKeyPressed("<BACKSPACE>");
      break;
    case ESC:
      game.handleKeyPressed("<ESC>");
      break;
    case CODED:
      switch (keyCode) {
        case LEFT:
          game.handleKeyPressed("<LEFT>");
          break;
        case RIGHT:
          game.handleKeyPressed("<RIGHT>");
          break;
        default:
          break;
      }
      break;
    default:
      game.handleKeyPressed(str(key));
  }
  
}
