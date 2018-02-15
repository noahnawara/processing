int cubeWidth = 20;
int cubeHeight = 20;
int cubeDepth = 20;

int distance = 40;
float t = 0;

void setup() {
  size(500, 500, P3D);
  background(0);
  stroke(255);
  strokeWeight(1);

  colorMode(HSB, 40, 100, 100);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  rotateX(radians(mouseY));
  rotateY(radians(mouseX));

  for (int x=-6; x<cubeWidth; x++) {
    for (int y=-6; y<cubeHeight; y++) {
      for (int z=-10; z<cubeDepth; z++) {
        stroke(x*2, 100, 100);
        point(x*distance, y*distance, z*distance);
      }
    }
  }
 
  t += 1;
}