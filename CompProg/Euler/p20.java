import java.math.*;


public class p20
{
    public static void main(String[]args)
    {
        BigInteger s = new BigInteger("1");
        for (int i = 2; i <= 100;i++)
        {
            BigInteger k = new BigInteger(""+i);
            s = s.multiply(k);
        }

        String str = s.toString();
       int sum=0;
       for (int i = str.length()-1;i>=0;i--)
       {
        sum += str.charAt(i)-'0';
       }
       System.out.println(sum);
    }
}
