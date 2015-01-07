PImage img;

void setup(){
  size(325, 260);
  img = loadImage( "pyra.jpg");
}

void draw(){
  
  background(255);
 
  img.loadPixels();
  
  for (int x = 0; x < img.height; x++) {
    
    for (int y = 0; y < img.width; y++) {
      
      int loc = y + x * img.width;

      // If Even
      if (x % 4 == 0) { 
        img.pixels[loc] = color(255);
      } else {         
        //pixels[loc] = color(0);
      }
      
    }
    
  }

  img.updatePixels();
  image( img, 0, 0, width, height);
}

