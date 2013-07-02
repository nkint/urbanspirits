int st = 0;
int w = 192;
int h = 125;
Ani urbanSoul;


void setup() {
  size(displayWidth, displayHeight);
  imageMode(CENTER);

  urbanSoul = new Ani();

  frameRate(5); // 5
}


void draw() {
  background(100);
  translate(40, 40);
  fill(250,0,0);
  rect(0, 0, w, h);
  urbanSoul.update();
  urbanSoul.display();
}

void keyPressed() {

  if (key == '+') {
    urbanSoul.changeState(1);
  }
  if (key == '-') {
    urbanSoul.changeState(-1);
  }
  if (key == 'e') { //Ecologica
    urbanSoul.changeType(1);
  }
  
  if (key == 's') { //Social
    urbanSoul.changeType(2);
  }
  
  if (key == 'c') { // Creative
    urbanSoul.changeType(3);
  }
  
} 

boolean sketchFullScreen() {
  return false;
}

