
public class ImageArrayZoomer {
  
 private int motionSpeed;
 private int current;
 //private boolean isLandscape;
 private PImage image;
 private int numberOfImages;
 private String folder; 
 private String imagePrefix;
 private String imageSuffix;
  
  public ImageArrayZoomer(String folder, String imagePrefix, int numberOfImages, String imageSuffix, int motionSpeed) {
   this.folder = folder;
   this.imagePrefix = imagePrefix;
   this.imageSuffix = imageSuffix;
   this.numberOfImages = numberOfImages;
   this.motionSpeed = motionSpeed;
   init();
  }
  
  private void init() {
    current = 0;
    this.image = loadMyImage(String.valueOf(current)); 
  }
  
  public void draw() {

    //sleep(50);
    //delay(3000);
    if(width> image.width && height > image.height)
    {
      int newWidth = image.width + 1;
      int newHeight = image.height + 1;
      image.resize(newWidth, newHeight);
      imageMode(CENTER);
      image(image, width/2, height/2);
    } else {
      //tint(200);
      current = (current +1) % numberOfImages;
      //int previousImageWidth = image.width;
      //int previousImageHeight = image.height;
      //delay(3000);
      image = loadMyImage(String.valueOf(current));
      //noTint();
      //sleep(5000);
      image(image,0,0);
      sleep(5000);
      //delay(3000);
      //blend(image, 0, 0, previousImageWidth, previousImageHeight, 0, 0, image.width, image.height, DARKEST);
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
