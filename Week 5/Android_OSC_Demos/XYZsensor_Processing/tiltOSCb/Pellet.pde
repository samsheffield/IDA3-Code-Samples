class Pellet{
	float x, y;
	boolean alive = true;
	float dia = 40;

	color c = #ffee00;

	// MOVE, CHANGE COLOR
	void update(boolean hit, float _x, float _y){
		x = _x;
		y = _y;

		if(hit){
			c = #ff3300;
		}else{
			c = #ffee00;
		}
	}

	// DRAW TO SCREEN
	void draw(){
		noStroke();
		fill(c);
		ellipse(x,y,dia, dia);
	}
}