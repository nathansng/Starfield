NormalParticle [] bob;

void setup() {
	size(400, 400);
	bob = new NormalParticle [10];

	for (int i = 0; i < bob.length(); i ++) {
		bob[i] = new NormalParticle (200, 200);
	}
}

void draw() {
	background(100);

	for (int i = 0; i < bob.length(); i ++) {
		bob[i].move();
		bob[i].show();
	}

}

class NormalParticle {
	double myX, myY, myAngle, mySpeed;
	int myColor;

	NormalParticle(double x, double y) {
		myX = x;
		myY = y;
		myAngle = Math.PI * 2 * Math.random();
		mySpeed = Math.random() * 5;

		myColor = color(0);
	}

	void move () {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
	}

	void show () {
		ellipse((float)myX, (float)myY, 10, 10);
	}
}

interface Particle {
	//your code here
}

class OddballParticle {
	//your code here
}

class JumboParticle {
	//your code here
}

