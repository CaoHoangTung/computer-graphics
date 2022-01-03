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
  * @param blockDist    distance between 2 consecutives block   
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
  * @param distX        distance between 2 consecutive blocks in a row  
  * @param distY        distance between 2 consecutive blocks in a col  
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

  /**
  * Draw a pyramid 
  *
  * @param numRows      number of rows 
  * @param blockWidth   witdh of a block 
  * @param blockHeight  height of a block 
  * @param distX        distance between 2 consecutive blocks in a row  
  * @param distY        distance between 2 consecutive blocks in a column  
  * @param x            x-coordinate of first block 
  * @param y            y-coordinate of first block 
  * @param txtSize      size of each character 
  * @param arr          list of characters  
  */
  void drawPyramid(float numRows, float blockWidth, float blockHeight, int distX, int distY, float x, float y, float txtSize, String[][] arr) {
    // drawSequence(int numBlocks, int blockHeight, int blockWidth, int x, int y, int blockDist, int txtSize, char[] arr) 
    for (int i = 0; i < numRows; ++i) {
      drawSequence(i+1, blockWidth, blockHeight, x, y, distX, txtSize, arr[i]);
      x -= blockWidth / 2;
      y += blockHeight + distY;
    }
  }

  /**
  * Draw a circle with blocks inside 
  * Example run: 
  * --> size(600, 600);
  * --> drawCircleNumber(600/2, 600/2, 200, 3, 30, 50, new String[] {"1", "2", "3"});
  *
  * @param xo         x-coordinate of circle's center   
  * @param yo         y-coordinate of circle's center 
  * @param ratio      ratio of circle 
  * @param numBlocks  numBlocks 
  * @param txtSize    size of each character  
  * @param txtDist    distance between text and circle's center 
  * @param arr        list of characters 
  */
  boolean drawCircleNumber(float xo, float yo, float ratio, int numBlocks, int txtSize, int txtDist, String[] arr) {    
    if (360 % numBlocks != 0) {
      return false;
    }
    
    fill(255, 255, 255);
    circle(xo, yo, ratio);
    
    PVector center = new PVector(xo, yo);
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
      
      textSize(txtSize);

      textAlign(CENTER);
      text(String.valueOf(arr[cnt]), txtX, txtY);
    }
    
    return true;
  }
}
