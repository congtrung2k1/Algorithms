/**
Algorithm:
Dynamic Programming with memoization + BigInteger

Top-down d.p. solutions always need memoization

If you want, you can code BigInteger in C++/C
*/

import java.math.*;
import java.util.*;
import java.io.*;


public class  Main
{
    static BigInteger cache [][]=new BigInteger[11][65];
    // d is last digit
    // l is length
    static BigInteger find( int d, int l) 
    {
        if (l == 1){
            return big[d+1];
        }
        if ( cache[d][l] != null) return cache[d][l];

        BigInteger ans = BigInteger.ZERO;
        for (int i = 0; i <= d;i++){
            ans = ans.add( find(i, l-1));
        }return  cache[d][l] = ans;
    }
    static BigInteger[] big = new BigInteger[1000];

    public static void main(String [] args){
        Scanner s = new Scanner(System.in);
        for (int i = 0; i < 11;i++){
            big[i] = new BigInteger(i+"");
        }
        int n = s.nextInt(); s.nextLine();
        while (n-- > 0){
            int id = s.nextInt();
            int k = s.nextInt();
            s.nextLine();
            for (int i = 0; i < cache.length;i++){
                for (int j = 0; j < cache[i].length;j++){
                    cache[i][j] = null;
                }
            }
            System.out.println(id+" "+find(9, k).toString());
        }

    }

}
