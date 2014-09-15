/* TODO: 
	use proximity value to change ct
*/
Line[] lines = new Line[21];
int ct;
void setup() {
	size(512, 512);
	smooth();
	ct = 21;
	for (int i = 0; i<lines.length; i++){
		lines[i] = new Line(0,0,width, 0, ct);
	}

}

void draw() {
	background(255, 255, 255, 10);

	strokeWeight(3);
	// stroke(random(255),random(255),random(255));
	if (ct <= height/ct+1 * ct) {
		ct = constrain(ct, 1, height);
	}
	else {
		ct = 1;
	}

	for (int i = 0; i<lines.length; i++){
		lines[i].display((i*(512/ct)));
	}
	println(second());
}

void keyPressed() {
	stroke(random(255),random(255),random(255));
	  if (key == CODED) {
	    if (keyCode == UP) {
	      ct += 1;
	    } else if (keyCode == DOWN) {
	      ct -= 1;
	    } 
	  } 
	  println("step: " + ct);
	}