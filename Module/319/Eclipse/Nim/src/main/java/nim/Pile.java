package nim;

public class Pile {
    private int stones;

    public Pile(int stones) {
        this.stones = stones;
    }

    public int getStones() {
        return stones;
    }

    public void removeStones(int count) {
        stones -= count;
    }

  
}
