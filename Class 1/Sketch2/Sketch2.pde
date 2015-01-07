PImage img;

static final int MODE_NORMAL  = 0;
static final int MODE_RED     = 1;
static final int MODE_GREEN   = 2;
static final int MODE_BLUE    = 3;
static final int NUM_MODES    = 4;

int imgMode = 0;

void setup(){
  size(400, 400);
  img = loadImage( "pyra.jpg");
}

void draw(){
  PImage imgCopy = img.get();
  
  background(255);
  
  imgCopy.loadPixels();
  
  if( imgMode != MODE_NORMAL ){
    
    for ( int i = 0; i < imgCopy.pixels.length; i++ ) {
      switch ( imgMode) {
         case MODE_RED: { 
           imgCopy.pixels[i] = color( red( img.pixels[i] ), 0, 0 );
         } 
         break;
         case MODE_GREEN: { 
           imgCopy.pixels[i] = color( 0 , green( img.pixels[i] ), 0 );
         } 
         break;
         case MODE_BLUE: { 
           imgCopy.pixels[i] = color( 0, 0, blue( img.pixels[i] ) );
         } 
         break;
      }
    }
    
    imgCopy.updatePixels();
  }
  
  image( imgCopy, 0, 0, width, height);  
}

void mouseReleased(){
  imgMode++;
  
  if( imgMode > NUM_MODES ) {
     imgMode = MODE_RED; 
  }
}
