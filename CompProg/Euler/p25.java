
import java.math.*;


public class p25
{
    public static void main(String[]args)
    {
        BigInteger f1 = new BigInteger("1");
        BigInteger f2 = new BigInteger("1");
        int i;
        for (i= 3; ;i++)
        {
            BigInteger f3 = f1.add(f2);
            if (f3.toString().length()>=1000) break;
            f1 = f2;
            f2 = f3;
        }

        System.out.println(i);
    }
}

