// color[] moon = {#092140, #024959, #F2C777, #F24738, #BF2A2A};
// color[] contrastingPastels = {#E5E5E5, #FFB240, #B2B2B2, #59BDFF, #666666};
// color[] coverDeep = {#591D28, #D9D9D9, #F0F0F2, #80878C, #0D0D0D};
// color[] vladLightBlue = {#3C3F40, #389BA6, #6CCED9, #D9A13B, #F2F2F2};
color [] reds = {#a92b30,#8c2d2d,#bd3d4f,#c94f67};
color [] oranges = {#da572e,#d25132,#dc743b,#dc7d43};
color [] palleteHalf = reds;
color [] palleteQuarter = oranges;

int hf1, hf2, hf3, hf4, qf1, qf2, qf3, qf4;

void setup(){
	size(600, 600);
	noStroke();
	//noLoop();
}

void draw(){
	if (keyPressed){
		if (key == TAB){
			hf1 = (int)random(4);
			hf2 = (int)random(4);
			hf3 = (int)random(4);
			hf4 = (int)random(4);
			qf1 = (int)random(4);
			qf2 = (int)random(4);
			qf3 = (int)random(4);
			qf4 = (int)random(4);
		}
	}
	//half rect
		fill(palleteHalf[hf1]);
		// fill(palleteHalf[0]);
		rect(0, 0, width/2, height/2);
		fill(palleteHalf[hf2]);
		// fill(palleteHalf[1]);
		rect(width/2, 0, width/2, height/2);
		fill(palleteHalf[hf3]);
		// fill(palleteHalf[2]);
		rect(0, height/2, width/2, height/2);
		fill(palleteHalf[hf4]);
		// fill(palleteHalf[3]);
		rect(width/2, height/2, width/2, height/2);

	//quarter rect
		fill(palleteQuarter[qf1]);
		// fill(palleteQuarter[0]);
		rect(width/4, height/4,width/4, height/4);
		fill(palleteQuarter[qf2]);
		// fill(palleteQuarter[1]);
		rect(width/2, height/4, width/4, height/4);
		fill(palleteQuarter[qf3]);
		// fill(palleteQuarter[2]);
		rect(width/4, height/2, width/4, height/4);
		fill(palleteQuarter[qf4]);
		// fill(palleteQuarter[3]);
		rect(width/2, height/2, width/4, height/4);
}

void keyPressed(){
  if(key == 's'){
    saveFrame("tetrachord-##.png");
  }
}



