import java.util.*;

public class Game{
  Deck deck = new Deck();
  Hand hand = new Hand(1, 100);
  Hand dealer = new Hand(0, 100);
 
 public Game(){
   deck.shuffle();
   hand.dealHand(deck);
   dealer.dealHand(deck);
 }
 
 public void displayCards(int pos){
   if(pos == 0){
     dealer.displayCardsDealer();
   }
   else{
     hand.displayCards(pos);
   }
 }
 public void hit(int pos){
   hand.hit(deck, pos);
 }
 public void stand(){
   hand.stand();
 }
 
 public void playerBet(int bet){
   hand.setBet(bet);
 }
 public boolean isntBust(){
   return !hand.isBust();
 }
}
