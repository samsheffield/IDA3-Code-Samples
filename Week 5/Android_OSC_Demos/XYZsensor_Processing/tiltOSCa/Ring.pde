class Ring {
	float x, y, dia;

	Ring(float _x, float _y, float _dia){
		x = _x;
		y = _y;
		dia = _dia;
	}

	void update(float _x, float _y){
		if(x > dia/2 && x < displayWidth-(dia/2)){
			x -= _x;
		}else if(x <= dia/2){
			x += 2;
		}else if(x >= displayWidth-(dia/2)){
			x -= 2;
		}

		if(y > dia/2 && y < displayHeight-(dia/2)){
			y += _y;
		}else if(y <= dia/2){
			y += 2;
		}else if(y >= displayHeight-(dia/2)){
			y -= 2;
		}
	}

	void draw(){
		noFill();
		stroke(155,200,10);
		strokeWeight(10);
		ellipse(x, y, dia, dia);
	}
}
