class Rock{
  int x,y,speed,diam;
  PImage rock;
  
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2,8));
    diam = 50;
    rock = loadImage("rock.png");
  }
  
  void display() {
    imageMode(CENTER);
    image(rock,x,y);
  }
  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if(y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
