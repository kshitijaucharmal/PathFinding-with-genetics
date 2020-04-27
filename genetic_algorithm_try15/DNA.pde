class DNA {
  PVector[] genes;

  DNA() {
    genes = new PVector[lifetime];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D().mult(speed);
    }
  }
}
