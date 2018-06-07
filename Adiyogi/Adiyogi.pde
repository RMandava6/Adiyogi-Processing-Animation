int frames = 20;
PGraphics pg[] = new PGraphics[frames];
PImage img;
MovingLines movln;
Fog fog1;

private ImageArrayZoomer zoomer;
void setup() {
  size(640, 382); //640, 382
  smooth(2);
  //movln = new MovingLines();
  
  //img = loadImage("Data/Adi10.jpeg");
  zoomer = new ImageArrayZoomer("Data", "Adi", 12, ".jpg", 5);
  //fog1 = new Fog(img);
}

void draw() {
  
    
 //background(120,239,118);
 background(0);
 surface.setTitle(mouseX + ", " + mouseY);
 //tint(255, 150);
 //image(img, 166, 90);
 //if(key == 'o' || key == 'O')
 //{
 //  movln.show();
 //}
 //if (key == 'f' || key == 'F') 
 //{
 //     fog1.show();
 //}
 
 zoomer.draw();
}
