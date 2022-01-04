void settings() {
  size(1024, 512);
}

QuizGame game;
PImage bg;
PFont f;



void setup() {
  addQuestions(quiz123_130_questions);
  addQuestions(quiz115_122_questions);
  game = new QuizGame(allQuestions);

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
