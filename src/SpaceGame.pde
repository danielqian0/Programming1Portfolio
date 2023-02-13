// Daniel Qian | 28 November 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster;
Ship s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[100];
int score, level, rockRate, rockCount, rocksPassed;
boolean play;

void setup() {
  size(800, 800);
  s1 = new Ship();
  rockRate = 1000;
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  blaster = new SoundFile(this,"converted_blaster.wav");
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  stars[0] = new Star();
  score = 0;
  level = 1;
  play = false;
  rocksPassed = 0;
  play = false;
}

void draw () {
  if (!play) {
    startScreen();
  } else {
    if(frameCount % 1000 == 10) {
      level++;
      rockRate-=10;
      infoPanel();
    }
    background(0);
    infoPanel();
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();
    

    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps:" + powerups.size());
    }
    
    //Rendering PowerUps and Detecting Ship Collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if(pu.type == 'H') {
          s1.health +=50;
        } else {
          s1.ammo+=50;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    //Rendering Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=10;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocksPassed++;
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }
    //Render lasers on the screen and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score+=100;
          // add sound to collision
          // add animation to the collision
          lasers.remove(l);
          rocks.remove(r);
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    
    // Game over logic
    if(s1.health<1 || rocksPassed > 3) {
      gameOver();
    }
  }
}
void mousePressed() {
  blaster.stop();
  lasers.add(new Laser(s1.x, s1.y));
  blaster.play();
  s1.fire();
}

void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(18);
  text("Health:" + s1.health 
  + "| Rocks Passed:" + rocksPassed + 
  " | Score:" + score + 
  "  | Ammo:" + s1.ammo + 
  " | Level:" + level,300,40);
}

void startScreen () {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}
void gameOver() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  play = false;
  noLoop();
}
