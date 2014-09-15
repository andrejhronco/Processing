int i = 0;
void setup(){
  size(600, 600);
  background(193, 163, 213);
  noStroke();
  frameRate(12);
  //noLoop();
}

void draw(){
  fill(193, 163, 213, 40);
  rect(-width/2, -height/2, 1200, 1200);
//  background(193, 155, 214, 10);
  //translate(width*0.75, height*2/3);
  translate(width/2, height/2);
  ellipse(0,0,1,1);
  fill(142, 58, 189, 60);
  
  //for (int i = 0; i<16; i++){
    pushMatrix();
//    rotate(PI*mouseX / width);
    rotate(radians(157)+(i*0.4));
    rect(0,0, width/4+(i*8), height/8);  
    popMatrix();
  //}
  i++;
  if(i%17 == 0){
    i = 1;
//    i+=3;
//    println("true");
  }
}
