/**
 * Algorithm: DP but tedious
 */

import java.io.*;
import java.util.*;
import java.math.*;

public class peg
{

public static class Rational
{
    private BigInteger n;
    private BigInteger d;
    
    
   public static Rational ONE = new Rational(1);
   public static Rational ZERO = new Rational(0);
   

   private Rational (int num)
   {
        n = new BigInteger(num+"");
      d = BigInteger.ONE;
      
   }
   
   public Object clone()
   {
        Rational r = new Rational(0);
        r.n = new BigInteger(this.n.toString());//.clone();
        r.d = new BigInteger(this.d.toString());//.clone();
        return r;
   }
   
   public void add(Rational r)
   {
        BigInteger new_n = r.n.multiply(this.d).add(this.n.multiply(r.d));
        BigInteger new_d = r.d.multiply(this.d);
        
        BigInteger gcd = new_n.gcd(new_d);
        d = new_d.divide(gcd);
        n = new_n.divide(gcd);
   }
   
   public Rational half()
   {
        Rational r = (Rational)this.clone();
        r.d = r.d.shiftLeft(1);
        return r;
   }
   
   public boolean bigger_than(Rational r)
   {
       BigInteger left = r.n.multiply(this.d);
       BigInteger right = (this.n.multiply(r.d));
       
       return left.compareTo(right) <0;
   }
   
   public String toString()
   {
    double nd = n.doubleValue();
    double dd = d.doubleValue();
    double v = nd/dd;
    BigDecimal nb = new BigDecimal(n);
    BigDecimal db = new BigDecimal(d);
    BigDecimal aa = nb.divide(db);
   // return aa.toString();
    return String.format("%1$.6f",v);
   }
}

    public static Rational doit(int R, int C, int K,  char map[][], Rational rat[][])
    {
        for (int r = 1; r < R; r++)
        {
            for (int c = r%2; c < 2*C-2;c++)
            {
                char cur= map[r][c];
                if (cur != '\0') continue;
                if (c-1 >= 0 && rat[r-1][c-1] !=null&& map[r-1][c-1] =='\0' && map[r][c-1]=='x')
                {
                    // far left?
                    if (c-1 <= 1)
                        rat[r][c] =(Rational) rat[r-1][c-1].clone();
                    else rat[r][c] = rat[r-1][c-1].half();
                }
                if (rat[r-1][c+1] !=null&& map[r-1][c+1] =='\0' && map[r][c+1]=='x')
                {
                    // far right?
                    if (rat[r][c] == null) rat[r][c] =(Rational) Rational.ZERO.clone();
                    if (c+1 >= 2*C-3)
                        rat[r][c].add( rat[r-1][c+1] );
                    else rat[r][c] .add(rat[r-1][c+1].half() );
                }
                if (rat[r-1][c] !=null && map[r-1][c] =='\0' )
                {
                    
                    if (rat[r][c] == null) rat[r][c] =(Rational) Rational.ZERO.clone();
                    
                    rat[r][c] .add( rat[r-1][c]);
                }
            }
        }
        
        return rat[R-1][2*K+1];
    }
    public static void main(String[]args) throws Exception
    {
        FileInputStream fis = new FileInputStream(args[0]);
        BufferedInputStream bis = new BufferedInputStream(fis);
        DataInputStream dis = new DataInputStream(bis);
        
        String line=null;
        
        line = dis.readLine().trim();
        int N = Integer.parseInt(line);
        
        for (int i = 0; i < N; i++)
        {
            line = dis.readLine().trim();
            String toks[] = line.split(" ");
            int R = Integer.parseInt(toks[0]);
            int C = Integer.parseInt(toks[1]);
            int K = Integer.parseInt(toks[2]);
            int M = Integer.parseInt(toks[3]);
            
            char map[][] = new char[R][2*C-1];

            for (int r = 0; r < R; r ++)
            {
                for (int c = r%2; c < 2*C-1;c+=2)
                {
                    map[r][c] = 'x';
                }

            }
            
            for (int j = 0; j < M; j++)
            {
                int r1 = Integer.parseInt(toks[4+2*j]);
                int c1 = Integer.parseInt(toks[5+2*j]);
                
                map[r1][r1%2 + c1*2] = '\0';
            }
            
            
            
            Rational max =(Rational) Rational.ZERO.clone();
            int best = -1;
            for (int cc = 0; cc < 2*C-2;cc++)
            {
            
                if (map[0][cc]  !='\0') continue;
                
                Rational rat[][] = new Rational[R][2*C+1];
                for (int c = 0; c < 2*C-2;c ++)
                {
                    if (map[0][c] == '\0')rat[0][c] =  (Rational)Rational.ZERO.clone();
                }
                
                rat[0][cc] = (Rational)Rational.ONE.clone();
                
                Rational result = doit(R,C,K,map,rat);
                if (result.bigger_than(max))
                {
                    max =(Rational) result.clone();
                    best = cc;
                }
            }
            
            System.out.println((best-1)/2+" "+max);
        }
    }
}
