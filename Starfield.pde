Particle [] particles;

public void setup() {
	size(700, 700);
	particles = new Particle [500];

	for (int i = 0; i < particles.length; i ++) {
		particles[i] = new NormalParticle ();
	}

	particles[1] = new Jumbo();
}

public void draw() {
	background(0);

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

	NormalParticle() {
		double startSize = 0.01;
		mySize = dist((float) myX, (float) myY, (float) width/2, (float) height/2) * startSize;
		myX = width / 2;
		myY = height / 2;
		myAngle = Math.PI * 2 * Math.random();
		mySpeed = Math.random() * 5 + 2;

		myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
	}

	public void move () {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
		myAngle += 0.02;
	}

	public void show () {
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
		mySize += 0.1;
	}

	public void respawn () {
		double size = mySize /2;
		if (myX < 0 - size || myX > width+ size || myY < 0 - size || myY > height + size) {
			mySize = 0;
			myX = width / 2;
			myY = height / 2;
			myAngle = Math.random() * 2 * PI;
			mySpeed = Math.random() * 5 + 2;
		} 
	}
}

interface Particle {
	public void show();
	public void move();
	public void respawn();
}

class Jumbo extends NormalParticle{
	double size, sizeX, sizeY;

	void show () {
		fill(myColor);
		sizeX = width / 2;
		sizeY = height / 2;
		size = (Math.abs(myX - sizeX) + Math.abs(myY - sizeY)) * 0.4;
		ellipse((float)myX, (float)myY, (float)size, (float)size);
	}

	void respawn () {
		double size = mySize /2;
		if (myX < 0 - size || myX > width+ size || myY < 0 - size || myY > height + size) {
			mySize = 0;
			myX = width / 2;
			myY = height / 2;
			myAngle = Math.random() * 2 * PI;
			mySpeed = Math.random() * 5 + 2;
		} 
	}

}

class OddballParticle implements Particle{
	public void show() {

	}

	public void move () {

	}

	public void respawn () {

	}
}

