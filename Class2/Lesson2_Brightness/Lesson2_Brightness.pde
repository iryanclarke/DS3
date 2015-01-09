import controlP5.*;

ControlP5 debugUI;     //object that will create and manage our UI for changing things on the fly
PImage img;
int brightness = 0;  //brightness of image
int contrast   = 0; 

void setup() {
  size(398, 600);      //size of image  
  img = loadImage( "Model_Before.jpg" );

  debugUI = new ControlP5(this);    //initializing UI
  
  debugUI.addSlider("brightness")   // brightness slider
    .setPosition( 10, height-30 )
    .setSize( 100, 20 )
    .setRange( -100, 100);
    
  debugUI.addSlider("contrast")     // contrast slider
    .setPosition( 10, height-60 )
    .setSize( 100, 20 )
    .setRange( -100, 100);  
}

void draw() {
  PImage imgCopy = img.get();
  
  imgCopy.loadPixels();
  
  int numPixels = imgCopy.pixels.length;
  
  for( int i = 0; i < numPixels; i++) {
    
      color prevCol = imgCopy.pixels[i];
      
      //brightness calculations
      float brightRatio = map( brightness, -100, 100, 0, 2 );
      float r = min( red( prevCol ) * brightRatio, 255.0f);
      float g = min( green( prevCol ) * brightRatio, 255.0f);
      float b = min( blue( prevCol ) * brightRatio, 255.0f);
      
      //contrast calculations
      float contrastRation = map( contrast, -100, 100, 0, 2 );
      
      //red value
      r /= 255.0f;       // Normalize value to between 0 and 1
      r -= 0.5;          // Subtract half of the normalized value so that negative vals get darker and positive values get brighter
      r *= contrastRatio;
      r += 0.5f;
      r *= 255.0f;
      
      
      
      color newCol = color(r, g, b); //brightness means changing all RGB channels simultaneusly
      imgCopy.pixels[i] = newCol;
  }
  
  imgCopy.updatePixels();
  
  image( imgCopy, 0, 0, width, height );
}
