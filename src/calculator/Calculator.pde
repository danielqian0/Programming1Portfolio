// Daniel Qian | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup() {
  size(440, 460);
  numButtons[0] = new Button(200, 380, 40, 40, '0');
  numButtons[1] = new Button(140, 200, 40, 40, '1');
  numButtons[2] = new Button(200, 200, 40, 40, '2');
  numButtons[3] = new Button(260, 200, 40, 40, '3');
  numButtons[4] = new Button(140, 260, 40, 40, '4');
  numButtons[5] = new Button(200, 260, 40, 40, '5');
  numButtons[6] = new Button(260, 260, 40, 40, '6');
  numButtons[7] = new Button(140, 320, 40, 40, '7');
  numButtons[8] = new Button(200, 320, 40, 40, '8');
  numButtons[9] = new Button(260, 320, 40, 40, '9');
  opButtons[0] = new Button(400, 380, 40, 40, '=');
  opButtons[1] = new Button(400, 200, 40, 40, 'c');
  opButtons[2] = new Button(340, 200, 40, 40, '+');
  opButtons[3] = new Button(340, 260, 40, 40, '-');
  opButtons[4] = new Button(340, 320, 40, 40, '*');
  opButtons[5] = new Button(340, 380, 40, 40, '/');
  opButtons[6] = new Button(140, 380, 40, 40, '±');
  opButtons[7] = new Button(260, 380, 40, 40, '.');
  opButtons[8] = new Button(80, 200, 40, 40, '^');
  opButtons[9] = new Button(80, 260, 40, 40, '√');
  opButtons[10] = new Button(80, 320, 40, 40, 'π');
  opButtons[11] = new Button(80, 380, 40, 40, 'e');
}

void draw() {
  background(#DDA0DD);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 107 || keyCode == 61) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 67) {
    handleEvent("c", false);
  } else if (keyCode == 13) {
    handleEvent ("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num) {
    if (dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) {
    dVal = "0";
    op = ' ';
    l = 0;
    r = 0;
    result = 0;
    left = true;
  } else if (val.equals(".")) {
    if (dVal.contains(".") == false) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0";
    left = false;
  } else if (val.equals("*")) {
    op = '*';
    dVal = "0";
    left = false;
  } else if (val.equals("/")) {
    op = '/';
    dVal = "0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 18) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      handleEvent("c", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      left = false;
      dVal = "0";
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '/') {
      op = '/';
      dVal = "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '^') {
      op = '^';
      dVal = "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'e') {
      if (left) {
        l = 2.718281;
        dVal = str(l);
      } else {
        r = 2.718281;
        dVal = str(r);
      }
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " left:" + left + " result:" + result);
}

void updateDisplay() {
  fill(255);
  rectMode(CENTER);
  rect(220, 85, 380, 140);
  fill(0);
  textSize(22);
  textAlign(RIGHT);
  if (dVal.length()<32) {
    textSize(22);
  } else if (dVal.length()<34) {
    textSize(20);
  } else if (dVal.length()<36) {
    textSize(18);
  } else if (dVal.length()<38) {
    textSize(16);
  } else if (dVal.length()<40) {
    textSize(14);
  } else if (dVal.length()<42) {
    textSize(12);
  } else {
    textSize(2);
  }
  text(dVal, width-70, 80);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == '^') {
    result = pow(l, r);
  } else if (op =='√') {
    sqrt(l);
  }
  dVal = str(result);
  l = result;
  left = true;
}
