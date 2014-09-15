PShape circle;
float zoom = .5;
int counter = 1;
int alpha = 255, delta = 1; 
boolean fade;

void setup(){
  size(600,600);
  circle = createShape(ELLIPSE, 0, 0, 50, 50);
  shapeMode(CENTER);
  background(#FFFFFF);
  square.setFill(color(0, 0, 255));
  square.setStroke(false);
}

void draw(){
  background(#FFFFFF);
  counter++;
  if(counter % 255 == 0){
    counter = 1;
    zoom = 0.5;
    alpha = 0;
  }

  stroke(0, 0, 0, alpha);
  translate((width/2), (height/2));
  if (alpha == 0) { alpha = 255; }
  alpha -= delta;
  zoom += 0.0015;
  scale(zoom);
  rotate(counter*TWO_PI/360);
  
  pushMatrix();
  scale(zoom);
  shape(circle);
  popMatrix();
  
//  println(counter + " alpha: " + alpha + " delta: " +delta);
}

