int NUM_QUESTIONS = 14;
String QUESTION_TEXTS[] = {
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
  new TableFigure(3, 3, 60, 60, 410, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 0, 10, new String[][] {new String[]{"4", "3", "10"}, new String[]{"5", "2", "8"}, new String[]{"7", "?", "26"}}),
  new TableFigure(3, 3, 60, 60, 410, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 0, 10, new String[][] {new String[]{"1", "2", "9"}, new String[]{"3", "2", "15"}, new String[]{"?", "5", "27"}}),
  new TableFigure(2, 6, 60, 60, 320, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 0, 10, new String[][] {new String[]{"1", "7", "19", "?", "61", "?"}, new String[]{"?", "?", "18", "?", "30", "?"}}),
  new MultiFigure(new CircleGraphFigure[]{
    new CircleGraphFigure(300, 250, 200, 4, 50, new String[] {"7", "8", "6", "4"}),
    new CircleGraphFigure(510, 250, 200, 4, 50, new String[] {"9", "7", "6", "3"}),
    new CircleGraphFigure(720, 250, 200, 4, 50, new String[] {"5", "?", "10", "6"})
  }),
  new MultiFigure(new CircleGraphFigure[]{
    new CircleGraphFigure(300, 250, 200, 3, 50, new String[] {"7", "5", "8"}),
    new CircleGraphFigure(510, 250, 200, 3, 50, new String[] {"6", "2", "12"}),
    new CircleGraphFigure(720, 250, 200, 3, 50, new String[] {"8", "?", "3"})
  }),
  new MultiFigure(new CircleGraphFigure[]{
    new CircleGraphFigure(300, 250, 200, 4, 50, new String[] {"15", "8", "8", "13"}),
    new CircleGraphFigure(510, 250, 200, 4, 50, new String[] {"17", "9", "13", "6"}),
    new CircleGraphFigure(720, 250, 200, 4, 50, new String[] {"18", "3", "?", "10"})
  }),
  new TableFigure(3, 3, 60, 60, 370, QUESTION_BOX_HEIGHT + PADDING * 4, 40, 0, 10, new String[][] {new String[]{"3", "6", "9"}, new String[]{"8", "A", "16"}, new String[]{"13", "18", "B"}}),
  new TableFigure(3, 3, 60, 60, 370, QUESTION_BOX_HEIGHT + PADDING * 4, 40, 0, 10, new String[][] {new String[]{"8", "13", "18"}, new String[]{"12", "A", "24"}, new String[]{"16", "23", "B"}}),
  new CircleGraphFigure(510, 250, 200, 8, 50, new String[] {"A", "5", "B", "28", "3", "20", "36", "7"}),
  new CircleGraphFigure(510, 250, 200, 8, 50, new String[] {"12", "6", "A", "42", "B", "30", "7", "18"}),
  new CircleGraphFigure(510, 250, 200, 8, 50, new String[] {"18", "A", "4", "27", "B", "15", "12", "9"}),
  new CircleGraphFigure(510, 250, 200, 8, 50, new String[] {"2", "C", "38", "B", "26", "20", "A", "8"}),
  new TableFigure(3, 3, 60, 60, 410, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 20, 10, new String[][] {new String[]{"6", "4", "8"}, new String[]{"7", "4", "12"}, new String[]{"A", "3", "24"}}),
  new TableFigure(3, 3, 60, 60, 410, QUESTION_BOX_HEIGHT + PADDING * 4, 0, 20, 10, new String[][] {new String[]{"2", "6", "14"}, new String[]{"3", "5", "19"}, new String[]{"4", "B", "34"}})
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
