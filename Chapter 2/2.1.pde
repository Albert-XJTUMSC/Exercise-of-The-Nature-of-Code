//模拟一个氦气球向上漂浮并在窗口顶部反弹的效果，并添加一个随时间变化的风力，用Perlin噪声产生这个风力

Mover mover = new Mover();
void setup() {
  size(800, 800);
  background(255);

}

void draw() {
  background(255);
  PVector gravity = new PVector(0, 9.8);
  PVector floation = new PVector(0, -9.81);
  if(mousePressed) {
    PVector wind = new PVector(noise(frameCount), 0);
    mover.applyForce(wind);
    print(wind);
  }
  mover.applyForce(gravity);
  mover.applyForce(floation);
  mover.update();
  mover.checkEdges();
  mover.display();
}


class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover() {
    location = new PVector(200, 200);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
    
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y > height) {
      velocity.y *= -1;
    } else if (location.y < 0) {
      velocity.y *= -1;
    }
  }
}
