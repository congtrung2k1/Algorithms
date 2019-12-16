/**
Algorithm: 
Simple big integer stuff

If you want, you can write your own BigInteger implementation in C...
*/
import java.math.*;
import java.util.*;
import java.io.*;

public class Main
{
    static BigInteger a, b;

    public static void main(String p[]){
        Scanner s = new Scanner(System.in);

        while (s.hasNext()){
            String x = s.next();
            a = new BigInteger(x.trim());
            x = s.next();
            b = new BigInteger(x.trim());
            if (a.compareTo(BigInteger.ZERO)==0&&
                b.compareTo(BigInteger.ZERO)==0) break;
            if (a.compareTo(b) > 0) {
                BigInteger t = a;
                a = b;
                b = t; }

            BigInteger f1 = BigInteger.ONE;
            BigInteger f2 = BigInteger.ONE.add(f1);
            long  count = 0;
            while (f1.compareTo(a) < 0){
                BigInteger s2 = f1.add(f2);
                f1 = f2;
                f2 = s2;
            }
            while (true){
                if (f1.compareTo(b) > 0) break;
                count++;

                BigInteger s2 = f1.add(f2);
                f1 = f2;
                f2 = s2;
            }
            
            System.out.println(count+"");
        }
    }
}
