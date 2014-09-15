// these are all color palettes you can use.
color[] bw = {#000000,#ffffff}; // black and white
color[] moon = {#092140, #024959, #F2C777, #F24738, #BF2A2A};
color[] contrastingPastels = {#E5E5E5, #FFB240, #B2B2B2, #59BDFF, #666666};
color[] coverDeep = {#591D28, #D9D9D9, #F0F0F2, #80878C, #0D0D0D};
color[] vladLightBlue = {#3C3F40, #389BA6, #6CCED9, #D9A13B, #F2F2F2};
color[] reds = {#a92b30,#8c2d2d,#bd3d4f,#c94f67};
color[] bauhaus = {#edd6b7,#486a69,#42547c,#bd5657,#3e373f,#e7656f,#fe825e,#f66337,#ffbb4c};
color[] msl = {#636298,#776D92,#A46F7F,#9E574B,#9B4E3F,#C4633D,#BB745A,#C68061,#D38A55};
color[] palette = bauhaus; // change this to use a different color palette; bw, moon, coverDeep, etc...

int rw = 500, // shape starting width
	rh = 500, // shape starting height
	num = 10, // number of shapes 
	counter = 1, // counter
	rs = 0, // rectangle stroke color
	sb = 0, // sketch color
	cs = 0, // circle stroke color
	cl = 0, // circle line color
	sa = 230; // stroke alpha
float step = 50.0, // initial spacing between shapes
	inc = 0.15, // this is added to change the shape size in the loop
	xoff = 0.0, // x-offset for the line
	yoff = 0.0, // y-offset for the line
	shortnerWidth = 1.0, // starting value of the width shortner
	shortnerHeight = 1.0; // starting value of the height shortner
boolean swhich = true; // this is the switch, true = shape gets bigger, false = shape gets smaller

void setup() {
	size(1000, 600); // window size
	rectMode(CENTER); 
	ellipseMode(CENTER);
	strokeWeight(10);
	stroke(#FFFFFF,230);
	noFill();
	// this chooses a random color from the current palette
	rs = (int)random(palette.length); // rectangle stroke
	sb = (int)random(palette.length); // sketch background
	cs = (int)random(palette.length); // circle stroke
	cl = (int)random(palette.length); // circle line
	//sa = (int)random(100,230); // circle line
}

void draw() { // this loop runs forever
	background(palette[sb]); // sets the background color of the sketch 
	// background(palette[(int)random(8)]);
	translate(width/2, height/2); // sets the origin (0,0) to the center of the sketch instead of top left (default)

	for(int i = 0; i<num; i++){ // run this code as many times as the int num, ex. 10 times
		if(keyPressed && key == 'c'){ // if 'c' is pressed run this code
			xoff = random(-50, 50); // x-offset sets the x (left - right) position of the line
			yoff = random(-50, 50); // y-offset sets the y (top - bottom) position of the line
			stroke(palette[cs],sa); // stroke color of the circles
			strokeWeight(10); // strokeWeight of the circles
			ellipse(0, 0, (rw - (i*step) * shortnerWidth), (rh - (i*step)) * shortnerHeight); // creates the circles
			stroke(palette[cl],xoff*5); // sets the color of the line and xoff*5 controls the lines transparency (alpha)
			strokeWeight((int)random(3)); // sets the line width 
			line(xoff, -height/2.75+yoff, -xoff, height/2.75-yoff); // creates and positions the lines
		}
		else {
			stroke(palette[rs],sa); // sets the rectangle stroke color, with alpha of 230
			strokeWeight(10); // sets the strokeWeight
			rect(0, 0, (rw - (i*step) * shortnerWidth), (rh - (i*step)) * shortnerHeight); // creates the rectangles
		}
	}
	// lines 54 - 67 controls the in/out motion of the shapes, it changes direction every 1200 counts
	if(swhich){ // if swhich = true, add value (inc) to step and add one to counter
		step += inc;
		counter++;
	}
	else { // if swhich = false, subtract value (inc) from step and subract one from counter
		swhich = false;
		step -= inc;
		counter--;
	}

	if (counter % 1200 == 0) { // every 1200 reset counter to 0 and flip switch
		counter = 0;
		swhich = !swhich;
	}

	// println("step: " + step + " / switch: " + swhich + " / counter: " + counter);
}

void keyPressed() { // checks to see if a key is pressed
	if (key == CODED) { // checks to see if the key is a special key, non-alphanumeric
    	if (keyCode == UP) { // makes the shape taller
    		shortnerHeight += 0.01;
    	} else if (keyCode == DOWN) { // makes the shape shorter
      		shortnerHeight -= 0.01;
    	}
    	else if (keyCode == LEFT) { // makes the shape narrower
      		shortnerWidth += 0.01;
    	} 
    	else if (keyCode == RIGHT) { // makes the shape wider
      		shortnerWidth -= 0.01;
    	} 
  	}
}