color backgroundCol;
int colorCounter;
boolean changeCol = false;

void setup(){
  size( 400, 400);
  // Smooths color mixing
  colorMode( HSB, 255);
  backgroundCol= color( 0, 255, 255);
  colorCounter = (int)hue( backgroundCol );
}

void draw(){
  
  if(changeCol){
     colorCounter++;
  } 
 
 if( colorCounter > 255 ){
   colorCounter = 255;
 } 
 
  backgroundCol = color( colorCounter, 255, 255);
  
  background( backgroundCol );
  noStroke();
  fill(142, 23, 0);
  ellipse( mouseX, mouseY, 50,50);
}

void mouseReleased(){
  changeCol = true;
}

