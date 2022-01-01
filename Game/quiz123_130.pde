int NUM_QUESTIONS = 8;
String[] QUESTION_TEXTS = {
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
   "How many dragonflies are there?"
};

String[][][] QUESTION_DATA = {};
String QUESTION_IMAGES[] = {};
int QUESTION_IMAGES_WIDTH[] = {200, 200, 200, 200, 200, 200, 200, 200};
int QUESTION_IMAGES_HEIGHT[] = {200, 200, 200, 200, 200, 200, 200, 200};

String QUESTION_ANSWERS[] = {
  "5 3", 
  "2 3",
  "4 2",
  "6 2",
  "7 5",
  "8 9",
  "6 4",
  "4 6"
};
PImage bg;
PFont f;
  
void settings() {
  size(1024, 512);
}
QuizGame game;
StarGraph graph;
void setup() {
  game = new QuizGame(NUM_QUESTIONS, QUESTION_TEXTS, QUESTION_IMAGES, QUESTION_IMAGES_WIDTH, QUESTION_IMAGES_HEIGHT, QUESTION_ANSWERS, QUESTION_DATA);
  graph = new StarGraph();
  
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
