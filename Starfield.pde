Particle [] particles;

public void setup() {
	size(400, 400);
	particles = new Particle [500];

	for (int i = 0; i < particles.length; i ++) {
		particles[i] = new NormalParticle (200, 200);
	}

	particles[0] = new JumboParticle(200, 200);
}

public void draw() {
	background(100);

	stroke(0);
	fill(255);

	for (int i = 0; i < particles.length; i ++) {
		particles[i].move();
		particles[i].show();
	}
}

class NormalParticle implements Particle{
	double myAngle, mySpeed, myX, myY;
	int myColor;

	NormalParticle(double x, double y) {
		myX = x;
		myY = y;
		myAngle = Math.PI * 2 * Math.random();
		mySpeed = Math.random() * 5 + 5;

		myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
	}

	public void move () {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
	}

	public void show () {
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}

	public void respawn () {
		double size = mySize /2;
		if (x < 0 - size || x > width+ size || y < 0 - size || y > height + size) {
			mySize = 0;
			myX = 200;
			myY = 200;
			angle = Math.random * 2 * PI;
			
		} 
	}
}

interface Particle {
	public void show();
	public void move();
}

class JumboParticle implements Particle{
	double myAngle, mySpeed, myX, myY;
	int myColor;

	JumboParticle(double x, double y) {
		myX = x;
		myY = y;
		myAngle = Math.PI * 2 * Math.random();
		mySpeed = Math.random() * 5 + 5;

		myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
	}

	public void show() {
		fill(myColor);
		ellipse((float)myX, (float)myY, 30, 30);
	}

	public void move() {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
	}
}

class OddballParticle {
	//your code here
}

