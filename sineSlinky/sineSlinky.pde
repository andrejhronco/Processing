float noiseScale=0.02;
int h = 0;
int counter = 1;
float step = 1.0, // initial spacing between shapes
  inc = 1;
boolean swhich = true;
void setup(){
  size(1280,750,P3D);
  noFill();
}

void draw() {
  background(#222222);
//  translate(width/2, height/2);
//  rotateY(radians(counter+1*0.010));
  for (int x=0; x < width; x++) {
    float noiseVal = noise((mouseX+x)*noiseScale, counter*0.25*noiseScale);
    stroke(noiseVal*255, noiseVal*200);
//    line(x, mouseY+noiseVal*80, x, height/100);
    ellipse(x, counter+noiseVal*280, 100, 100);
  }
    
if(swhich){ // if swhich = true, add value (inc) to step and add one to counter
    step += inc;
    counter++;
  }
  else { // if swhich = false, subtract value (inc) from step and subract one from counter
    swhich = false;
    step -= inc;
    counter--;
  }

  if (counter % height == 0) { // every height reset counter to 0 and flip switch
//    counter = 0;
    swhich = !swhich;
  }
  
  println(counter);
}
