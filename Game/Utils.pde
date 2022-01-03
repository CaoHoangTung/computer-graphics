PImage loadImageRelative(String path) {
  return loadImage(sketchPath(path));
}

public class DrawUtil {
  /** 
  * Draw a sequence 
  * Example: [1, 2, 3, 4]
  * Note: blockWidth = blockHeight
  *
  * @param numBlocks    num blocks in the sequence 
  * @param blockHeight  height of a block 
  * @param blockWidth   width of a block  
  * @param x            x-coordinate of first block 
  * @param y            y-coordinate of first block 
  * @param blockDist    distance between 2 consecutive block   
  * @param txtSize      size of each character  
  * @param arr          list of charaters   
  */
  
  void drawSequence(int numBlocks, float blockWidth, float blockHeight, float x, float y, float blockDist, float txtSize, String[] arr) {
    float padX = (blockWidth - txtSize) / 2;
    float padY = (blockHeight - txtSize) / 2;
  
    
    for (int i = 0; i < numBlocks; ++i) {
      fill(255, 255, 255);
      rect(x, y, blockWidth, blockHeight);     
    
      fill(0, 0, 0);
      textSize(txtSize);

      textAlign(CENTER);
      text(String.valueOf(arr[i]), x, y + txtSize, blockWidth, blockHeight);
    
      x += blockWidth + blockDist;
    }
  }
  
  /** 
  * Draw a table 
  * Example: [1, 2, 3], [5, 6, 7]
  * Note: blockWidth = blockHeight
  *
  * @param numRows      num blocks of each row
  * @param numCols      num blocks of each col
  * @param blockHeight  height of a block 
  * @param blockWidth   width of a block  
  * @param x            x-coordinate of first block 
  * @param y            y-coordinate of first block 
  * @param distX        distance between 2 consecutive block in a row  
  * @param distY        distance between 2 consecutive block in a col  
  * @param txtSize      size of each character  
  * @param arr          list of charaters   
  */
  void drawTable(int numRows, int numCols, float blockWidth, float blockHeight, float x, float y, float distX, float distY, float txtSize, String[][] arr) {
    /*
      
    */
    for (int i = 0; i < numRows; ++i) {
      drawSequence(numCols, blockWidth, blockHeight, x, y, distX, txtSize, arr[i]);
      y += blockHeight + distY;
    }
  }

  void drawPyramid(float numRows, float blockWidth, float blockHeight, int distX, int distY, float x, float y, float txtSize, String[][] arr) {
    // drawSequence(int numBlocks, int blockHeight, int blockWidth, int x, int y, int blockDist, int txtSize, char[] arr) 
    for (int i = 0; i < numRows; ++i) {
      drawSequence(i+1, blockWidth, blockHeight, x, y, distX, txtSize, arr[i]);
      x -= blockWidth / 2;
      y += blockHeight + distY;
    }
  }
  
  void drawLine(float x0, float y0, float x1, float y1) {
    strokeWeight(2);
    line(x0, y0, x1, y1);
  }
  
  void drawStarGraph(String[] v, float x0, float y0, float radius) {
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
  
  void drawCircleWithText(String str, float x0, float y0, float r) {
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
}

public class Hehe {
}
