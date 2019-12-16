import java.util.*;
import java.math.*;

public class p3
{
    public static void main(String args[])
    {
        BigInteger k = new BigInteger("600851475143");

        final  int primes[] = {2,3,5,7,11,13,19};

        BigInteger p[] = new BigInteger[primes.length];

        for (int i = 0; i < primes.length; i++)
        {
            p[i] = new BigInteger(primes[i]+"");
        }

    boolean stop = false;
        while (!stop)
        {
            boolean chg = false;

            for (int i = 0; i < p.length;i++)
            {
                BigInteger re =  k.remainder(p[i]);
                if (re.equals(BigInteger.ZERO))
                {
                    k = k.divide(p[i]);
                    chg = true;
                }else if (i == p.length-1 && !chg)
                {
                    stop=true;
                    break ;
                }
            }
            
        }
here:
        System.out.println(k);
    }
}

