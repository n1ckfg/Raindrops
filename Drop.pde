class Drop {

  boolean dead = false;

  float px, py, sx, sy, vx, vy, ax, ay;
  PVector p, s, v, a;
  float yLimit = sH + 100;
  float aSpread = 0.6;
  float sizeDelta = 4;
  color dropColor = color(0);
  float dropAlpha = 0;

  Drop(float _px, float _py, float _sx, float _sy, float _vx, float _vy, float _ax, float _ay) {

    px = _px;
    py = _py;
    sx = _sx;
    sy = _sy;
    vx = _vx;
    vy = _vy;
    ax = _ax;
    ay = _ay;
    init();
  }

  void init() {
    p = new PVector(px, py);
    s = new PVector(sx, sy);
    v = new PVector(vx, vy);
    a = new PVector(ax, ay + random(aSpread));
  }

  void update() {
    if (!dead) {
      s.y += sizeDelta;
      v.add(a);
      p.add(v);
      p.x += wind*(p.y/sH);
      if(p.y>sH && dropAlpha != 0){
          for (int k = 0 ; k<random(1,1) ; k++) {
            splash.add(new Splash(p.x, sH));
          }
      }
      if (p.y>yLimit) dead=true;
    }
  }

  void render() {
    pushMatrix();
    translate(p.x, p.y);
    rotate(radians((-1 * wind)*(p.y/sH)));
    noStroke();
    fill(dropColor);
    rectMode(CENTER);
    rect(0, 0, s.x, s.y);
    popMatrix();
  }

  void run() {
    update();
    render();
  }
}

