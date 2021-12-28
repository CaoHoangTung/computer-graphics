public class StarGraph {
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
