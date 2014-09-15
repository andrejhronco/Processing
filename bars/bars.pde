color[] moon = {#092140, #024959, #F2C777, #F24738, #BF2A2A};
color[] contrastingPastels = {#E5E5E5, #FFB240, #B2B2B2, #59BDFF, #666666};
color[] coverDeep = {#591D28, #D9D9D9, #F0F0F2, #80878C, #0D0D0D};
color[] vladLightBlue = {#3C3F40, #389BA6, #6CCED9, #D9A13B, #F2F2F2};
color[] reds = {#a92b30,#8c2d2d,#bd3d4f,#c94f67};
color[] pallete = reds;

void setup(){
	size(450, 600);
	noStroke();
	smooth();
	background(255, 255, 255);
	noLoop();
}

void draw(){
	for (int i = 0; i<8; i++){
		fill(pallete[(int)random(4)]);
		pushMatrix();
		rotate(radians(random(-6, 6)));
		rect((int)random(width/4), (int)random(height/18,height/6)*i, width/1.5, height/8);
		popMatrix();
	}
}	
void keyPressed(){
  if(key == 's'){
    saveFrame("bars-##.png");
  }
}