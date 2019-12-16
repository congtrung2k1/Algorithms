import java.io.*;
import java.util.*;


public class dd
{
    public static String sort(String[]words)
    {
        StringBuilder sb = new StringBuilder();
        
        for (int i = 0; i < words.length;i++)
        {
            int bestidx = -1;
            String curbest = words[i];
            
            
            for (int k = 0; k < words.length;k++)
            {
                
                String cur = words[k];
                
                if (cur==null) continue;
                
                if (bestidx <0){ bestidx = k; curbest=cur;continue; }
                
                int cmp = cur.compareTo(curbest);
                if (cmp==0) continue;
                
                if (cur.startsWith(curbest)||curbest.startsWith(cur) )
                {
                    String s1 = cur+curbest;
                    String s2 = curbest+cur;
                    if (s1.compareTo(s2) < 0){
                        curbest = cur;
                        bestidx =k;
                    }
                }
                else if (cmp < 0)
                {
                          curbest = cur;
                        bestidx =k;
                }
            }
            
            words[bestidx]=null;
            sb.append(curbest);
        }
        return sb.toString();
    }

    public static void main(String []args)
        throws Exception
    {
        FileInputStream fis = new FileInputStream("input.txt");
        BufferedInputStream bis = new BufferedInputStream(fis);
        DataInputStream dis = new DataInputStream(bis);
        
        String line=null;
        
        line = dis.readLine().trim();
        int N = Integer.parseInt(line);
        
        for (int i = 0; i < N; i++)
        {
            line = dis.readLine().trim();
            String tokens[] = line.split(" ");
            int M = Integer.parseInt(tokens[0]);
            
            String[] words = new String[M];
            for (int k = 0; k < M;k++)
            {
                words[k]=tokens[1+k].trim();
            }
            
            System.out.println(sort(words));
        }
        
        
        {
            
        }
        
    }
}
