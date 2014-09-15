HDrawablePool pool;
HPixelColorist colors;
int cellSize = 10;

void setup() {
	size(800, 526);
	H.init(this).background(#111111);
	smooth();

	colors = new HPixelColorist("pilot.jpg")
		.fillOnly();

	pool = new HDrawablePool(4096);

	pool.autoAddToStage()
		.add(
			new HEllipse()
			// .rounding(4)
		)

		.layout(
			new HGridLayout()
			.startX(10)
			.startY(10)
			.spacing(cellSize+1,cellSize+1)
			.cols(72)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj){
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.anchorAt(H.CENTER)
						.alpha((int)random(0,2) * 255)
						.size(cellSize * random(0.5,1))
					;
					colors.applyColor(d);
					// println(pool.currentIndex());
				}
			}
		)
		.requestAll()
	;
	H.drawStage();
	noLoop();
}

void draw() {
	
}