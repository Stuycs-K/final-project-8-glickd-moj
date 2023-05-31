import java.util.*;

public class Game{
  public int numOfHands = 1;
  public ArrayList<Hand> hands = new ArrayList<Hand>();
  public ArrayList<Card> dealerHand = new ArrayList<Card>();
  public Scanner in = new Scanner(System.in);
  public Deck deck = new Deck();
  public Hand dealer = new Hand(0,1);
  public boolean dealerNeeds= false;
  public int dealersNum;
  public void game(){
    showPrompts();
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      System.out.println("Ok player " + (i+1) + ". How much would you like to bet?");
      playerBet(hand);
      playerMove(hand);
    }
    System.out.println("Alright. Enough betting. Time to play.");
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      playerMove(hand);
    }
    determineWinner();
    reset();
  }

  public void playerBet(Hand hand){
    String next = in.nextLine();
    int bet = Integer.parseInt(next);
    if(bet > hand.getChips()){
      System.out.println("You don't have that much money... You only have " + hand.getChips() + " chips.");
      System.out.println("Please try again.");
      playerBet(hand);
    }
    else{
      hand.setBet(bet);
      System.out.println("Alright, you bet " + hand.getBet() + " chips. Good luck.");
    }
  }

  public void determineWinner(){
    declareBust();
    if(dealerNeeds){
      dealerMove();
    }
    declareWinner();
    }
  public void declareBust(){
    for(int i = 0; i < hands.size(); i++){
      Hand hand = hands.get(i);
      if(hand.getValue() > 21){
        System.out.println("Oh well.. Player " + (i+1) + " busted.");
      }
      else{
        dealerNeeds= true;
      }
    }
  }
  public void declareWinner(){
    for(int i = 0; i < hands.size(); i++){
      Hand hand = hands.get(i);
      if(hand.getValue()==21 && hand.numOfCards() == 2){
        System.out.println("Well done! Player " + (i+1) + " wins!! Blackjack!");
      }
      else if(hand.isBust()){

      }
      else if(hand.getValue() > dealersNum || dealer.isBust()){
        System.out.println("Well done! Player " + (i+1) + " wins. BOOM");
      }
      else if(hand.getValue() == dealer.getValue()){
        System.out.println("Not bad! Player " + (i+1) + " pushes.");
      }
      else{
        System.out.println("Oh well... Player " + (i+1) + " lost.");
      }
    }
  }
  public void playerMove(Hand hand){
    hand.dealHand(deck);
    hand.displayCards();
    while(hand.hasMoves()){
      String move = getMove();
      if(move.equals("hit")){
        hand.hit(deck);
      }
      if(move.equals("stand")){
        hand.stand();
      }
    }
  }
  public void showPrompts(){
    if(numOfHands == 1){
      startGame();
    }
  }
  public void dealerMove(){
    dealer.dealHand(deck);
    dealer.displayCards();
    while(dealer.hasMoves()){
      if(dealer.getValue() <= 16){
        dealer.hit(deck);
      }
      else{
        dealer.stand();
      }
    }
    dealersNum = dealer.getValue();
  }
  public String getMove(){
    System.out.println("Please enter your move. Either hit or stand: ");
    String s = in.nextLine();
    return s;
  }
  public void startGame(){
    deck.shuffle();
    System.out.println("Welcome to the casino!");
    System.out.println("Today you will be playing Blackjack.");
    System.out.println("The rules of blackjack are pretty simple: ");
    System.out.println("How many players would you like in the game?  ");
    String s = in.nextLine();
    int j = Integer.parseInt(s);
    numOfHands = j;
    System.out.println("How many chips does each player have? ");
    String next = in.nextLine();
    int buyIn = Integer.parseInt(next);
    for(int i = 0; i < numOfHands; i++){
      hands.add(new Hand(i+1,buyIn));
    }
  }
  public void reset(){
    deck.shuffle();
    dealer.removeCards();
    System.out.println("Would you like to play again?");
    String s = in.nextLine();
    if(s.equals("yes")){
      for(int i = 0; i < hands.size(); i++){
        Hand hand = hands.get(i);
        if(hand.getChips() <= 0){
          System.out.println("Oh well, player " + (i+1) + " is bankrupt. They have to leave the table");
        }
        else{
          hand.removeCards();
          hand.setBust(false);
          hand.setMoves(true);
        }
      }
      numOfHands++;
      game();
    }
    else{
      System.out.println("Thanks for playing!");
    }
  }
}
