package baigianggui;

public class PTB2 {
	private double a;
	private double b;
	private double c;

	public double getA() {
		return a;
	}

	public void setA(double a) {
		this.a = a;
	}

	public double getB() {
		return b;
	}

	public void setB(double b) {
		this.b = b;
	}

	public double getC() {
		return c;
	}

	public void setC(double c) {
		this.c = c;
	}

	private double delta() {
		return Math.pow(b, 2) - 4 * a * c;
	}

	public Nghiem giai() {
		double d = delta();
		if (d < 0)
			return null;
		else {
			Nghiem n = new Nghiem();
			n.setX1((-b - Math.sqrt(d)) / (2 * a));
			n.setX2((-b + Math.sqrt(d)) / (2 * a));
			return n;
		}
	}
}
