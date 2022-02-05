public void setup() {
  size(500, 500);
}
public void draw() {
  fill(0, 0, 0, 50);
  rect(0, 0, 500, 500);
  frameRate(20);
  sierpinski2(0, 500, 500);
}
public void mouseDragged() { //optional
}
int base = 15; //start triangle size
public void keyPressed() {
  if (key == 'w' || key == 'W') {
    if (base <= 50) {
      base++;
    }
  }
  if (key == 's' || key == 'S') {
    if (base >= 2) {
      base--;
    }
  }
}
int randColor; //rainbowww
public void sierpinski2(int x, int y, int len) {
  noStroke();
  if (len <= base) {
    if (mousePressed == true) { //chaos rainbow mode
      randColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
      fill(randColor);
    } else { //less chaotic single color variation
      fill(mouseX/2, mouseY/2, (float)Math.random()*255, (float)Math.random()*200+50);
    }
    triangle(x, y, x+len, y, x+(len/2), y-len);
  } else {
    sierpinski2(x, y, len/2);
    sierpinski2(x+(len/2), y, len/2);
    sierpinski2(x+(len/(mouseX/100+1)), y-(len/2), len/2);
    sierpinski2(x+(len/(mouseX/25+100)), y-(len), len/4);
  }
}
//rainbow wireframe triangles
public void sierpinski(int x, int y, int len) {
  strokeWeight(1);
  stroke(255);
  //stroke((float)Math.random()*255,(float)Math.random()*255,(float)Math.random()*255);
  noFill();
  if (len <= 20) {
    triangle(x, y, x+len, y, x+(len/4), y-len);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x+(len/2), y, len/2);
    sierpinski(x+(len/4), y-(len/2), len/2);
  }
}
