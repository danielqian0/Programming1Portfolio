class PowerUp{
  int x,y,speed,diam;
  char type;
  
  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2,8));
    diam = 50;
    if(int(random(2))==0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }
  
  void display() {
    fill(0,0,255);
    ellipse(x,y,diam,diam);
    textSize(24);
    fill(255);
    text(type,x,y);
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
  boolean intersect(Ship ship) {
    float d = dist(x,y,ship.x,ship.y);
    if(d<40) {
      return true;
    } else {
      return false;
    }
  }
}
