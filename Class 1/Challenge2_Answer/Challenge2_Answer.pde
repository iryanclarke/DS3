PImage img;

void setup() {
  size(400, 400);
  frameRate( 30 );
  
  img = loadImage( "MoonLanding.jpg" );

}

void draw() {
  background( 255 );
  
  int spacing     = (int)map( mouseX, 0, width, 1.0f, 30.0f );  // spacing between circles, 'f' defines it as a float
  int numCircles  = (int)( (float)img.width/(float)spacing );   // the number f circles across one axis (window is square so we ignore doing for other axis)
  
  // Scale circles so they fit nicely across the screen
  float scaleCorrect = (float)width/((float)spacing * (float)numCircles);
  
  for( int x = 0; x < numCircles; x++){
     for( int y = 0; y < numCircles; y++){
       
       int loc = x * spacing + (y*spacing * img.width);                // get the color behind the circles at correct spacing
       
       float r = red( img.pixels[loc] );
       float g = green( img.pixels[loc] );
       float b = blue( img.pixels[loc] );  
       
       noStroke();
       fill(r, g, b );
       
       ellipse( x * spacing * scaleCorrect + spacing/2, y * spacing * scaleCorrect + spacing/2, spacing * scaleCorrect, spacing * scaleCorrect);
       
     }
  }
  
}
