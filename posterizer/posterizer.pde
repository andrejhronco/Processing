PImage img;

void setup() {
//  size(1200,750);
//  smooth();
//  frameRate(60);
//  background(255);
//  ellipseMode(CENTER);
//  colorMode(HSB, 255);
  img = loadImage("xray-manta-ray.jpg");
  size(img.width, img.height);
}

void draw() {
  for(int i = 0; i<img.pixels.length; i++){
    color c = img.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float br = brightness(c);
    
    if(br > 250){
      img.pixels[i] = color(0);
//      img.pixels[i] = color(r,g,b);
    }
    else {
      img.pixels[i] = color(255);
//      img.pixels[i] = color(b,g,r);
    }
  }
  image(img, 0, 0);
}
