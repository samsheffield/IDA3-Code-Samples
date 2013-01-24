class Pellet{
	float x, y;
	float dia = 80;

	color c = #ffee00;
	boolean oscControl;

	Pellet(boolean _oscControl){
		oscControl = _oscControl;
		if(!oscControl){
			newXY();
		}
		
	}

	void update(boolean hit, float _x, float _y){
		x = _x;
		y = _y;
		if(hit){
			c = #ff3300;
		}else{
			c = #ffee00;
		}
	}

	void draw(){
		noStroke();
		fill(c);
		ellipse(x,y,dia, dia);
	}

	void newXY(){
		x = random(dia/2, displayWidth-(dia/2));
		y = random(dia/2, displayHeight-(dia/2));
	}
}