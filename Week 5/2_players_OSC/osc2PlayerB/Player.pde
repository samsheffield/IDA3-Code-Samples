class Player {
	int x = width - width/3;
	int y = height/2;
	int wh = 20;

	Player(){
		draw();
	}

	void update(){
		x = mouseX;
		y = mouseY;
	}

	void draw(){
		fill(#9359a6);
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