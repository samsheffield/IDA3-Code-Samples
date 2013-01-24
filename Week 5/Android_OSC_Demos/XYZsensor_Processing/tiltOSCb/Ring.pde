class Ring {
	float x, y, dia;

	Ring(float _x, float _y, float _dia){
		x = _x;
		y = _y;
		dia = _dia;
	}

	void update(float _x, float _y){
		x = _x;
		y = _y;
	}

	void draw(){
		noFill();
		stroke(155,200,10);
		strokeWeight(10/2);
		ellipse(x, y, dia, dia);
	}
}
