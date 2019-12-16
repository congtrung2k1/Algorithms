import java.io.*;
import java.util.*;



public class ds
{
    public static boolean issqr(long h)
    {
        long j = (long)Math.floor(Math.sqrt(h));
        
        if (j *j == h || (j+1)*(j+1)==h || (j-1)*(j-1)==h) return true;
        return false;
    }
    public static long count(long x)
    {
        long p=0;
        long max = (long)(Math.floor(Math.sqrt(x))+1);
        boolean hassame = false;
        for (long i = 0; i <= max; i++)
        {
            long remain = x -i*i;
            hassame = hassame || (remain==i*i);
            if (remain>=0 && issqr(remain)){p++;  }
        }
        if  (hassame && p%2 !=1)System.out.println("ppp");
    if (hassame) return (p-1)/2+1;
    return p/2;}
    
    public static void main(String[]args)throws Exception
    {
        FileInputStream fis = new FileInputStream(args[0]);
        BufferedInputStream bis = new BufferedInputStream(fis);
        DataInputStream dis = new DataInputStream(bis);
        
        String line=null;
        
        line = dis.readLine().trim();
        int N = Integer.parseInt(line);
        
        for (int i = 0; i < N ;i++)
        {
            line = dis.readLine().trim();
            long x = Long.parseLong(line);
            
            System.out.println(count(x));
        }
        
    }
}