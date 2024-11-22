package nim;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class NimGame {

    private static int pileStones = 10;
    private static JLabel gameStatusLabel;
    private static JTextField stonesToRemoveField;

    public static void main(String[] args) {
        JFrame frame = new JFrame("Nim Game");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 1));

        gameStatusLabel = new JLabel("Current pile: " + pileStones + " stones");
        stonesToRemoveField = new JTextField(10);
        JButton playerMoveButton = new JButton("Make Move");

        playerMoveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                handlePlayerMove(stonesToRemoveField.getText());
            }
        });

        panel.add(gameStatusLabel);
        panel.add(stonesToRemoveField);
        panel.add(playerMoveButton);

        // Replace "C:/Users/Roblo/Downloads/Nimgamestone.png" with your absolute image path
        String imagePath = "C:/Users/Roblo/Downloads/Nimgamestone.png";
        ImageIcon stoneIcon = new ImageIcon(imagePath);
        JLabel stoneLabel = new JLabel(stoneIcon);

        frame.add(panel, BorderLayout.NORTH);
        frame.add(stoneLabel, BorderLayout.CENTER);

        frame.setVisible(true);
    }

    private static void handlePlayerMove(String input) {
        try {
            int stonesToRemove = Integer.parseInt(input);
            if (stonesToRemove > 0 && stonesToRemove <= pileStones) {
                pileStones -= stonesToRemove;
                updateGameStatus();
            } else {
                gameStatusLabel.setText("Invalid move. Please enter a valid number of stones.");
            }
        } catch (NumberFormatException e) {
            gameStatusLabel.setText("Invalid input. Please enter a valid number.");
        }
    }

    private static void updateGameStatus() {
        gameStatusLabel.setText("Current pile: " + pileStones + " stones");

        if (pileStones <= 0) {
            gameStatusLabel.setText("Game over. Player wins!");
        }
    }
}
