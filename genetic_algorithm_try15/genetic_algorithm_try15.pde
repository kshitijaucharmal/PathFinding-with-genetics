int lifetime = 600;
int tem;
Dot[] population;
float speed = 15;
int steps = 0;

void setup() {
  size(1200, 600);
  tem = lifetime;
  population = new Dot[100];
  for (int i = 0; i < population.length; i++) {
    population[i] = new Dot();
  }
}

void draw() {
  background(255);
  for (int i = 1; i < population.length; i++) {
    population[i].update();
    population[i].show();
  }
  population[0].update();
  population[0].show();
  for (int i = 0; i < population.length; i++) {
    population[i].calc_fitness();
    if(population[i].fitness < 10){
      println("Best Fitness : " + population[i].fitness);
      println("Total Steps :  " + steps);
      exit();
    }
  }
  
  if(lifetime == 0){
    lifetime = tem;
    for(int i = 0; i < population.length; i++){
      for(int j = 0; j < population.length - 1; j++){
        if(population[j].fitness > population[j+1].fitness){
          Dot temp = population[j];
          population[j] = population[j+1];
          population[j+1] = temp;
        }
      }
    }
    println("Best Fitness : " + population[0].fitness);
    steps ++;
    for(int i = 0; i < population.length; i++){
      Dot parent1 = population[int(random(population.length/18))];
      Dot parent2 = population[int(random(population.length/18))];
      Dot child = parent1.crossover(parent2);
      population[i] = child;
    }
    population[0].isbest = true;
  }
  else{
    lifetime -- ;
  }    
}
