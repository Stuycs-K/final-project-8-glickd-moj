import java.util.*;

public class Game{
  public int numOfHands = 1;
  public ArrayList<Hand> hands = new ArrayList<Hand>();
  public ArrayList<Card> dealerHand = new ArrayList<Card>();
  public Scanner in = new Scanner(System.in);
  public void game(){
    if(numOfHands == 1){
      startGame();
    }
    else{
      nextTurn();
    }
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      hand.dealHand();
      hand.displayCards();
      while(hand.hasMoves()){
        String move = getMove();
        if(move.equals("hit")){
          hand.hit();
        }
        if(move.equals("stand")){
          hand.stand();
        }
      }
    }
    dealerhandMove();
    declareWinner();
  }

  public void dealerMove(){
    dealHand(dealerHand);

  }
  public void nextTurn(){
    System.out.println("Alright. Ready to play again?");
    System.out.println("Let's go!");
  }
  public String getMove(){
    System.out.println("Please enter your move. Either hit or stand: ");
    String s = in.nextLine();
    return s;
  }
  public static void startGame(){
    System.out.println("Welcome to the casino!");
    System.out.println("Today you will be playing Blackjack.");
    System.out.println("The rules of blackjack are pretty simple: ");
  }
}
