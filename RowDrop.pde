class RowDrop {

  boolean dead = false;
  float countdown = 1;

  int numDrops;
  Drop[] drop;
  PVector p = new PVector(0, -50); //0, -50
  PVector s = new PVector(2,2);
  PVector v = new PVector(0, 0);
  PVector a = new PVector(0.01, 4);

  RowDrop(int _cd, int _nd) {
    numDrops = _nd;
    countdown *= _cd;
    drop = new Drop[numDrops];
    initDrops();
  }

  void update() {
    if (countdown>0) {
      countdown--;
    }
    else {
      dead = true;
      for (int i=0;i<numDrops;i++) {
        drop[i].run();
        if (!drop[i].dead) {
          dead=false;
        }
      }
    }
  }

  void initDrops() {
    float px = 0;
    float pxDelta = sW/numColumns;
    
    for (int i=0;i<numDrops;i++) {
      drop[i] = new Drop(px, p.y, s.x, s.y, v.x, v.y, a.x, a.y);
      px += pxDelta;
    }
  }
}

