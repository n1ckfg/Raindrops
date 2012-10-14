class Splash {
    PVector position,speed;
    float innerWind = 0;
    
    Splash(float x,float y) {
        float angle = random(PI,TWO_PI);
        float distance = random(1,5);
        float xx = cos(angle)*distance;
        float yy = sin(angle)*distance;
        position = new PVector(x,y);
        speed = new PVector(xx,yy);
        innerWind = wind/10;
      }

    void draw() {
        noStroke();
        fill(150, 200, 250,random(10,50));
        ellipse(position.x,position.y,2,2);
    }

    void update() {
        gravity();
          
        speed.x*=random(0.7,1.4);
        speed.y*=random(0.7,1.3);
                
        position.add(speed);
        position.x += innerWind;
    }
    
    void run(){
      update();
      draw();
    }

    void gravity() {
        speed.y+=.25;
    }

}
