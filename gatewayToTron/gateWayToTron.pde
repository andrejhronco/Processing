HRect d;
HColorField colors;
//{#092140, #024959, #F2C777, #F24738, #BF2A2A};
void setup(){
	size(600,600);
	translate(width/2, height/2);
	// rotate(radians(180));
	
	H.init(this).background(#121212);
	smooth();
	rectMode(CENTER);

	colors = new HColorField(width,height)
		.addPoint(-width/2, -height/2, #092140, 0.9)
		.addPoint(width/2, -height/2, #024959, 0.8)
		.addPoint(width/2, height/2, #F24738, 0.7)
		.addPoint(-width/2, height/2, #BF2A2A, 0.6)
		.strokeOnly()
	;

	for (int i = 0; i<500; i++){
		d = new HRect();
		d
			.loc( (int)random(-width,width), (int)random(-height,height) )
			// .noStroke()
			.fill(#000000)
			.size( d.x()* .40,  (d.y()-height/2) * .40)
			// .rotate( (int)random(360) )
			
			.anchorAt(H.CENTER)
		;
		colors.applyColor(d);
		H.add(d);
	}

	H.drawStage();
}
