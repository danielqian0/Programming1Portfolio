class Ship {
  int x, y, w, ammo, health;

  Ship() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 100;
    health = 100;
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y= tempy;
    fill(0, 0, 255);
    rect(x+19, y-5, 5, 15);
    rect(x-19, y-5, 5, 15);
    fill(255);
    rect(x+15, y+15, 12, 7);
    rect(x-15, y+15, 12, 7);
    stroke(0, 0, 255);
    triangle(x, y-40, x+20, y+15, x-20, y+15);
    fill(230, 0, 50);
    triangle(x+12, y-3, x+35, y+15, x, y+15);
    triangle(x-12, y-3, x-35, y+15, x, y+15);
    fill(#89CFF0);
    rect(x, y-10, 9, 15);
  }

  boolean fire() {
    if(ammo>0) {
      ammo--;
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
