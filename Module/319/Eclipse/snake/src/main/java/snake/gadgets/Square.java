package snake.gadgets;

import java.awt.Color;
import java.awt.Graphics;

public class Square {
	int x;
	int y;
	int size;
	
	public Square(int x, int y, int size) {
		super();
		this.x = x;
		this.y = y;
		this.size = size;
	}

	public void draw(Graphics g, Color c) {
		g.setColor(c);
		g.fill3DRect(x * size, y * size, size, size, true);
	}
	
	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
}
