class Star {
  PVector pos, vel, ac;
  int r;
  color c;
  int posN;

  Star(int n) {
    pos = new PVector(random(5, w-5), random(5, h-5));
    colorMode(HSB, 100, 100, 100);
    c = color(random(100), random(30, 50), random(90, 100));
    colorMode(RGB, 255, 255, 255);
    r = 2;
    vel = new PVector(random(-2, 2), random(-2, 2));
    ac = new PVector(0, 0, 0);
    posN = n;
  }

  void draw() {
    stroke(c, 100);
    fill(c, 100);
    ellipse((int) pos.x, (int) pos.y, r, r);
  }
  void update() {
    /*if(mouseX > width || mouseX < 0 || mouseY > height || mouseY < 0){
     ac.set(0,0,0);}
     else{
     float d = dist(pos.x, pos.y, mouseX, mouseY);
     float g = 0.1;
     ac.set(g*(-pos.x+mouseX)/d,g*(-pos.y+mouseY)/d,0); }*/
    vel.add(ac);
    vel.limit(2);

    pos.add(vel);

    if ((pos.x > w-r) || (pos.x < r)) {
      vel.x *= -1;
    }
    if ((pos.y > h-r) || (pos.y < r)) {
      vel.y *= -1;
    }
  }
}

class Stars {
  int nT;
  ArrayList<Star> stars; 
  Planets  planets;

  Stars(int N) {
    stars = new ArrayList<Star>();
    for (int i = 0; i < N; i++) {
      stars.add(new Star(i));
    }

    nT = stars.size();
    planets = new Planets();
  }

  void update() {
    for (Star s : stars) {
      //s.ace =
      PVector ace = new PVector(0, 0, 0); 
      for (int i = 0; i < planets.n; i++) {
        if (planets.active[i]) {
          float d = dist(s.pos.x, s.pos.y, planets.pos[i].x, planets.pos[i].y);
          float g = 0.1;
          ace.add(g*(-s.pos.x+planets.pos[i].x)/d, g*(-s.pos.y+planets.pos[i].y)/d, 0);
        }
      }
      s.ac = ace.get(); 
      s.update();
      s.draw();
    }
  }
}


class Planets {

  PVector[] pos;
  boolean[] active;
  int        n;

  Planets() {
    n = 3;
    pos = new PVector[n];
    active = new boolean[n];
    for (int i = 0; i < 3; i++) {
      active[i] = false;
    } 
    pos[0] = new PVector(30, 15);
    pos[1] = new PVector(150, 30);
    pos[2] = new PVector(100, 90);
  }
}

