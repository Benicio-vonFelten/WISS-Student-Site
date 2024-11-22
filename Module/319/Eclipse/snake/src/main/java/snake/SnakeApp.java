package snake;

import java.awt.EventQueue;

import javax.swing.JFrame;

import snake.gameboard.GameBoard;

public class SnakeApp implements Runnable {

	public static void main(String[] args) {
		EventQueue.invokeLater(new SnakeApp());
//		System.out.println("main wird beendet.");
	}

	@Override
	public void run() {
//		try {
//			Thread.sleep(1000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		System.out.println("snake game starts ...");
		JFrame frame = new JFrame();
		frame.setResizable(false);
		frame.setTitle("Snake Game");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(new GameBoard(600,600,25));
		frame.pack();
		frame.setVisible(true);
		frame.setLocationRelativeTo(null);
	}
}