import controlP5.*;

ControlP5 debugUI;     //object that will create and manage our UI for changing things on the fly

PImage imgBefore;
PImage imgAfter;
PImage imgDiff;

int alphaBefore = 0;
int alphaAfter = 0;
int alphaDiff = 0;

int tolerance = 0;
boolean threshold = true;

static final int IMAGE_WIDTH = 398;
static final int IMAGE_HEIGHT = 600;

void setup() {
  size(398, 600);      //size of image  
  
  //load Images for comparison
  imgBefore = loadImage( "BG.jpg" );
  imgAfter = loadImage( "Book.jpg" );
  
  //create an empty image in memory
  imgDiff = createImage( IMAGE_WIDTH, IMAGE_HEIGHT, RGB );
  
  debugUI = new ControlP5(this);    //initializing UI
  
  debugUI.addSlider("alphaBefore")   // before slider
    .setPosition( 10, height-70 )
    .setSize( 100, 20 )
    .setRange( 0, 100);
    
  debugUI.addSlider("alphaAfter")     // after slider
    .setPosition( 10, height-100 )
    .setSize( 100, 20 )
    .setRange( 0, 100);  
  
  debugUI.addSlider("alphaDiff")     // after slider
    .setPosition( 10, height-120 )
    .setSize( 100, 20 )
    .setRange( 0, 100);  

}

void draw() {
  
  background(255);
  
  //load all images we want to read pixels from
  imgBefore.loadPixels();
  imgAfter.loadPixels();
  imgDiff.loadPixels();
  
  int numPixels = IMAGE_WIDTH * IMAGE_HEIGHT;
  for (int i = 0; i < numPixels; i++){
    
    // pre-determine pixel colors so we don't have to access array more than needed
    color beforeCol = imgBefore.pixels[i];
    color afterCol = imgAfter.pixels[i];
    
    // luminosity equation is grayScale = 0.21 * r + 0.72 * g + 0.07 * b;
    float grayBefore  = 0.21 * red(beforeCol) + 0.72 * green(beforeCol) + 0.07 * blue(beforeCol);
    float grayAfter   = 0.21 * red(afterCol) + 0.72 * green(afterCol) + 0.07 * blue(afterCol);
    
    float grayDiff = grayAfter - grayBefore;
    grayDiff = abs ( grayDiff );       //make absolute so we dont lose information
   
   imgDiff.pixels[i] = color( (int)grayDiff, (int)grayDiff, (int)grayDiff ); 
   
   if(threshold){
     if(grayDiff < tolerance){
        imgDiff.pixels[i] = color(0, 0, 0); 
     }
   }
    
  }
 
  imgDiff.updatePixels();
  
  
  //now draw images
  tint( 255, 255, 255, alphaBefore * 2.55f);      // Ting is Processing's way of changing the color and alpha of a drawn image afterwards
  image( imgBefore, 0, 0, width, height );
  
  tint( 255, 255, 255, alphaAfter * 2.55f );
  image( imgAfter, 0, 0, width, height );
  
  tint( 255, 255, 255, alphaDiff * 2.55f);
  image( imgDiff, 0, 0, width, height ); 
}
