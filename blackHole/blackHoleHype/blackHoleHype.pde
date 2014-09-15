HDrawablePool pool = new HDrawablePool(10);
float theSize = 50;

void setup() {
	size(800, 800);
	smooth();
//	noCursor();
	H.init(this).background(#ffffff);
	pool.autoAddToStage()
		.add(new HEllipse())

		
		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.loc(width/2, height/2)
						.fill(#101010)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(theSize)
						.rotate(45)
					;
					
					theSize+=(int)random(15,50);

					new HOscillator()
					.target(d)
					.property(H.SCALE)
					.range(0.25, 2)
					.speed(0.5)
					.freq(1)
					.currentStep( pool.currentIndex() * 3 )
					;
					new HOscillator()
					.target(d)
					.property(H.ALPHA)
					.range(0, 50)
					.speed(0.5)
					.freq(1)
					.currentStep( pool.currentIndex() * 0.5)
					;

				}
			}
		)
		.requestAll()
	;
	
	
}

void draw() {
	H.drawStage();
}