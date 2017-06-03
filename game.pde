ArrayList<PVector> walls = new ArrayList<PVector>();
ArrayList<PVector> apples =  new ArrayList<PVector>();

int cs = 20;
PVector pos;

void setup(){
  size (400,400);
  ellipseMode(CORNER);
  for (int i = 0; i < 100; i++) {
    walls.add(new PVector(int(random(cs)),int(random(cs))));
  }
  for (int i = 0; i < 15;) {
    PVector apple = new PVector(int(random(cs)),int(random(cs)));
    if(!walls.contains(apple)){
      apples.add(apple);
      i++;
    }
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
    fill(100);
    rect(walls.get(i).x*cs,walls.get(i).y*cs, cs,cs);
  }
  
  for(int i = 0; i < apples.size(); i++) {
    fill(255,0,0);
    ellipse(apples.get(i).x*cs,apples.get(i).y*cs, cs,cs);
  }

  fill(0,200,0);
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