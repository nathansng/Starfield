Particle [] particles;

public void setup() {
	size(700, 700);
	particles = new Particle [500];

	for (int i = 0; i < particles.length; i ++) {
		particles[i] = new NormalParticle (width / 2, height / 2);
	}

	//particles[0] = new JumboParticle(width / 2, height / 2);
}

public void draw() {
	background(100);

	stroke(0);
	fill(255);

	for (int i = 0; i < particles.length; i ++) {
		particles[i].respawn();
		particles[i].move();
		particles[i].show();
	}
}

class NormalParticle implements Particle{
	double myAngle, mySpeed, myX, myY, mySize;
	int myColor;

	NormalParticle(double x, double y) {
		double startSize = 0.01;
		mySize = dist((float) myX, (float) myY, (float) width/2, (float) height/2) * startSize;
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
		mySize += 0.01;
	}

	public void respawn () {
		double size = mySize /2;
		if (myX < 0 - size || myX > width+ size || myY < 0 - size || myY > height + size) {
			mySize = 0;
			myX = width / 2;
			myY = height / 2;
			myAngle = Math.random() * 2 * PI;
			
		} 
	}
}

interface Particle {
	public void show();
	public void move();
	public void respawn();
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

	public void respawn () {

	}
}

class OddballParticle {
	//your code here
}

