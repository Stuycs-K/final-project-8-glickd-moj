import java.util.*;

public class Game{
  public int numOfHands = 1;
  public ArrayList<Hand> hands;
  public ArrayList<Card> dealerHand;
  public Scanner in = new Scanner(System.in);
  public Deck deck;
  public Hand dealer;
  public Game(){
    hands = new ArrayList<Hand>();
    dealerHand  = new ArrayList<Card>();
    deck = new Deck();
    dealer = new Hand(0);
  }
  public void game(){
    boolean notAllBust = false;
    if(numOfHands == 1){
      startGame();
    }
    else{
      nextTurn();
    }
    deck.shuffle();
    dealer.dealHand(deck);
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      hand.dealHand(deck);
      hand.displayCards();
      System.out.print("The dealer is holding a ");
      dealer.displayDealerCards();
      while(hand.hasMoves()){
        String move = getMove();
        if(move.equals("hit")){
          hand.hit(deck);
          hand.displayCards();
        }
        if(move.equals("stand")){
          hand.stand();
        }
      }
      if(!hand.isBust()){
        notAllBust = true;
      }
    }
    if(notAllBust){
      dealerMove();
      declareWinner();
    }
    else{
      if(hands.size() > 1){
        declareWinnerAllBust();
      }
      else{
        declareWinnerOneBust();
      }
    }
  }
  public void reset(){
    System.out.println("Would you like to play again? ");
    String s = in.nextLine();
    if(s.equals("yes")){
      Game game = new Game();
      numOfHands++;
      game.game();
    }
  }

  public void declareWinnerAllBust(){
    System.out.println("Oh well, everyone busted. The dealer wins.");
    reset();
  }
  public void declareWinnerOneBust(){
    System.out.println("Oh well, you busted. The dealer wins.");
    reset();
  }
  public void declareWinner(){
    int dealerValue = dealer.getValue();
    if(dealerValue > 21){
      System.out.println("The dealer busted. You won! ");
    }
    else{
      int maxHandValue = 0;
      int maxHandHolder = 0;
      for(int i = 0; i < hands.size(); i++){
        Hand temp = hands.get(i);
        int value = temp.getValue();
        if (value > maxHandValue){
          maxHandValue = value;
          maxHandHolder= i+1;
        }
      }
      if(maxHandValue < dealerValue){
        System.out.println("Oh well, the dealer wins.");
      }
      if(maxHandValue == dealerValue){
        System.out.println("Not bad, you pushed.");
      }
      if(maxHandValue > dealerValue){
        System.out.println("Great job, player "+ maxHandHolder + " won.");
      }
    }
    reset();
  }
  public void dealerMove(){
    dealer.displayCards();
    while(dealer.hasMoves()){
      if(dealer.getValue() <= 16){
        dealer.hit(deck);
        dealer.displayCards();
      }
      else{
        dealer.stand();
      }
    }
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
  public void startGame(){
    System.out.println("Welcome to the casino!");
    System.out.println("Today you will be playing Blackjack.");
    System.out.println("The rules of blackjack are pretty simple: ");
    System.out.println("How many players would you like in the game?  ");
    String s = in.nextLine();
    int j = Integer.parseInt(s);
    numOfHands = j;
    for(int i = 0; i < numOfHands; i++){
      hands.add(new Hand(i+1));
    }
  }
}
