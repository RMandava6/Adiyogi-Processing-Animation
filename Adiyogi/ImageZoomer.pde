
public class ImageArrayZoomer {
  
 private int motionSpeed;
 private int current;
 //private boolean isLandscape;
 private PImage image;
 private int numberOfImages;
 private int startValue;
 private String folder; 
 private String imagePrefix;
 private String imageSuffix;
 private int counter=0;
  
  public ImageArrayZoomer(String folder, String imagePrefix, int numberOfImages, int startValue, String imageSuffix, int motionSpeed) {
   this.folder = folder;
   this.imagePrefix = imagePrefix;
   this.imageSuffix = imageSuffix;
   this.numberOfImages = numberOfImages;
   this.startValue = startValue;
   this.motionSpeed = motionSpeed;
   init();
  }
  
  private void init() {
    current = this.startValue;
    this.image = loadMyImage(String.valueOf(current)); 
  }
  
  public void draw() {

    //sleep(50);
    if(counter == 1)
    {
      if(motionSpeed<10){
      delay(4000);
      }
      counter =0;
    }
    if(width> image.width || height > image.height)
    {
      int newWidth = image.width + 1;
      int newHeight = image.height + 1;
      image.resize(newWidth, newHeight);
      imageMode(CENTER);
      //tint(255, 100);
      image(image, width/2, height/2);
      
    } else {
      //tint(200);
      counter = 0;
      if(this.startValue ==0){
        current = (current +1) % numberOfImages;
      }
      else{
        current = ((current +1) % numberOfImages) + numberOfImages;
      }
      image = loadMyImage(String.valueOf(current));
      imageMode(CENTER);
      image(image,width/2, height/2);
      //sleep(5000);
      counter++;
    }
    
  }
  
  private PImage loadMyImage(String imageNumber) {
    PImage theLoadedImage = loadImage(folder+ File.separatorChar + this.imagePrefix + imageNumber + imageSuffix);
    //isLandscape = theLoadedImage.width>theLoadedImage.height;
    //System.out.println("isLandscape:" + isLandscape);
    if(theLoadedImage.width > width/2 || theLoadedImage.height> height/2) {
      theLoadedImage.resize(width/2, height/2);
    }
    return theLoadedImage;
    
  }
  

  private void sleep(int millisecond) {
     try {
      Thread.sleep(millisecond/motionSpeed);
    } catch(InterruptedException e) {}

  }
  
}
