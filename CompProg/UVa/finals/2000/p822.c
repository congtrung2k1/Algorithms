/*
 * Algorithm:
 * Priority Queues
 * 
 * - First we generate all requests and push them into a prio q.
 * - Then pop them one by one and handle.
 * - The tricky case is when two requests appear at the same time.
 *   Have to use the conflict-resolving logic.
 *
 * Gotchas:
 * - Language not very clear in the description (actually including mine :)
 * - Time between requests includes servicing time.
 *
 * */

#include<vector>
#include<map>
#include<queue>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
input:
#no .of topic
#id #requests #time-for-first #time-to-service $time-between
#no. of personnel
#person-id #no.-topics  [topic ids ... high to low prio]
0
*/

typedef struct
{
    int time; // time at which this req appears , minutes since start
    int id;
} req_t;

// job time ordering logic
class reqcomp
{
    public: bool operator()(const req_t &a,const req_t&b)
    const {
        return a.time > b.time;
    }
};

typedef struct
{
    int id;
    int last_job; // time of last job scheduled time
    int free; // time at which person is free
    std::map<int,int> prio; // topic id to prio
} person_t;

typedef struct
{
    int ridx;
    int pid;
}job_t;


person_t persons[10];
int numpersons;

typedef std::priority_queue<req_t, std::vector<req_t>, reqcomp> qt;
std::priority_queue<req_t, std::vector<req_t>, reqcomp> *q;
std::map<int,int> timeneed; // id to time needed
std::vector<req_t> list;
std::vector<bool> done;

// job scheduling and conflict -resolving  logic
class jobcomp
{
    public: bool operator()(const job_t &a,const job_t&b)
    const {
         person_t &pa = persons[a.pid];
         person_t &pb = persons[b.pid];
        int k= pa.prio[list[a.ridx].id] - pb.prio[list[b.ridx].id];
        if (k != 0) return k > 0;
        k = pa.last_job - pb.last_job;
        if (k!=0) return k>0;
        k = pa.id - pb.id;
        if (k!=0) return k>0;

        return true; // shouldn't reach here since all persons have diff id's...
    }
};


void handle(int time){
    
    std::priority_queue<job_t,std::vector<job_t>, jobcomp> jobq;
    int i;
    // loop thru each person and each job and push to jobq
    for (i=0;i<numpersons;i++){

        // skip if person not free at this time
        if (persons[i].free > time) continue;

        for (int j = 0; j < list.size();j++){
            const req_t & r = list[j];

            // person can handle this topic?
            if (persons[i].prio.find(r.id) != persons[i].prio.end())
            {
                job_t jo;
                jo.ridx = j;
                jo.pid = i;

                jobq.push(jo);
            }
        }
    }

    int numdone=0;
    // job assigning loop
    while (jobq.size())
    {
        job_t j = jobq.top(); jobq.pop();
        const req_t & r = list[j.ridx];

        // skip if job already done
        if (done[j.ridx]) continue;
        person_t & p = persons[j.pid];

        // skip if person already has job
        if (p.free > time) continue;
        
        // changing the last job field will "corrupt"
        // the state of the jobq but it is not a problem
        // since we already check whether person has job beforehand
        p.last_job = time;
        p.free = time + timeneed[r.id];
        done[j.ridx] = true;
        numdone++;
    }

    // any leftoverj  jobs?
    if (numdone == list.size()) return;

    // "reschedule" the jobs for another time
    int minfree = 0x7fffffff;
    for (i=0;i<numpersons;i++){
        const person_t & p = persons[i];

        // if a person is free at this time 
        // that means he has no priority for any of these leftover
        //  jobs
        if (p.free < minfree && p.free > time) minfree = p.free;
    }

    // repush back to queue
    for (i = 0 ; i < done.size();i++){
        if (done[i]) continue;
        req_t r;
        r.id = list[i].id;
        r.time = minfree;
        q->push(r);
    }

}

int sc=1;

int main()
{
    while (1)
    {
    int numtopics;
    scanf("%d", &numtopics);
    if (numtopics == 0) break;

    numpersons=0;
    int i,j,k;
    timeneed.clear();

    delete q; // sigh... c++ prio q has no .clear() method...
    q = new qt();

    for (i=0;i < numtopics; i++){
        int id, req, first, need, btw;
        scanf("%d%d%d%d%d", &id, &req, &first, &need, &btw);
        timeneed[id]=need;

        // Generate all requests for this topic
        for (j = 0; j <req;j++){
            req_t r;
            r.id =id;
            r.time = first;
            first += btw;
            q->push(r);
        }
    }
    scanf("%d",&numpersons);
    for (i=0;i < numpersons;i++){
        int id, num;
        persons[i].prio.clear();
        scanf("%d%d",&id,&num);
        persons[i].id=id;
        persons[i].free = persons[i].last_job=0;
        for (j=0;j<num;j++){
            int tid;
            scanf("%d",& tid);
            persons[i].prio.insert(std::make_pair(tid,j));
        }

    }

    while(q->size()){
        list.clear();
        done.clear();
        req_t r = q->top();
        q->pop();
        list.push_back(r);
        done.push_back(false);
        // Group all requests having same time together
        while (q->size() && q->top().time==r.time){
            list.push_back(q->top());
            done.push_back(false);
            q->pop();
        }

        handle(list[0].time);
    }

    int max = 0;
    for (i=0;i<numpersons;i++){
        if (persons[i].free > max) max = persons[i].free;
    }

    printf("Scenario %d: All requests are serviced within "
    "%d minutes.\n", sc, max); sc++;
}
}



