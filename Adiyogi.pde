int frames = 20;
PGraphics pg[] = new PGraphics[frames];
PImage img;
MovingLines movln;
Fog fog1;

void setup() {
  size(640, 382);
  smooth(2);
  movln = new MovingLines();
  
  img = loadImage("/Users/ramya/Documents/Processing/Adiyogi/Data/Adi10.jpeg");
  fog1 = new Fog(img);
}

void draw() {
  
 //background(120,239,118);
 background(0);
 surface.setTitle(mouseX + ", " + mouseY);
 //tint(255, 150);
 image(img, 166, 90);
 if(key == 'o' || key == 'O')
 {
   movln.show();
 }
 if (key == 'f' || key == 'F') 
 {
      fog1.show();
 }
 if ()
 {
 }
}
