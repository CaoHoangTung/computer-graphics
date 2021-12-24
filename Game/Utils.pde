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
  void drawSequence(int numBlocks, int blockWidth, int blockHeight, int x, int y, int blockDist, int txtSize, char[] arr) {
    float padX = (blockWidth - txtSize) / 2;
    float padY = (blockHeight - txtSize) / 2;
    
    for (int i = 0; i < numBlocks; ++i) {
      fill(255, 255, 255);
      rect(x, y, blockWidth, blockHeight);     
    
      fill(0, 0, 0);
      textSize(txtSize);

      textAlign(CENTER);
      text(String.valueOf(arr[i]), x, y + txtSize, blockWidth, blockHeight);
    
      x += blockWidth + 1 + blockDist;
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
  * @param table          list of charaters   
  */
  void drawTable(int numRows, int numCols, int blockWidth, int blockHeight, int x, int y, int distX, int distY, int txtSize, char[][] table) {
    for (int i = 0; i < numRows; ++i) {
      drawSequence(numCols, blockHeight, blockWidth, x, y, distX, txtSize, table[i]);
      y += blockHeight + 1 + distY;
    }
  }
}

void draw() {
}

