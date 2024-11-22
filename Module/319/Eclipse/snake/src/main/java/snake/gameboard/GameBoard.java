package snake.gameboard;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JPanel;
import javax.swing.Timer;

import snake.gadgets.Food;
import snake.gadgets.Snake;
import snake.gadgets.Square;

@SuppressWarnings("serial")
public class GameBoard extends JPanel implements ActionListener {
	private static Random rnd = new Random();
	int boardwith;
	int boardheight;
	int squareSize;
	
	Food food;
	Snake snake;
	Timer timer;
	
	public GameBoard(int width, int height, int squareSize) {
		this.boardwith = width;
		this.boardheight = height;
		this.squareSize = squareSize;
		food = new Food(0,0,Color.red,squareSize);
		placeFood();
		snake = new Snake(5,5,1,0,Color.green,squareSize);
		setPreferredSize(new Dimension(600,600));
		setBackground(Color.white);
		setFocusable(true);
		addKeyListener(snake);
		timer = new Timer(150,this);
		timer.start();
	}
	
	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		draw(g);
	}
	
	private void draw(Graphics g) {
		food.draw(g);
		snake.draw(g);
	}
	
	private void placeFood() {
		food.setX(rnd.nextInt(boardwith / squareSize));
		food.setY(rnd.nextInt(boardheight / squareSize));
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		snake.move();
		if (snake.eat(food)) {
			placeFood();
		}
		repaint();
	}
}
