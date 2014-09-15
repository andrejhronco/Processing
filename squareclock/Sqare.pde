class Sqare {
	int w;
	Sqare (int _w) { 
		w = _w;
	}

	void display(int w) {
		stroke(0);
		strokeWeight(2);
		fill(255, 255, 255, 50);
		rect(0, 0, w, w);
		fill(0,0);
		rect(0, 0 - w/4, w * 0.05, w/2);
		stroke(255);
		strokeWeight(3);
		line(-10, -w/2, 10, -w/2);
		stroke(0);
		fill(0);
		ellipse(0, 0, 20, 20);
	}
}