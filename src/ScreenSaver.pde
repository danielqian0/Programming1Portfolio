// Daniel Qian | 10 Oct 2022 | ScreenSaver
float xpos, ypos, strokeW, pointCount;
void setup () {
  size(displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
}

void draw () {
  strokeW = random(1,20);
  pointCount = random(1,20);
  stroke(random(255),random(10),random(255));
  strokeWeight(strokeW);
  if(xpos>width || xpos<0 || ypos>height || ypos<0 ){
    xpos = random(width);
    ypos = random(height);
  } 
  if(random(100)>85) {
    moveLeft(xpos,ypos,pointCount);
  } else if(random(100)>85) {
    moveDown(xpos,ypos,pointCount);
  } else if(random(100)>75) {
    moveUp(xpos,ypos,pointCount);
  } else if(random(100)>75){
    moveRight(xpos,ypos,pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
} 
void moveUp(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}
