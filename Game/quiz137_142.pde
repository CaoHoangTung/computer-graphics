//int NUM_QUESTIONS = 3;
//String[] QUESTION_TEXTS = {
//   "2a. Look at each pattern carefully and find the missing number.",
//   "2b. Look at each pattern carefully and find the missing number.",
//   "2c. Look at each pattern carefully and find the missing number."
//};

//String[][][] QUESTION_DATA = {
  //  {
  //    {"2", "3", "5", "10"}, 
  //    {"2", "2", "4", "8"},
  //    {"6", "3", "3", "?"}
  //  },
//  {
//    {"2", "7", "5", "14"}, 
//    {"6", "5", "4", "15"},
//    {"?", "8", "2", "11"}
//  },
//  {
//    {"2", "17", "5", "3"}, 
//    {"4", "28", "6", "4"},
//    {"5", "40", "?", "7"}
//  }
//};
//String QUESTION_IMAGES[] = {};
//int QUESTION_IMAGES_WIDTH[] = {200, 200, 200};
//int QUESTION_IMAGES_HEIGHT[] = {200, 200, 200};

//String QUESTION_ANSWERS[] = {
//  "12", 
//  "1",
//  "5"
//};
//PImage bg;
//PFont f;
  
//void settings() {
//  size(1024, 512);
//}
//QuizGame game;
//Hehe hehe = new Hehe();

//void setup() {
//  game = new QuizGame(NUM_QUESTIONS, QUESTION_TEXTS, QUESTION_IMAGES, QUESTION_IMAGES_WIDTH, QUESTION_IMAGES_HEIGHT, QUESTION_ANSWERS, QUESTION_DATA);
  
//  bg = loadImageRelative("./img/bg1.jpg");
//  f = createFont("Georgia", 26, true);
//}

//void draw() {
//  game.draw();
//}

//void keyReleased() {
//  switch (key) {
//    case ENTER:
//      game.handleKeyPressed("<ENTER>");
//      break;
//    case RETURN:
//      game.handleKeyPressed("<ENTER>");
//      break;
//    case BACKSPACE:
//      game.handleKeyPressed("<BACKSPACE>");
//      break;
//    case ESC:
//      game.handleKeyPressed("<ESC>");
//      break;
//    case CODED:
//      switch (keyCode) {
//        case LEFT:
//          game.handleKeyPressed("<LEFT>");
//          break;
//        case RIGHT:
//          game.handleKeyPressed("<RIGHT>");
//          break;
//        default:
//          break;
//      }
//      break;
//    default:
//      game.handleKeyPressed(str(key));
//  }
  
//}
