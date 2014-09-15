class Line {
	int slx, sly, lex, ley ,st;

	Line (int _slx, int _sly, int _lex, int _ley, int _st) {
		slx = _slx;
		sly = _sly;
		lex = _lex;
		ley = _ley;
		st = _st;
	}

	void display(int st) {
		line(slx, sly, lex, st);
	}

}