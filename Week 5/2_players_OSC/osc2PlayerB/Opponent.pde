class Opponent{
	int x = width/3;
	int y = height/2;
	int wh = 20;

	Opponent () {
		draw();
	}

	void update(int oscX, int oscY){
		x = oscX;
		y = oscY;
	}

	void draw(){
		fill(#839847);
		ellipse(x,y,wh, wh);
	}

	boolean hitTest(float x2, float y2){
		if(dist(x,y,x2,y2) < wh/2){
			return true;
		}else{
			return false;
		}
	}
}