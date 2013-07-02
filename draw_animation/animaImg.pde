class Ani {
  Animation[][] ani;   // Firts Value is the type, second value is the state
  int nAni;
  int state;
  int type;
  int snext;
  int tnext;
  int maxS;
  boolean cType, cState;

  Ani() {
    maxS = 4;
    ani = new Animation[4][maxS];

    for (int j = 0; j < 4; j++) {
      for (int i = 0; i < maxS; i++) {
        ani[j][i] = new Animation("spritesprova.png", 4, i*w, j*h);
      }
    }

    state = 0;
    type  = 0;
    snext = 0;
    tnext = 0;
  }

  void update() {


    if (ani[type][state].frame == 0) {
      if (state != snext) {
        state = snext;
        type = 1;
      }
      if (tnext != type) {
        type = tnext;
        tnext = 0;
      }
    }
  }

  void display() {
    ani[type][(type == 4) ? state - 1: state].display();
    println("state: " + state + " type: " + type);
  }

  void changeState(int  st) {

    if (st > 0) {

      snext = min(maxS-1, (state+st));
    } 
    else {

      snext = max(0, (state+st));
    }
  }

  void changeType(int typ) {
    tnext = typ;
  }
}



class Animation {
  PImage[] imgs;
  int imageCount;
  int frame;
  int xpos, ypos;

  Animation(String filename, int count, int initX, int initY) {
    imageCount = count;
    imgs = new PImage[imageCount];
    xpos = w/2; 
    ypos = h/2;
    frame = 0;

    PImage IMG = loadImage(filename,"png");

    for (int i = 0; i < imageCount; i++) {
      imgs[i] = new PImage(w, h,ARGB); 
      imgs[i].copy(IMG, initX, i*h, w, h, 0, 0, w, h);
    }
  }

  void display() {
    frame = (frame+1) % imageCount;
    image(imgs[frame], xpos, ypos);
  }
}

