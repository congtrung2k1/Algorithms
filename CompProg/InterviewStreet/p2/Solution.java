import java.io.*;
import java.util.*;


public class Solution
{
    private static class Bucket
    {
        public List<Integer> startRacers;        
        public List<Integer> endRacers;        
    }

    private static class Racer
    {
        public int start;
        public int end;
        public int id;
        public int score;
    }

    private static class Raw
    {
        public long num;
        public int idx;
    }

    private static Bucket[] buckets;
    private static Racer[] racers;

    private static final int BUCKET_RANGE = 20;// (int)Math.sqrt(70000);

    private static int countValid(Racer r, List<Integer> racersList, int must)
    {
        int count = 0;

        for (Integer idx : racersList)
        {
            Racer target = racers[idx];
            if (target.start >= must && target.start > r.start && target.end < r.end)
                count++;
        }

        return count;
    }

    public static void main(String[]args)
        throws IOException
    {
        Scanner s = new Scanner(System.in);

        int nRacers = s.nextInt(); s.nextLine();

long s2 = System.currentTimeMillis();
        Raw nums[] = new Raw[2*nRacers];

        racers = new Racer[nRacers]; //HashMap<Integer, Racer>(nRacers);

        buckets = new Bucket[2*nRacers/BUCKET_RANGE+1];

        for (int i = 0; i < buckets.length; i++)
        {
            buckets[i] = new Bucket();
            buckets[i].startRacers = new ArrayList<Integer>();
            buckets[i].endRacers = new ArrayList<Integer>();
        }

        int m[][] = new int[buckets.length][buckets.length];

        // O(n)
        for (int i = 0; i < nRacers; i++)
        {
            int id = s.nextInt();
            long start = s.nextLong();
            long end = s.nextLong();
            s.nextLine();
       
            Raw raw = new Raw();
            raw.num = start;
            raw.idx = i;
            nums[i*2] = raw;

            raw = new Raw();
            raw.num = end;
            raw.idx = i;
            nums[i*2+1] = raw;

            Racer r = new Racer();
            r.start = -1;
            r.id = id;
            racers[i] = r;
        }

long s1 = System.currentTimeMillis();
//System.out.println(s1-s2);

        // O(n log n)
        Arrays.sort(nums, new Comparator<Raw>(){
            @Override
            public int compare(Raw r1, Raw r2)
            {
                // note: no duplicate
                long k = r1.num - r2.num;
                return k < 0 ? -1 : 1;
            }
        });

        long e1 = System.currentTimeMillis();
//        System.out.println(e1-s1);

 s1 = System.currentTimeMillis();

        // O(n)
        for (int i = 0; i < nums.length;i++)
        {
            Racer r = racers[nums[i].idx];
            if (r.start < 0)
                r.start = i;
            else
            {
                r.end = i;
                int startBuckIdx = r.start/BUCKET_RANGE;
                int endBuckIdx = r.end/BUCKET_RANGE;
                Bucket startBuck = buckets[startBuckIdx];
                Bucket endBuck = buckets[endBuckIdx];
                startBuck.startRacers.add(nums[i].idx);
                endBuck.endRacers.add(nums[i].idx);
                m[startBuckIdx][endBuckIdx] ++;

            }
        }

        e1 = System.currentTimeMillis();
//        System.out.println(e1-s1);
        for (int i=0; i < m.length; i++)
        {
            for (int j = 1; j < m[i].length; j++)
            {
                m[i][j] += m[i][j-1];
            }
        }


        for (int i=1; i < m.length; i++)
        {
            for (int j = 1; j < m[i].length; j++)
            {
                m[i][j] += m[i-1][j];
            }
        }

        int idx = 0;
        
        // O(n^1.5)
        for (Racer r : racers)
        {
            int startBuckIdx = r.start/BUCKET_RANGE;
            int endBuckIdx = r.end/BUCKET_RANGE;
            Bucket startBuck = buckets[startBuckIdx];
            Bucket endBuck = buckets[endBuckIdx];
            int score = countValid(r, startBuck.startRacers, -1);
            
            if (startBuckIdx != endBuckIdx) 
            {
                score += countValid(r, endBuck.endRacers, (startBuckIdx+1)*BUCKET_RANGE);
            }

           if ( startBuckIdx + 1 <= endBuckIdx - 1)
                score += m[endBuckIdx-1][endBuckIdx - 1]-m[startBuckIdx][endBuckIdx-1];
        
            r.score= score;
        }

        Arrays.sort(racers, new Comparator<Racer>(){
            @Override
            public int compare(Racer r1, Racer r2)
            {
                int k = r1.score - r2.score;
                if (k != 0) return k;
                if (r1.id < r2.id) return -1;
                return 1;
            }
        });

        for (Racer r :racers)
        {
            System.out.format("%d %d\n", r.id, r.score);
        }

 s1 = System.currentTimeMillis();
//System.out.println(s1-e1);
}
}
