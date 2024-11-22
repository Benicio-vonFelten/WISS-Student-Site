package nim;

import java.util.Scanner;

public class NimGame {
    private Player player1;
    private Player player2;
    private Pile pile;

    public NimGame() {
        player1 = new Player("Spieler 1"); // Name des Spielers
        player2 = new Player("Spieler 2"); // Name des Spielers
        pile = new Pile(10); // Steine anzahl
    }
    
//----------------------------------------------------------------

    public void startGame() {
        Scanner scanner = new Scanner(System.in);

        while (pile.getStones() > 0) {
            System.out.println("Anzahl steine: " + pile.getStones() + " Steine");

            // wer gewonnen hat
            playerMove(player1, scanner);
            if (pile.getStones() <= 0) {
                System.out.println(player1.getName() + " Gewonnen!");
                break;
            }

            playerMove(player2, scanner);
            if (pile.getStones() <= 0) {
                System.out.println(player2.getName() + " Gewonnen!");
            }
        }

        scanner.close();
    }
    
//-----------------------------------------------------------------
    
    private void playerMove(Player player, Scanner scanner) {
        System.out.println(player.getName() + ", Anzahl wir viele Steine du entfernen willst:");
        int stonesToRemove = scanner.nextInt();

        // Stehlt den Input fest
        while (stonesToRemove <= 0 || stonesToRemove > pile.getStones()) {
            System.out.println("Zu grosser Input. Gebe eine kleinere Zahl ein um die Steine zu entfernen:");
            stonesToRemove = scanner.nextInt();
        }

        // Updatet die steine
        pile.removeStones(stonesToRemove);
    }
}
