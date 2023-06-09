import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
public class Deck {
  private ArrayList<Card> deck;
  private ArrayList<PImage> deckImg = new ArrayList<PImage>(52);
  public Card back;

  public void loadImages() {
    File folder = new File(dataPath(""));
    File[] pngs = folder.listFiles();
    //System.out.println(Arrays.toString(pngs));
    for (int i = 0; i < pngs.length; i++) {
      String path = pngs[i].getAbsolutePath();
      if (path.indexOf(".png") >= 0){
        PImage img = loadImage(path);
        deckImg.add(img);
      }
      if (path.indexOf(".jpg") >= 0){
        PImage img = loadImage(path);
        back = new Card(0, img);
      }
    }
  }


  public Deck() {
    deck = new ArrayList<Card>(52);
    loadImages();
    for (int i = 0; i < 4; i++) {
      for (int j = 1; j < 13; j++) {
        Card addition = new Card(j, deckImg.get(j+i*12));
        deck.add(addition);
      }
    }
  }

  public int size() {
    return deck.size();
  }

  public ArrayList<Card> getDeck() {
    return deck;
  }

  public Card deal() {
    return deck.remove(0);
  }

  public void shuffle() {
    int deckSize = size();
    ArrayList<Card> shuffled = new ArrayList<Card>(deckSize);
    for (int i = 0; i < deckSize; i++) {
      int ind = (int)(Math.random()*size());
      shuffled.add(deck.remove(ind));
    }
    deck = shuffled;
  }
}
