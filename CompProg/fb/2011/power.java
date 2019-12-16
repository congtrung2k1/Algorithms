
import java.util.*;
import java.math.*;
import  java.io.*;

public class power{
    public static void main(String []aaa) throws Exception{
        Scanner s = new Scanner(System.in);
        int n = s.nextInt(); s.nextLine()
        ;int casen =1;
        while (n-->0){
            long g = s.nextLong(); 
            long w = s.nextLong();
            long m = s.nextLong(); s.nextLine();
            long numw = m/2/w;
            long numg = (m-numw*w)/g;
            BigInteger maxdmg = new BigInteger(""+numw).multiply(
                new BigInteger(""+numg));
            long maxg =  numg;
            long maxw = numw;
            for (long i = - 1000000; i < 1000000;i++){
                long numw2 = numw+i; if (numw2 <=0)continue;
                long numg2 = m-numw2*w;
                if (numg2 <=0) break;
                numg2 /= g;
                BigInteger  dmg = new BigInteger(""+ numg2).
                            multiply( new BigInteger(""+ numw2));
                int k = dmg.compareTo(maxdmg);
                if (k >0){ maxdmg = dmg; maxg = numg2; maxw = numw2; }
                else if (k==0 && maxw < numw2){
                    maxg = numg2; maxw = numw2;
                }
            }
            System.out.println("Case #"+casen++ + ": "+maxg);
        }
    }
}
