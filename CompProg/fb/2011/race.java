/**
 * Algorithm: DP
 * Alternatively, a shorter solution does not use DP.
 * Simply consider which turns has a lower proability of crashing
 * when overtaking than driving normally, and pick those turns to overtake
 */

import java.util.*;
import java.io.*;
import java.math.*;
public class race{
    static int n,t,r;
    static Rational over[] = new Rational[100];
    static Rational norm[] = new Rational[100];

    static Rational dp[][]  = new Rational [100][100];
    
    static class Rational{
        public BigInteger top;
public        BigInteger bot;
        public Rational(int top, int bot){
           this. top = new BigInteger(top+"");
           this. bot = new BigInteger(bot+"");
        }
        private Rational(){}
        public Rational add(Rational r){
            Rational k = new Rational();
            k.top =  top.multiply(r.bot).add(r.top.multiply(bot));
            k.bot = r.bot.multiply(bot);
            BigInteger gcd = k.top.gcd(k.bot);
            k.top = k.top.divide(gcd);
            k.bot = k.bot.divide(gcd);
            return k;
        }
        public int compareTo(Rational r){
            
            Rational k = new Rational();
            k.top =  top.multiply(r.bot);
            k.bot = r.top.multiply(bot);
            return k.top.compareTo(k.bot);
        }
        public Rational multiply(Rational r){
        
            Rational k = new Rational();
            k.top =  top.multiply(r.top);
            k.bot = r.bot.multiply(bot);
            BigInteger gcd = k.top.gcd(k.bot);
            k.top = k.top.divide(gcd);
            k.bot = k.bot.divide(gcd);
            return k;
        }
    }

    static Rational find(int left, int idx){
        if (dp[left][idx]!=null) return dp[left][idx];

        if (left == 0){
            
            Rational r1 = norm[idx];
            for (int i = idx+1; i < t; i++){
                r1 = r1.multiply(norm[i]);
            }
            return dp[left][idx]=r1;
        }
        if (left == t - idx){
            Rational r1 = over[idx];
            for (int i = 1; i < left; i++){
                r1 = r1.multiply(over[idx+i]);
            }
            return dp[left][idx]=r1;
        }
        Rational r1 = norm[idx].multiply(find(left, idx+1));
        Rational r2=(over[idx].multiply(find(left-1,idx+1)));

        return dp[left][idx] = r1.compareTo(r2)<0? r2:r1;
    }

    public static void main(String []ar)throws Exception{
        Scanner s = new Scanner(System.in);
        n = s.nextInt(); s.nextLine();
        for (int casen = 1; casen <= n;casen++){
            for (int i = 0; i < dp.length;i++)
                for (int j =0; j < dp[i].length;j++){
                    dp[i][j]=null;
                }
            r = s.nextInt(); 
            t = s.nextInt(); 
            for (int i =0; i < t;i++){
                int a = s.nextInt();
                over[i] = new Rational(a-1,a); a=s.nextInt();
                norm[i] = new Rational(a-1,a);
            }
            s.nextLine();

            Rational rr = find(r-1, 0);
            System.out.println("Case #"+casen+": "+rr.top.toString()+
                "/"+rr.bot.toString());
        }
    }
}
