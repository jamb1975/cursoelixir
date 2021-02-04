package listmultiplos2;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author javadeveloper
 */
public class ListMultiplos2 {
  public List<Integer> listintegers=new ArrayList<Integer>();
  public List<Integer> listintegerspares=new ArrayList<Integer>();
    /**
     * @param args the command line arguments
     */
  public void elementospares()
  {
      for(int i: listintegers)
      {
          i=i*3+1;
          if(i%2==0)
          {
            listintegerspares.add(i);
          }
      }
  }
          
    public static void main(String[] args) {
        ListMultiplos2 listMultiplos2=new ListMultiplos2();
        listMultiplos2.listintegers.add(11);
        listMultiplos2.listintegers.add(12);
        listMultiplos2.listintegers.add(13);
        listMultiplos2.listintegers.add(14);
        listMultiplos2.listintegers.add(15);
        listMultiplos2.listintegers.add(16);
        listMultiplos2.elementospares();
        for(int i: listMultiplos2.listintegerspares)
      {
          
          System.out.println(i);
      }
        
        // TODO code application logic here
    }
    
}
