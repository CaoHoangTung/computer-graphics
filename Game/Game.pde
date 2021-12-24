public class QuizGame {
  int PADDING = 10;
  int QUESTION_BOX_WIDTH;
  int QUESTION_BOX_HEIGHT = 100;
  int IMAGE_BOX_HEIGHT = 270;
  int ANSWER_BOX_HEIGHT = 100;
  int BOX_RADIUS = 20;
  int BOX_BACKGROUND_COLOR = #c6e2ff;
  int BOX_TEXT_COLOR = #666666;
  float BOX_OPACITY = 200;
  
  int NUM_QUESTIONS;
  int ACTIVE_QUESTION;
  String[] QUESTION_TEXTS;
  String[] QUESTION_IMAGES;
  int[] QUESTION_IMAGES_WIDTH;
  int[] QUESTION_IMAGES_HEIGHT;
  
  String[] QUESTION_ACTUAL_ANSWERS;
  ArrayList<String> QUESTION_INPUT_ANSWERS;
  int finalScore;
    
  QuizGame(int numQuestions, String[] questionTexts, String[] questionImages, 
            int[] questionImagesWidth, int[] questionImagesHeight, String[] questionAnswers) {
    NUM_QUESTIONS = numQuestions;
    QUESTION_TEXTS = questionTexts;
    QUESTION_IMAGES = questionImages;
    QUESTION_IMAGES_WIDTH = questionImagesWidth;
    QUESTION_IMAGES_HEIGHT = questionImagesHeight;
    ACTIVE_QUESTION = 0;
    QUESTION_BOX_WIDTH = width - PADDING*2;
    QUESTION_ACTUAL_ANSWERS = questionAnswers;
    QUESTION_INPUT_ANSWERS = new ArrayList();
    finalScore = 0;
  }
  
  void draw() {


    // fill background
    background(bg);
    textFont(f, 16);
    fill(0);

    
    if (ACTIVE_QUESTION == 0) {
      // draw begin game screen
      drawBeginGame();
    } else if (ACTIVE_QUESTION > NUM_QUESTIONS) {
      // draw endgame result screen
      drawEndGame();
    } else {
      drawQuestionTextBox();
  
      drawQuestionImage();
      
      drawUserInput();
    }
  }
  
  void drawQuestionTextBox() {
    // create question box
    fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING, QUESTION_BOX_WIDTH, QUESTION_BOX_HEIGHT, BOX_RADIUS);
    String str = QUESTION_TEXTS[ACTIVE_QUESTION-1];
    fill(BOX_TEXT_COLOR);
    textAlign(CENTER, CENTER);
    text(str, PADDING*2, PADDING*2,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
  }
  
  
  void drawQuestionImage() {
    // create image box
    int IMAGE_BOX_WIDTH = width - PADDING*2;
    int IMAGE_WIDTH = QUESTION_IMAGES_WIDTH[ACTIVE_QUESTION-1];
    int IMAGE_HEIGHT = QUESTION_IMAGES_HEIGHT[ACTIVE_QUESTION-1];
  
    fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING*2 + QUESTION_BOX_HEIGHT, IMAGE_BOX_WIDTH, IMAGE_BOX_HEIGHT, BOX_RADIUS);
    PImage img = loadImageRelative(QUESTION_IMAGES[ACTIVE_QUESTION-1]);
  
    int IMAGE_X = (width-IMAGE_WIDTH)/2;
    int IMAGE_Y = PADDING*3 + QUESTION_BOX_HEIGHT;
    image(img, IMAGE_X, IMAGE_Y, IMAGE_WIDTH, IMAGE_HEIGHT);
  }
  
  
  void drawUserInput() {
    String userInput = QUESTION_INPUT_ANSWERS.get(ACTIVE_QUESTION-1);
      
    // create user input box
    fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING*3 + QUESTION_BOX_HEIGHT + IMAGE_BOX_HEIGHT, QUESTION_BOX_WIDTH, QUESTION_BOX_HEIGHT, BOX_RADIUS);
    

    textAlign(CENTER, CENTER);
    fill(0);    
    text("Your answer", PADDING*2, PADDING + QUESTION_BOX_HEIGHT + IMAGE_BOX_HEIGHT,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
    fill(BOX_TEXT_COLOR);
    text(userInput, PADDING*2, PADDING*3 + QUESTION_BOX_HEIGHT + IMAGE_BOX_HEIGHT,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
    
    String navigationMsg = getNavigationMsg();
    text(navigationMsg, PADDING*2, PADDING*7 + QUESTION_BOX_HEIGHT + IMAGE_BOX_HEIGHT,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
  } 
  
  String getNavigationMsg() {
    if (ACTIVE_QUESTION == 1)
      return "                                Next question ->";
    else if (ACTIVE_QUESTION == NUM_QUESTIONS)
      return "<- Previous question            <Enter> to submit";
    else
      return "<- Previous question            Next question ->";
  }
  
  void drawBeginGame() {
        fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING, width-PADDING*2, height-PADDING*2);
    
    fill(BOX_TEXT_COLOR);
    textAlign(CENTER, CENTER);
    
    String msg = "Press <Enter> to begin the quiz";
    text(msg, PADDING*2, PADDING*2, width-PADDING*4, height-PADDING*4);
  } 
  
  void drawEndGame() {
    fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING, width-PADDING*2, height-PADDING*2);
    
    fill(BOX_TEXT_COLOR);
    textAlign(CENTER, CENTER);
    
    String msg = String.format("Your score: %s/%s\nPRESS r TO REPLAY\nPress <ESC> to exit", finalScore, NUM_QUESTIONS);
    text(msg, PADDING*2, PADDING*2, width-PADDING*4, height-PADDING*4);
  } 
  
  
  void handleKeyPressed(String k) {
    switch (k) {
      case "r":
        if (gameHasEnded())
          resetGame();
        else {
          if (!gameIsBeginning())
            QUESTION_INPUT_ANSWERS.set(ACTIVE_QUESTION-1, QUESTION_INPUT_ANSWERS.get(ACTIVE_QUESTION-1) + k);
        }
        break;
      case "<LEFT>":
        toogleQuestion(-1);
        break;
      case "<RIGHT>":
        if (!gameIsBeginning())
          toogleQuestion(1);
        break;
      case "<ENTER>":
        if (gameIsBeginning())        
          startGame();
        else if (gameAtLastQuestion())
          submit();
        break;
      case "<BACKSPACE>":
        if (!gameIsBeginning()) {
          String userInput = QUESTION_INPUT_ANSWERS.get(ACTIVE_QUESTION-1);
          if (userInput.length() > 0)
            QUESTION_INPUT_ANSWERS.set(ACTIVE_QUESTION-1, userInput.substring(0, userInput.length()-1));
        }
        break;
      default:
        if (!gameIsBeginning() && !gameHasEnded())
          QUESTION_INPUT_ANSWERS.set(ACTIVE_QUESTION-1, QUESTION_INPUT_ANSWERS.get(ACTIVE_QUESTION-1) + k);
    }
  }
  
  void startGame() {
    finalScore = 0;
    QUESTION_INPUT_ANSWERS = new ArrayList();
    for (int i = 0 ; i < NUM_QUESTIONS ; i++)
      QUESTION_INPUT_ANSWERS.add("");
    ACTIVE_QUESTION = 1;
  }
  
  void resetGame() {
    ACTIVE_QUESTION = 0;
  }
  
  void submit() {
    finalScore = 0;
    ACTIVE_QUESTION = NUM_QUESTIONS + 1;
    for (int i = 0 ; i < NUM_QUESTIONS ; i++) {
      String userAnswer = QUESTION_INPUT_ANSWERS.get(i);
      String actualAnswer = QUESTION_ACTUAL_ANSWERS[i];
      if (userAnswer.equals(actualAnswer)) {
        finalScore++;
      }
    }
  }

  
  boolean gameHasEnded() {
    return ACTIVE_QUESTION > NUM_QUESTIONS;
  }
  
  boolean gameIsBeginning() {
    return ACTIVE_QUESTION == 0;
  }
  
  boolean gameAtLastQuestion() {
    return ACTIVE_QUESTION == NUM_QUESTIONS;
  }
  
  void toogleQuestion(int move) {
    int nextQuestion = ACTIVE_QUESTION + move;
    if (nextQuestion <= 0 || nextQuestion > NUM_QUESTIONS)
      return;
    
    while (nextQuestion > QUESTION_INPUT_ANSWERS.size())
      QUESTION_INPUT_ANSWERS.add("");
    ACTIVE_QUESTION = nextQuestion;
  }
  
  void previousQuestion() {
    if (ACTIVE_QUESTION == 1)
      return;
    ACTIVE_QUESTION--;
  }
  
  void nextQuestion() {
    if (ACTIVE_QUESTION > NUM_QUESTIONS)
      return;
    ACTIVE_QUESTION++;
  }
}
