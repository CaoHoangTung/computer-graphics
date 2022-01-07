DrawUtil drawUtil = new DrawUtil();
int PADDING = 10;
int QUESTION_BOX_WIDTH;
int QUESTION_BOX_HEIGHT = 100;
int IMAGE_BOX_HEIGHT = 270;
int ANSWER_BOX_HEIGHT = 100;
int BOX_RADIUS = 20;
int BOX_BACKGROUND_COLOR = #c6e2ff;
int BOX_TEXT_COLOR = #666666;
float BOX_OPACITY = 200;
int TIME_LIMIT = 60000;

public class QuizGame {
  boolean hasAnnouncedBegin = false;
  boolean hasAnnouncedEnd = false;
  
  int activeQuestionId;
  private int finalScore;
  
  ArrayList<Question> questions;
  ArrayList<String> userAnswers;
  
  Timer timer;
    
  QuizGame(ArrayList<Question> questions) {
    this.questions = questions;
    QUESTION_BOX_WIDTH = width - PADDING * 2;
    activeQuestionId = 0;
    userAnswers = new ArrayList();
  }
  
  void draw() {
    // fill background
    background(bg);
    textFont(f, 16);
    fill(0);
    
    if (activeQuestionId == 0) {
      // draw begin game screen
      drawBeginGame();
    } else if (activeQuestionId > questions.size()) {
      // draw endgame result screen
      if (!hasAnnouncedEnd) {
        hasAnnouncedEnd = true;
        startSound.pause();
        endSound.play();  
      }
      drawEndGame();
    } else {
      if (!hasAnnouncedBegin) {
        hasAnnouncedBegin = true;
        startSound.loop();
        this.timer = new Timer(millis(), TIME_LIMIT);
      }
      
      if (this.timer.ended()) {
        submit();
      } else {
        drawQuestionTextBox();
      
        drawQuestionContent();
  
        drawUserInput();
      }
      
    }
  }
  
  void drawQuestionTextBox() {
    // create question box
    fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
    rect(PADDING, PADDING, QUESTION_BOX_WIDTH, QUESTION_BOX_HEIGHT, BOX_RADIUS);
    String str = questions.get(activeQuestionId-1).text;
    fill(BOX_TEXT_COLOR);
    textAlign(CENTER, CENTER);
    text(str, PADDING*2, PADDING*2,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
    text(timer.getTimeLeft(), PADDING*48, PADDING*5,
      QUESTION_BOX_WIDTH-PADDING*2, QUESTION_BOX_HEIGHT-PADDING*2);
  }
  
  void drawQuestionContent() {
      // create image box
      int IMAGE_BOX_WIDTH = width - PADDING*2;
      
      fill(BOX_BACKGROUND_COLOR, BOX_OPACITY);
      rect(PADDING, PADDING*2 + QUESTION_BOX_HEIGHT, IMAGE_BOX_WIDTH, IMAGE_BOX_HEIGHT, BOX_RADIUS);
      
      questions.get(activeQuestionId-1).figure.draw();
  }
  
  void drawUserInput() {
    String userInput = userAnswers.get(activeQuestionId-1);
      
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
    if (activeQuestionId == 1)
      return "                                Next question ->";
    else if (activeQuestionId == questions.size())
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
    
    String msg = String.format("Your score: %s/%s\nPRESS r TO REPLAY\nPress <ESC> to exit", finalScore, questions.size());
    text(msg, PADDING*2, PADDING*2, width-PADDING*4, height-PADDING*4);
  } 
  
  
  void handleKeyPressed(String k) {
    switch(k) {
      case "r":
        if (gameHasEnded())
          resetGame();
        else {
          if (!gameIsBeginning())
            userAnswers.set(activeQuestionId-1, userAnswers.get(activeQuestionId-1) + k);
        }
        break;
      case "<LEFT>":
        toggleQuestion(-1);
        break;
      case "<RIGHT>":
        if (!gameIsBeginning())
          toggleQuestion(1);
        break;
      case "<ENTER>":
        if (gameIsBeginning())        
          startGame();
        else if (gameAtLastQuestion())
          submit();
        break;
      case "<BACKSPACE>":
        if (!gameIsBeginning()) {
          String userInput = userAnswers.get(activeQuestionId-1);
          if (userInput.length() > 0)
            userAnswers.set(activeQuestionId-1, userInput.substring(0, userInput.length()-1));
        }
        break;
      default:
        if (!gameIsBeginning() && !gameHasEnded())
          userAnswers.set(activeQuestionId-1, userAnswers.get(activeQuestionId-1) + k);
    }
  }
  
  void startGame() {
    userAnswers = new ArrayList();
    for (int i = 0 ; i < questions.size() ; i++)
      userAnswers.add("");
    activeQuestionId = 1;
  }
  
  void resetGame() {
    activeQuestionId = 0;
    hasAnnouncedBegin = false;
    hasAnnouncedEnd = false;
  }
  
  void submit() {
    finalScore = 0;
    activeQuestionId = questions.size() + 1;
    for (int i = 0 ; i < questions.size(); i++) {
      String userAnswer = userAnswers.get(i);
      String actualAnswer = questions.get(i).answer;
      if (userAnswer.equals(actualAnswer)) {
        finalScore++;
      }
    }
  }

  
  boolean gameHasEnded() {
    return activeQuestionId > questions.size();
  }
  
  boolean gameIsBeginning() {
    return activeQuestionId == 0;
  }
  
  boolean gameAtLastQuestion() {
    return activeQuestionId == questions.size();
  }
  
  void toggleQuestion(int move) {
    if (activeQuestionId > questions.size())
      return;
      
    int nextQuestion = activeQuestionId + move;
    if (nextQuestion <= 0 || nextQuestion > questions.size())
      return;
    
    while (nextQuestion > userAnswers.size()) {
      userAnswers.add("");
    }

    activeQuestionId = nextQuestion;
  }
  
  void previousQuestion() {
    if (activeQuestionId == 1)
      return;
    activeQuestionId--;
  }
  
  void nextQuestion() {
    if (activeQuestionId > questions.size())
      return;
    activeQuestionId++;
  }
}
