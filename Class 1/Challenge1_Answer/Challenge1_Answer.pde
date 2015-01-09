PImage img;

void setup() {
  size(400, 400);
  frameRate( 30 );
  
  img = loadImage( "MoonLanding_Large.jpg" );

}

void draw() {
  
  int numLines       = (int)map( mouseY, 0, height, 0, height/4 ); //mapping MouseY from the range of 0-height => 0-height/4
  float lineSpacing  = (float)height/(float)(numLines + 1);
  
  image( img, 0, 0, width, height );
  
  stroke( 0, 255, 0 );
  
  // METHOD #1
  
  //loop through all lines and draw them equidistant from each other according to linespacing calc
  for( int y = 0; y < numLines + 1; y++) {
      float yPos = lineSpacing * (float)y;
      
      line( 0, yPos, width, yPos );
  }
  
  
  // METHOD #2
  /* 
  PImage imgCopy = img.get();   //getting a copy of the pixel array in img
  
  img.loadPixels();  //load pixels so we can read them
  
  for ( int x = 0; x < img.width; x++ ) {
    for( int y = 0; y < img.height; y++) {
      
      if ( y % (int)lineSpacing == 0 ) {
        int loc = x + (y * img.width);
        imgCopy.pixels[loc] = color(0, 255, 0);
      }  
      
      
    }
  }
  
  img.updatePixels(); //Update pixels so they are shown
  
  image( imgCopy, 0, 0, width, height);
  */
}
