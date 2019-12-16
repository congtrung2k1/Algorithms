import java.util.*;
import java.io.*;


public class billboards
{
    
    static boolean can(int w, int h, int size, String[] toks){
        int curwid  = -size;
        int curhei = size;

        int idx=2;
        while (idx < toks.length){
        
            int len = toks[idx].length();
            if ((1+len) * size + curwid <= w){
                curwid += (1+len)*size; idx++;
            }
            else{
                curwid = -size;
                curhei += size;
                if (curhei > h) return false;

                if ((1+len) * size + curwid <= w){
                    curwid += (1+len)*size; idx++;
                }else return false;

            }
        }
        return true;
    }

    public static void main(String[]args) throws Exception{
    
        Scanner s = new Scanner(System.in);

        int t = s.nextInt(); s.nextLine();
        for (int i = 0; i < t;i++){
            String line = s.nextLine();
            String toks[] = line.split(" ");
            int w = Integer.parseInt(toks[0]);
            int h = Integer.parseInt(toks[1]);
        
            int lo = 1;
            int hi = w;
            int works = 0;
            while (lo <= hi){
                int mid = (lo+hi)/2;
                if (can(w,h,mid,toks)){ works = mid; lo=mid+1; }
                else {hi = mid-1;}
            }
            System.out.println("Case #"+(i+1)+": "+works);
        }
    }
}
