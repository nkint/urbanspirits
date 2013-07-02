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
    maxS = 5;
    ani = new Animation[2][maxS];

    for (int i = 0; i < maxS; i++) {
      ani[0][i] = new Animation("animationtest02.png", 3, i*w, 0);
    }

    for (int i = 0; i < maxS; i++) {
      ani[1][i] = new Animation("animationtest02.png", 3, (i+2)*w, 0);
    }

    state = 2;
    type  = 0;
    snext = 0;
    tnext = 0;
  }

  void update() {

    
    if (ani[type][state].frame == 0) {
      state = snext;
      type = tnext;
    }
  }

  void display() {
    ani[type][state].display();
  }

  void changeState(int  st) {

    if (st > 0) {

      state = min(maxS,(state+st));
      
    } 
    else {

      state = max(0,(state+st));
    }

  }

  void changeType() {
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
    xpos = width/2; 
    ypos = height/2;

    PImage IMG = loadImage(filename);

    for (int i = 0; i < imageCount; i++) {
      imgs[i] = new PImage(w, h); 
      imgs[i].copy(IMG, initX, i*h, w, h, 0, 0, w, h);
    }
  }

  void display() {
    frame = (frame+1) % imageCount;
    image(imgs[frame], xpos, ypos);
  }
}

