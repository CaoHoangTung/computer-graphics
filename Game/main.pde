import processing.sound.*;
SoundFile file;

void settings() {
  size(1024, 512);
}

QuizGame game;
PImage bg;
PFont f;

void playSound(String path, boolean loop) {
  file = new SoundFile(this, path);
  if (loop) {
    file.loop();
  } else {
    file.play();
  }
}

void setup() {
  addQuestions(quiz115_122_questions);
  addQuestions(quiz123_130_questions);
  addQuestions(quiz131_136_questions);
  addQuestions(quiz137_142_questions);
  addQuestions(quiz143_148_questions);
  game = new QuizGame(allQuestions);

  bg = loadImageRelative("./img/bg1.jpg");
  f = createFont("Georgia", 26, true);
  playSound("timer.wav", true);
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
