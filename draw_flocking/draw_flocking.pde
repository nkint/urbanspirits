int numPuntos = 0;
//int[][] touch = new int[15][2]; 

Stars estrellas; 
Star  est;
ArrayList<PVector> planetas;
int w = 197, h = 157;

void setup(){
  size(displayWidth,displayHeight);
  
  background(0); 
  frameRate(25);
  strokeWeight(1);
  estrellas = new Stars(50); // numeros de estrellas
  planetas = new ArrayList<PVector>();
}

void draw(){
  //background(0,20);
  translate(40,40);
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  //println(planetas);
  estrellas.update();
}



void keyPressed() {

  if (key == 'e') { //Ecologica
   estrellas.planets.active[0] = !estrellas.planets.active[0];
  }
  
  if (key == 's') { //Social
    estrellas.planets.active[1] = !estrellas.planets.active[1];
  }
  
  if (key == 'c') { // Creative
    estrellas.planets.active[2] = !estrellas.planets.active[2];
  }
  
} 




