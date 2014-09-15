float se, mi, hr, d, m, yr;
int squa = 3;
Sqare[] squares = new Sqare[squa];

void setup() {
  size(640, 640);
  frameRate(60);
  noFill();
  rectMode(CENTER);
  for (int i = 0; i<squares.length; i++){
    squares[i] = new Sqare(i);
  }
  textAlign(CENTER);
}

void draw() {
  background(255);
  se = second();
  mi = minute();
  hr = hour();
  d = day();
  m = month();
  yr = year();

  translate(width/2, height/2);

  for (int j = 0; j < 360; ++j) {
    pushMatrix();
    rotate(radians(j));
    strokeWeight(1);

    if(j % 15 == 0){
      stroke(128,128,128,90);
      fill(128,45);
      ellipse(0, -(j/2), 10, 10);
    }
    else{
      stroke(128,128,128,45);
    }
    line(0, 0, width/2, height/2);
    popMatrix();
  }  
  pushMatrix(); 
    rotate((hr + mi/60.0) % 12 * TWO_PI/12);
    squares[0].display(400); 
  popMatrix(); 
  
  pushMatrix(); 
    rotate((mi + se/60.0) * TWO_PI/60);
    squares[1].display(390); 
  popMatrix(); 

  pushMatrix(); 
    rotate(se * TWO_PI/60);
    squares[2].display(380);  
  popMatrix(); 

  fill(128);
  textSize(26);
  text(round(hr), -width/3, -290, 0);
  text(round(mi), 0, -290, 0);
  text(round(se), width/3, -290, 0);
  text(round(d), -width/3, 310, 0);
  text(round(m), 0, 310, 0);      
  text(round(yr), width/3, 310, 0);
}