abstract public class QuestionFigure {
  abstract public void draw();
}

/*
  Empty figure used for questions with no figures
*/
public class EmptyFigure extends QuestionFigure {
  public EmptyFigure() {}
  
  public void draw() {}
}


/*
  Multi circle graph figure
*/
public class MultiFigure extends QuestionFigure {
  QuestionFigure[] figures;
  
  public MultiFigure(QuestionFigure... figures) {
    this.figures = figures;
  }
  
  public void draw() {
    for (QuestionFigure figure: figures) {
      figure.draw();
    }
  }
}

/*
  Circle graph figure
*/
public class CircleGraphFigure extends QuestionFigure {
  float x0, y0, ratio;
  int numBlocks, txtDist;
  String[] arr;
  
  public CircleGraphFigure(float x0, float y0, float ratio, int numBlocks, int txtDist, String[] arr) {
    this.x0 = x0;
    this.y0 = y0;
    this.ratio = ratio;
    this.numBlocks = numBlocks;
    this.txtDist = txtDist;
    this.arr = arr;
  }
  
  public void draw() {
    if (360 % numBlocks != 0) {
      return;
    }
    
    fill(255, 255, 255);
    circle(x0, y0, ratio);
    
    PVector center = new PVector(x0, y0);
    int subDegree = 360 / numBlocks;
    for (int i = 270, cnt = 0; i > -90; i -= subDegree, cnt++) {
      //println(i);
      fill(255, 255, 255);
      float x = center.x + cos(radians(i)) * (ratio / 2);
      float y = center.y + sin(radians(i)) * (ratio / 2);
      line(center.x, center.y, x, y);
        
      //line(center.x, center.y, txtX, txtY);
    }
      
    fill(0, 0, 0);
    for (int i = 270, cnt = 0; i > -90; i -= subDegree, cnt++) {
      float txtX = center.x + cos(radians(i-subDegree/2)) * txtDist;
      float txtY = center.y + sin(radians(i-subDegree/2)) * txtDist;

      textAlign(CENTER);
      text(String.valueOf(arr[cnt]), txtX, txtY);
    }
  }
}

/*
  Table figure
*/
public class TableFigure extends QuestionFigure {
  int numRows, numCols;
  float blockWidth, blockHeight, x, y, distX, distY, txtSize;
  String[][] arr;
  
  public TableFigure(int numRows, int numCols, float blockWidth, float blockHeight, float x, float y, float distX, float distY, float txtSize, String[][] arr) {
    this.numRows = numRows;
    this.numCols = numCols;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.x = x;
    this.y = y;
    this.distX = distX;
    this.distY = distY;
    this.txtSize = txtSize;
    this.arr = arr;
  }
  
  public void drawSequence(int numBlocks, float blockWidth, float blockHeight, float x0, float y0, float blockDist, float txtSize, String[] arr) {
    for (int i = 0; i < numBlocks; ++i) {
      fill(255, 255, 255);
      rect(x0, y0, blockWidth, blockHeight);     
    
      fill(0, 0, 0);

      textAlign(CENTER);
      text(String.valueOf(arr[i]), x0, y0+ txtSize, blockWidth, blockHeight);
    
      x0 += blockWidth + blockDist;
    }
  }
  
  public void draw() {
    float y0 = y;
    for (int i = 0; i < numRows; ++i) {
      drawSequence(numCols, blockWidth, blockHeight, x, y0, distX, txtSize, arr[i]);
      y0 += blockHeight + distY;
    }
  }
}

/*
  Image figure
*/
public class ImageFigure extends QuestionFigure {
  String path;
  int imgWidth, imgHeight;
  
  public ImageFigure(String path, int imgWidth, int imgHeight) {
    this.path = path;
    this.imgWidth = imgWidth;
    this.imgHeight = imgHeight;
  }
  
  public void draw() {
    PImage img = loadImageRelative(this.path);
  
    int IMAGE_X = (width-this.imgWidth)/2;
    int IMAGE_Y = PADDING*3 + QUESTION_BOX_HEIGHT;
    image(img, IMAGE_X, IMAGE_Y, this.imgWidth, this.imgHeight);
  }
}

/*
  Star graph figure
*/
public class StarGraphFigure extends QuestionFigure {
  int numGraphs;
  String[][] graphs;
  
  public StarGraphFigure(String[][] graphs, int numGraphs) {
    this.graphs = graphs;
    this.numGraphs = numGraphs;
  }
  
  public void drawLine(float x0, float y0, float x1, float y1) {
    strokeWeight(2);
    line(x0, y0, x1, y1);
  }
  
  public void drawCircleWithText(String str, float x0, float y0, float r) {
    // move the origin to the center of the canvas
    translate(x0, y0);
  
    // Draw a a circle with radius r
    noFill();
    stroke(0);
    ellipse(0, 0, r*2, r*2);   
    textAlign(CENTER);
    textSize(30);
    fill(0);
    text(str, 0, 0);
    translate(-x0, -y0);
    textSize(20);
  }
  
  public void draw() {
    for (int i = 0 ; i < this.numGraphs ; i++) {
      String[] v = this.graphs[i];
      float x0 = 180 + i * 300;
      float y0 = 270;
      float radius = 30;
      
      translate(x0, y0);
      drawCircleWithText(v[0], 0, 0, radius);
      drawCircleWithText(v[1], 0, -3 * radius, radius);
      drawCircleWithText(v[2], sqrt(9*radius*radius/2), sqrt(9*radius*radius/2), radius);
      drawCircleWithText(v[3], -sqrt(9*radius*radius/2), sqrt(9*radius*radius/2), radius);
      
      drawLine(0, -radius, 0, -2*radius);
      drawLine(
        sqrt(radius*radius/2), 
        sqrt(radius*radius/2), 
        sqrt(radius*radius*2),
        sqrt(radius*radius*2)
      );
      drawLine(
        -sqrt(radius*radius/2), 
        sqrt(radius*radius/2), 
        -sqrt(radius*radius*2),
        sqrt(radius*radius*2)
      );
      translate(-x0, -y0);
    }
    
  }
}
