//int NUM_QUESTIONS = 3;
//String QUESTION_TEXTS[] = {
//  "7a. Look at each number pattern and find the missing number",
//  "7b. Look at each number pattern and find the missing number",
//  "8. Fill in each blank with the correct answer"
//};
//String QUESTION_ANSWERS[] = {
//  "4", 
//  "4",
//  "37,91,6,12,24,36"
//};
//String QUESTION_IMAGES[] = {
//  "img/tungch/7a.png",
//  "img/tungch/7b.png",
//  "img/tungch/8.png"
//};
//int QUESTION_IMAGES_WIDTH[] = {200, 200, 200};
//int QUESTION_IMAGES_HEIGHT[] = {200, 200, 200};

//PImage bg;
//PFont f;


//void drawSequence(int numBlocks, int height, int MAX_HEIGHT, int MAX_WIDTH) {
//}

  
//void settings() {
//  size(1024, 512);
//}
//QuizGame game;
//void setup() {
//  game = new QuizGame(NUM_QUESTIONS, QUESTION_TEXTS, QUESTION_IMAGES, QUESTION_IMAGES_WIDTH, QUESTION_IMAGES_HEIGHT, QUESTION_ANSWERS);

  
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
