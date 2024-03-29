class Laser{
  int x,y,w,h,speed;
  color c1;
  
  
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 20;
    speed = 5;
    c1 = color(255,0,0);
  }
  
  void display() {
    fill(c1);
    rectMode(CENTER);
    noStroke();
    rect(x,y,w,h);
  }
  void move() {
    y -= speed;
  }
  
  boolean reachedTop() {
    if(y<-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if(d<40) {
      return true;
    } else {
      return false;
    }
  }
}
