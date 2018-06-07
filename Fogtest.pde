public class Fogtest
{
  
  PGraphics buffer1;
  PGraphics buffer2;
  PImage cooling;
  PImage fimg;
  int w = 100;
  int h = 60;
  float ystart = 0.0;
  
  public Fogtest(PImage img)
  {
    fimg = img;
    buffer1 = createGraphics(w, h);
    buffer2 = createGraphics(w, h);
    cooling = createImage(w, h, RGB);
    
    fire(5);
    cool();
    //background(0);
    //image(img, width/2, height/2);
    buffer2.beginDraw();
    buffer1.loadPixels();
    buffer2.loadPixels();
  
    for(int x=0; x<w-1; x++){
      for(int y=1; y<h-1; y++){
        int index0 = x + (y)*w;
        int index1 = (x+1) + y*w;
        int index2 = (x-1) + y*w;
        int index3 = (x) + (y+1)*w;
        int index4 = (x) + (y-1)*w;
        color c1 = buffer1.pixels[index1];
        color c2 = buffer1.pixels[index2];
        color c3 = buffer1.pixels[index3];
        color c4 = buffer1.pixels[index4];
        color c5 = cooling.pixels[index0];
        
        float newC = brightness(c1) + brightness(c2) + brightness(c3)+ brightness(c4);
        newC = newC - brightness(c5);
        buffer2.pixels[index4] = color(newC*0.25);
      }
    }
    buffer2.updatePixels();
    //image(img, width/2, height/2);
    buffer2.endDraw();
    //Swap
    PGraphics temp = buffer1;
    buffer1 = buffer2;
    buffer2 = temp;
   // background(255);
    image(buffer1, 0, 360);
  }//end of constructor
  
  void fire(int rows){
    buffer1.beginDraw();
    buffer1.loadPixels();
    
    for(int x=0; x<w; x++){
      for(int j=0; j<rows; j++)
      {
        int y=h - (j+1);
        int index = x + y * w;
        buffer1.pixels[index] = color(255);
      }//end of innerfor
    }//end of outerfor
 
  
    buffer1.updatePixels();
    buffer2.updatePixels();
    buffer1.endDraw();
  }//end of fire function
  
  void cool(){
    cooling.loadPixels(); 
    float xoff = 0.0; 
    float increment = 0.01;
   
    //calculate noise for every x,y coordinate in 2D space
    for(int x=0;x<w;x++){
      xoff += increment;
      float yoff = ystart;
      for(int y=0; y<h; y++){
        yoff+=increment;
        
        //calculate noise and scale by 255
        float n = noise(xoff, yoff);
        //float bright = noise(xoff, yoff)*50;
        float bright = n*25;
        
        cooling.pixels[x+y*w] = color(bright);
      }//end of inner for
    }//end of outer for
    cooling.updatePixels();
    ystart+=increment;
  }//end of cool function
  
  void show(){
    if (mousePressed){
      buffer1.beginDraw();
      buffer1.fill(255);
      buffer1.ellipse(mouseX,mouseY,50,50);//
      //image(img, width/2,height/2);
      buffer1.endDraw();
    }//end of if
  }//end of show()
  
  
}//end of class Fogtest
