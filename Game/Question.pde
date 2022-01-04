public class Question {
    public String text;
    public QuestionFigure figure;
    public String answer;

    public Question(String text, String answer, QuestionFigure figure) {
        this.text = text;
        this.figure = figure;
        this.answer = answer;
    }

    public Question(String text, String answer) {
        this(text, answer, new EmptyFigure());
    }

}

ArrayList<Question> allQuestions = new ArrayList();

void addQuestions(Question[] questions) {
  for (Question question: questions) {
    allQuestions.add(question);
  }
}
