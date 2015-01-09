PImage img;
int brightness = 100;  //brightness of image

void setup() {
  size(398, 600);      //size of image  
  img = loadImage( "Model_Before.jpg" );

}

void draw() {
  PImage imgCopy = img.get();
  
  imgCopy.loadPixels();
  
  int numPixels = imgCopy.pixels.length;
  
  for( int i = 0; i < numPixels; i++) {
      color prevCol = imgCopy.pixels[i];
      float brightRation = (float)brightness/100.0f;
      
      color newCol = color( red(prevCol) * brightRatio, green(prevCol) * brightRatio, blue(prevCol) * brightRatio); //brightness means changing all RGB channels simultaneusly
      imgCopy.pixels[i] = newCol;
  }
  
  imgCopy.updatePixels();
  
  image( imgCopy, 0, 0, width, height );
}

