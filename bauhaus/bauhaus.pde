// color[] moon = {#092140, #024959, #F2C777, #F24738, #BF2A2A};
// color[] contrastingPastels = {#E5E5E5, #FFB240, #B2B2B2, #59BDFF, #666666};
// color[] coverDeep = {#591D28, #D9D9D9, #F0F0F2, #80878C, #0D0D0D};
// color[] vladLightBlue = {#3C3F40, #389BA6, #6CCED9, #D9A13B, #F2F2F2};
// color[] reds = {#a92b30,#8c2d2d,#bd3d4f,#c94f67};
color[] bauhaus = {#edd6b7,#486a69,#42547c,#bd5657,#3e373f,#e7656f,#fe825e,#f66337,#ffbb4c};
color[] pallete = bauhaus;
int rad = 0;
float p;
float noiseCount = 0;

void setup() {
	size(700, 700);
	background(pallete[0]);
	smooth();
	noFill();
	
	//noiseSeed(round(random(500)));
}

void draw() {
	translate(width/2, height/2);

	if ((rad) < width-60) {
		p = noise(noiseCount);
		// noiseDetail(12,0.35);
		println(int(p*10)-1 + " / " + (p*10) + "r: " + (int)random(8));
		strokeWeight(2);
		stroke(pallete[constrain(int(p*10)-1, 0, 8)]);
		ellipse(0, 0, 50+rad, 50+rad);
		rad += 2;
		noiseCount += 0.07;
	}
}