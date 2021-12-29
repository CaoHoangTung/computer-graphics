public abstract class Question {
  String TEXT;
  
  String ANSWER;
  
  Question(
    String _text, String _answer
  ) {
    TEXT = _text;
    ANSWER = _answer;
  }
  
  abstract void drawQuestion(float x, float y);
}

public class StarGraphQuestion extends Question{
  String[][] data;
  StarGraph graph = new StarGraph();
  
  StarGraphQuestion(String _text, String _answer, String[][] _data) {
    super(_text, _answer);
    data = _data;
  }
  
  void drawQuestion(float x, float y) {
     for (int i = 0; i < 3; i++) {
       graph.drawStarGraph(data[i], 180 + i * 300, 270, 30);
     }
  }
}

public class ImageQuestion extends Question {
  String image;
  float PADDING;
  float IMAGE_WIDTH = 200;
  float IMAGE_HEIGHT = 200;
  float BOX_WIDTH = 200;
  float BOX_HEIGHT = 200;
  
  ImageQuestion(
    String _text, String _answer, String _image, 
    float _padding, float _imageHeight, float _imageWidth,
    float _boxHeight, float _boxWidth
   ) {
    super(_text, _answer);
    image = _image;
    PADDING = _padding;
    IMAGE_WIDTH = _imageWidth;
    IMAGE_HEIGHT = _imageHeight;
    BOX_WIDTH = _boxWidth;
    BOX_HEIGHT = _boxHeight;
  }
  
  void drawQuestion(float x, float y) {
    PImage img = loadImageRelative(image);
    float IMAGE_X = (width-IMAGE_WIDTH)/2;
    float IMAGE_Y = PADDING*3 + BOX_HEIGHT;
    image(img, IMAGE_X, IMAGE_Y, IMAGE_WIDTH, IMAGE_HEIGHT); 
  }
}
