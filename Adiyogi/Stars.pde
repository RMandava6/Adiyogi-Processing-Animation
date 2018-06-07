public class Stars {
  
  float x;
  float y;
  float z;
  
  public Stars(){
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }//end of start
  
  void update(){
    z = z-speed;
    if(z<1)
    {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
    }//end of if
  }//end of update
  
  void show(){
    fill(255);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    float r = map(z, 0, width, 16, 0);
    ellipse(sx,sy, r, r);
  }//end of show()
  
}//end of class Stars
