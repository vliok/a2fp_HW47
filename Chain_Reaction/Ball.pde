class Ball {

  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;

  //other constants necessary?

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;


  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );

    rad = 10;

    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;

    state = MOVING;
  }


  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }


  boolean isTouching( Ball other ) {
    float separation = dist(other.x, other.y, x, y);
    if (separation < other.rad || separation < rad)
      return true;
    return false;
  }
  
  void bounce() {
      if (x + dx > 600 || x + dx < 600)
        dx *= -1;
      if (y + dy > 600 || y + dy < 600)
        dy *= -1;
  }
  
  void process() {
    if (state == 0)
      move();
    if (state == 1) {
      rad++;
      if (rad > 10)
        state = 2;
    }
    if (state == 2) {
        rad--;
        if (rad < 0)
          state = 3;
    }
    if (state == 3)
      return;
    }    
}//end class Ball