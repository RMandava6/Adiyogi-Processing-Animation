int frames = 20;
float speed;
PGraphics pg[] = new PGraphics[frames];
PImage img;
MovingLines movln;
Fog fog1;
Stars[] stars = new Stars[400];

private ImageArrayZoomer zoomer;
private ImageArrayZoomer zoomer1;
private ImageArrayZoomer zoomer2;

void setup() {
  size(640, 382);
  smooth(2);
  
  //Loading and initializing image objects
  img = loadImage("/Users/ramya/Documents/GitHub/Adiyogi-Processing-Animation/Adiyogi/Data/Adiyogi.jpg");
  zoomer = new ImageArrayZoomer("Data", "Adi", 12, 0, ".jpg", 1); 
  zoomer1 = new ImageArrayZoomer("Data", "Adi", 10, 12, ".jpg", 1);
  zoomer2 = new ImageArrayZoomer("Data", "Adi", 10, 12, ".jpg", 10);
  
  //Initializing all other objects
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Stars();
  }//end of for stars initialization
  movln = new MovingLines();
  fog1 = new Fog(img);  
}

void draw() {
 background(0);
 surface.setTitle(mouseX + ", " + mouseY);
 //image(img, 166, 90);
 
 if(key == 's' || key == 'S')
 {
   speed = map(mouseX, 0 , width, 0, 20);
   pushMatrix();
   translate(width/2, height/2);
   for(int i=0; i<stars.length;i++){
     stars[i].update();
     stars[i].show();
   }//end of for loop
   popMatrix();
 }//end of if statement for stars
 
 if (key == 'f' || key == 'F') 
 {
   imageMode(CORNER);
   image(img, 166, 90);
   fog1.show();
 }//end of if fog
 
 if (key == 'c' || key == 'C') 
 {
   background(0);
 }//end of if fog
 
 if (key == 'd' || key == 'D') 
 {
   background(0);
   zoomer.draw();
 }//end of if images draw
 
 if (key == 'g' || key == 'G') 
 {
   background(0);
   zoomer1.draw();
 }//end of if images draw
 
 
 if (key == 'e' || key == 'E') 
 {
   background(0);
   zoomer2.draw();
 }//end of if images draw
 
 
 if(key == 'o' || key == 'O')
 {
   movln.show();
 }//end of if Om - Moving lines
 
}// end of draw
