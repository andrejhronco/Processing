import processing.pdf.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
Oscil       mod;

float xoff = 0.0, xoff2 = 0.0, xoff3 = 0.0, xoff4 = 0.0, w25, w50, w75;
int resetFrame = 30000;

boolean b = false;
void setup() {
  size(1280,800,P3D);
  //setup minim
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 220, 0.5f, Waves.squareh( 10 ) );
  mod  = new Oscil( 0.05, 0.1f, Waves.TRIANGLE );
  // connect up the modulator
  mod.patch( wave.amplitude );
  wave.patch( out );

  if(b){
  	background(255);
  	  stroke(0, 10);
  }
  else {
  	background(0);
  	  stroke(255, 10);
  }
  noiseSeed(0);
  beginRecord(PDF, "render-###.pdf");
}

void draw() {
  float w5 = height*0.05,
        w10 = height*0.10,
        w25 = height*0.25,
        w50 = height*0.50,
        w75 = height*0.75,
        w90 = height*0.90;

  xoff = xoff + .01;
  xoff2 = xoff2 + .005;
  xoff3 = xoff3 + .0025;
  xoff4 = xoff4 + .0015;

  float n = noise(xoff) * width,
        n2 = noise(xoff2) * width,
        n3 = noise(xoff3) * width,
        n4 = noise(xoff4) * width;

  float amp = map( n2*0.1, 0, width, 0, 1 );
  wave.setAmplitude( amp );
  
  float freq = map( n3, 0, width*2, 60, 1000 );
  wave.setFrequency( freq );

  float ampm = map( n, 0, width, 0, 1 );
  mod.setAmplitude( ampm );

  float freqm = map( n, 0, width, 1, 10 );
  mod.setFrequency( freqm );

  stroke(255, 10);
  line(n4, 0, n4, w5-1);
  stroke(255, 8);
  line(n4, w5, n3, w50-1);
  stroke(255, 4);
  line(n3, w50, n, w90-1);
  stroke(255, 3);
  line(n, w90, n, height);

  if (frameCount % resetFrame == 0 ) {
    endRecord();
    background(0);
    println("print!: "+frameCount);
  }
  println("frameCount: "+frameCount + " / n: " + n + " / n2: " + n2 + " / n3: " + n3 + " / n4: " + n4);
}