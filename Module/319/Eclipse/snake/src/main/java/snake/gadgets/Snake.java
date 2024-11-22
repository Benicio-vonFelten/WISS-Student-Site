package snake.gadgets;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.ArrayList;
import java.util.List;

public class Snake implements KeyListener {
	Square head;
	List<Square> body;
	int velocityX;
	int velocityY;
	int squareSize;
	Color color;
	
	
	public Snake(int headX, int headY, int velocityX, int velocityY, Color color, int squareSize) {
		head = new Square(headX,headY,squareSize);
		body = new ArrayList<>();
		this.velocityX = velocityX;
		this.velocityY = velocityY;
		this.squareSize = squareSize;
		this.color = color;
	}
	
	public void draw(Graphics g) {
		head.draw(g, color);
		for(int i=0; i<body.size(); i++) {
			Square bodyPart = body.get(i);
			bodyPart.draw(g, color);
		}
	}
	
	public void move() {
		// Bewege de Körper
		for(int i = body.size()-1; i >= 0; i--) {
			Square bodyPart = body.get(i);
			if(i==0) {
				bodyPart.x = head.x;
				bodyPart.y = head.y;
			}
			else {
				Square prevBodyPart = body.get(i-1);
				bodyPart.x = prevBodyPart.x;
				bodyPart.y = prevBodyPart.y;
			}
		}
		
		// Bewege den Kopf
		head.x += velocityX;
		head.y += velocityY;
	}
	
	public boolean eat(Food food) {
		if (food.getX() == head.getX() && food.getY() == head.getY()) {
			body.add(new Square(food.getX(), food.getY(), squareSize));
			return true;
		}
		return false;
	}
	
	public int getBodySize() {
		return body.size();
	}
	
	public int getHeadX() {
		return head.x;
	}
	
	public int getHeadY() {
		return head.y;
	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void keyPressed(KeyEvent e) {
		if (e.getKeyCode() == KeyEvent.VK_UP && velocityY != 1) {
			velocityX = 0;
			velocityY = -1;
		}
		else if (e.getKeyCode() == KeyEvent.VK_DOWN && velocityY != -1) {
			velocityX = 0;
			velocityY = 1;
		}
		else if (e.getKeyCode() == KeyEvent.VK_LEFT && velocityX != 1) {
			velocityX = -1;
			velocityY = 0;
		}
		else if (e.getKeyCode() == KeyEvent.VK_RIGHT && velocityX != -1) {
			velocityX = 1;
			velocityY = 0;
		}
	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}
}
