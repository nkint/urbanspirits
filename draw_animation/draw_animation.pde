int st = 0;
int w = 192;
int h = 157;
Ani urbanSoul;


void setup() {
  size(192, 157);
  imageMode(CENTER);
  
  urbanSoul = new Ani();
  
  frameRate(1);
  
}


void draw() {

  urbanSoul.display();
}

void keyPressed() {

  if (key == 's') {
    urbanSoul.changeState(-1);
  }
} 


