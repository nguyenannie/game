ArrayList<PVector> walls = new ArrayList<PVector>();

int cs = 20;
PVector pos;

void setup(){
  size (400,400);
  for (int i = 0; i < 100; i++) {
    int rx = int(random(20));
    int ry = int(random(20));
    walls.add(new PVector(rx,ry));
  }
  pos = new PVector(0,0);
}

void draw(){
  background(255);
  for (int i = 0; i < width; i++) {
    line (i*cs, 0, i*cs, height);
  }
  for (int i = 0; i < height; i++) {
    line (0, i*cs, width, i*cs);
  }
  for(int i = 0; i < walls.size(); i++) {
    fill(0,255,0);
    rect(walls.get(i).x*cs,walls.get(i).y*cs, cs,cs);
  }

  fill(255,0,0);
  rect(cs*pos.x,cs*pos.y,cs,cs);
}

void keyPressed(){
  PVector nextPos = pos.copy();
  if (key == CODED) {
    if (keyCode == UP) {
        nextPos.y = nextPos.y - 1;
    } else if (keyCode == DOWN) {
        nextPos.y = nextPos.y + 1;
    } else if (keyCode == LEFT) {
        nextPos.x = nextPos.x - 1;
    } else if (keyCode == RIGHT) {
        nextPos.x = nextPos.x + 1;
    }
  } 
  boolean notWall = !walls.contains(nextPos);
  boolean inBounds = true;
  if (nextPos.x < 0 || nextPos.x > cs - 1 || nextPos.y < 0 || nextPos.y > cs - 1){
    inBounds = false;
  }
  if (notWall && inBounds){
    pos = nextPos;
  }
}