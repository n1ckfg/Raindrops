int sW = 960;
int sH = 540;
int fps = 24;

color bgColor = color(0);

int numColumns = sW;
int numRows = 20;
RowDrop[] rowDrop = new RowDrop[numRows];
ArrayList splash = new ArrayList();
float wind = 0;

PImage mapImg;
PImage scaleImg;
boolean showImg = false;

boolean dead = false;

void setup() {
  size(50, 50, P3D);
  surface.setSize(sW, sH);
  frameRate(fps);
  mapImg = loadImage("test.png");
  scaleImg = createImage(numColumns, numRows, RGB);
  scaleImg = mapImg.get(0, 0, numColumns, numRows);
  background(bgColor);
  initRows();
}

void draw() {
  wind = (mouseX - (sW/2))/10;
  background(bgColor);
  dead = true;
  for (int i=0;i<numRows;i++) {
    rowDrop[i].update();
    if (!rowDrop[i].dead) {
      dead=false;
    }
  }
  if (dead) {
    initRows();
  }

  for (int j=0 ; j<splash.size() ; j++) {
    Splash spl = (Splash) splash.get(j);
    spl.run();
    if (spl.position.y>sH) splash.remove(j);
  }

  if (showImg) image(scaleImg, 0, 0, sW, sH);
}

void initRows() {
  for (int i=0;i<numRows;i++) {
    rowDrop[i] = new RowDrop(i, numColumns);
  }
  pixelTrack();
}

void pixelTrack() {
  for (int y = 0; y<numRows; y++) {
    for (int x=0; x<numColumns; x++) {
      int loc = x + (y*(numColumns));

      float r = red(scaleImg.pixels[loc]);
      float g = green(scaleImg.pixels[loc]);
      float b = blue(scaleImg.pixels[loc]);
      int target = int((r+g+b)/3);
      rowDrop[y].drop[x].dropAlpha = random(target);
      rowDrop[y].drop[x].dropColor = color(100, 150, 200, rowDrop[y].drop[x].dropAlpha);
    }
  }
}
