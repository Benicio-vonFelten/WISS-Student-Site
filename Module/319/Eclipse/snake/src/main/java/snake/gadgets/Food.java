package snake.gadgets;

import java.awt.Color;
import java.awt.Graphics;

public class Food {
	private Square square;
	private Color color;
	
	public Food(int x, int y, Color color, int size) {
		square = new Square(x, y, size);
		this.color = color;
	}
	
	public void draw(Graphics g) {
		square.draw(g, color);
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}
	
	public int getX() {
		return square.x;
	}

	public void setX(int x) {
		this.square.x = x;
	}
	
	public int getY() {
		return square.y;
	}

	public void setY(int Y) {
		this.square.y = Y;
	}
	
	public int getSize() {
		return square.size;
	}

	public void setSize(int size) {
		this.square.size = size;
	}
}
