class Dot {
  PVector pos;
  PVector vel;
  DNA dna;
  int genecounter;
  int temp;
  PVector target;
  float fitness = 0.0;
  boolean isbest = false;
  
  Dot() {
    dna = new DNA();
    pos = new PVector(20, height/2);
    vel = new PVector(0, 0);
    temp = lifetime;
    target = new PVector(width-20, height/2);
  }

  void update() {
    if (genecounter == temp - 1) {
      genecounter = 0;
    }
    vel = dna.genes[genecounter];
    pos.add(vel);
    genecounter++;
  }

  void show() {
    noStroke();
    if(!isbest){
      fill(0);
      ellipse(pos.x, pos.y, 6, 6);
    }
    else{
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    }
    noStroke();
    fill(255, 50, 50);
    ellipse(target.x, target.y, 16, 16);
  }
  
  void calc_fitness(){
    fitness = dist(target.x, target.y, pos.x, pos.y);
  }
  
  Dot crossover(Dot partner){
    Dot child = new Dot();
    for(int i = 0; i < dna.genes.length; i++){
      float s = random(1);
      if(s < 0.45){
        child.dna.genes[i] = dna.genes[i];
      }
      else if(s < 0.99){
        child.dna.genes[i] = partner.dna.genes[i];
      }
      else{
        child.dna.genes[i] = PVector.random2D().mult(speed);
      }
    }
    return child;
  }
}  
