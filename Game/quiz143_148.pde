//int NUM_QUESTIONS = 14;
//String QUESTION_TEXTS[] = {
//  "8.7a. Look at each number pattern and find the missing number",
//  "8.7b. Look at each number pattern and find the missing number",
//  "8.8. Fill in each blank with the correct answer",
//  "8.9a. Look at each number pattern and find the missing number",
//  "8.9b. Look at each number pattern and find the missing number",
//  "8.9c. Look at each number pattern and find the missing number",
//  "8.10a. Look at each number pattern and find the unknown number",
//  "8.10b. Look at each number pattern and find the unknown number",
//  "8.11a. Find the unknown number",
//  "8.11b. Find the unknown number",
//  "8.11c. Find the unknown number",
//  "8.11d. Find the unknown number",
//  "8.12a. Look at each number pattern and find the unknown number",
//  "8.12b. Look at each number pattern and find the unknown number",
//};
//String QUESTION_ANSWERS[] = {
//  "4", 
//  "4",
//  "37,91,6,12,24,36",
//  "4",
//  "9",
//  "14",
//  "12,23",
//  "18,30",
//  "12,9",
//  "36,31",
//  "6,5",
//  "14,32,44",
//  "9",
//  "7"
//};
//String QUESTION_IMAGES[] = {
//  "img/tungch/7a.png",
//  "img/tungch/7b.png",
//  "img/tungch/8.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png",
//  "img/tungch/7b.png"
//};
//int QUESTION_IMAGES_WIDTH[] = {200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200};
//int QUESTION_IMAGES_HEIGHT[] = {200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200};
//String[][][] QUESTION_DATA = {};
  
//PImage bg;
//PFont f;


  
//void settings() {
//  size(1024, 512);
//}
//QuizGame game;
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
