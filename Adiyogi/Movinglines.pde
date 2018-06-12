public class MovingLines
{
  int frames = 20;
  PGraphics pg[] = new PGraphics[frames];
  
  public MovingLines()
  {
    for(int i=0; i<frames; i++) {
      pg[i] = createGraphics(width, height);
      pg[i].beginDraw();
      pg[i].background(0);
      pg[i].stroke(255);
      pg[i].strokeWeight(3);
      pg[i].endDraw();
    }// end of for
  }//end of constructor
  
  void show(){
    int currFrame = frameCount % frames; // 0 .. 19
    if(mousePressed) {
      pg[currFrame].beginDraw();
      pg[currFrame].line(mouseX, mouseY, pmouseX, pmouseY);
      pg[currFrame].endDraw();
    }//end of if
    imageMode(CENTER);
    image(pg[currFrame], 0, 0);
  }//end of function show
}
