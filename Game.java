import java.util.*;

public class Game{
  public int numOfHands = 1;
  public ArrayList<Hand> hands;
  public ArrayList<Card> dealerHand;
  public Scanner in = new Scanner(System.in);
<<<<<<< HEAD
  public Deck deck;
  public Hand dealer;
  public Game(){
    hands = new ArrayList<Hand>();
    dealerHand  = new ArrayList<Card>();
    deck = new Deck();
    dealer = new Hand(0);
  }
=======
  public Deck deck = new Deck();
  public Hand dealer = new Hand(0,1);
  public boolean dealerNeeds= false;
  public int dealersNum;
>>>>>>> fd8eb266934642ad915dfab6b06ee10600a07b3d
  public void game(){
    showPrompts();
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      System.out.println("Ok player " + hand.getPlayer() + ". How much would you like to bet?");
      playerBet(hand);
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
        System.out.println("Oh well.. Player " + hand.getPlayer() + " busted.");
        int chips = hand.getChips();
        hand.setChips(chips-hand.getBet());
        System.out.println("They lost " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
      }
      else{
        dealerNeeds= true;
      }
    }
  }
<<<<<<< HEAD
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

=======
>>>>>>> fd8eb266934642ad915dfab6b06ee10600a07b3d
  public void declareWinner(){
    for(int i = 0; i < hands.size(); i++){
      Hand hand = hands.get(i);
      if(hand.getValue()==21 && hand.numOfCards() == 2){
        System.out.println("Well done! Player " + hand.getPlayer() + " wins!! Blackjack!");
        int chips = hand.getChips();
        hand.setChips(chips+hand.getBet());
        System.out.println("They won " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
      }
      else if(hand.isBust()){

      }
      else if(hand.getValue() > dealersNum || dealer.isBust()){
        System.out.println("Well done! Player " + hand.getPlayer() + " wins. BOOM");
        int chips = hand.getChips();
        hand.setChips(chips+hand.getBet());
        System.out.println("They won " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
      }
      else if(hand.getValue() == dealer.getValue()){
        System.out.println("Not bad! Player " + hand.getPlayer() + " pushes.");
      }
      else{
        System.out.println("Oh well... Player " + hand.getPlayer() + " lost.");
        int chips = hand.getChips();
        hand.setChips(chips-hand.getBet());
        System.out.println("They lost " + hand.getBet() + " chips and now have " + hand.getChips() +  " chips.");
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
<<<<<<< HEAD
    reset();
=======
>>>>>>> fd8eb266934642ad915dfab6b06ee10600a07b3d
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
    dealer.setBust(false);
    dealer.setMoves(true);
    System.out.println("Would you like to play again?");
    String s = in.nextLine();
    if(s.equals("yes")){
      for(int i = 0; i < hands.size(); i++){
        Hand hand = hands.get(i);
        if(hand.getChips() <= 0){
          System.out.println("Oh well, player " + hand.getPlayer() + " is bankrupt. They have to leave the table");
          hands.remove(hand);
          i--;
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
