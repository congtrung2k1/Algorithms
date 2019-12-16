#include <iostream>
#include <cstdio>

#define maxN 45
#define maxn maxN*maxN

using namespace std;
int res[maxn],b[maxN][maxN],n,m,cnt=0,dd[]={1,-1,0,0},cc[]={0,0,1,-1},area[maxn],Minx[maxn],Miny[maxn],Maxx[maxn],Maxy[maxn],MAXX[maxn],MAXY[maxn];
char a[maxN][maxN]; bool visited[maxN][maxN],VISITED[maxn],SHAPE1[maxN][maxN],SHAPE2[maxN][maxN];

void DFS(int x,int y)
{
    b[x][y]=cnt;
    area[cnt]++;
    Minx[cnt]=min(Minx[cnt],x);
    Miny[cnt]=min(Miny[cnt],y);
    Maxx[cnt]=max(Maxx[cnt],x);
    Maxy[cnt]=max(Maxy[cnt],y);
    for (int i=0; i<4; i++)
    {
        int u=x+dd[i],v=y+cc[i];
        if (!visited[u][v] && a[u][v]==a[x][y])
        {
            visited[u][v]=true;
            DFS(u,v);
        }
    }
}

void yolo1()
{
    for (int i=1; i<=m; i++) for (int j=1; j<=n; j++) if (!visited[i][j])
    {
        cnt++;
        Minx[cnt]=Miny[cnt]=long(1e9);
        visited[i][j]=true;
        DFS(i,j);
    }
    cout<<cnt<<'\n';
    for (int i=1; i<=m; i++)
    {
        for (int j=1; j<=n; j++) cout<<b[i][j]<<" ";
        cout<<'\n';
    }
}

void fillchar(bool a[][maxN])
{
    for (int i=1; i<=40; i++) for (int j=1; j<=40; j++) a[i][j]=0;
}

void makeshape(int x,bool a[][maxN])
{
    fillchar(a);
    for (int i=Minx[x]; i<=Maxx[x]; i++) for (int j=Miny[x]; j<=Maxy[x]; j++) if (b[i][j]==x) a[i-Minx[x]+1][j-Miny[x]+1]=true;
    MAXX[x]=Maxx[x]-Minx[x]+1;
    MAXY[x]=Maxy[x]-Miny[x]+1;
}

bool same(bool a[][maxN],bool b[][maxN])
{
    for (int i=1; i<=m; i++) for (int j=1; j<=n; j++) if (a[i][j]!=b[i][j]) return false;
    return true;
}

void spinshape(bool a[][maxN],int x)
{
    bool b[maxN][maxN];
    for (int i=1; i<=MAXX[x]; i++) for (int j=1; j<=MAXY[x]; j++) b[MAXY[x]-j+1][i]=a[i][j];
    fillchar(a);
    for (int i=1; i<=MAXY[x]; i++) for (int j=1; j<=MAXX[x]; j++) a[i][j]=b[i][j];
    swap(MAXX[x],MAXY[x]);
}

void yolo2()
{
    int cntres=0;
    for (int shape1=1; shape1<cnt; shape1++) if (!VISITED[shape1])
    {
        makeshape(shape1,SHAPE1);
        cntres++;
        res[shape1]=cntres;
        for (int shape2=shape1+1; shape2<=cnt; shape2++) if (area[shape1]==area[shape2])
        {
            makeshape(shape2,SHAPE2);
            if (same(SHAPE1,SHAPE2))
            {
                VISITED[shape2]=true;
                res[shape2]=cntres;
            }
            else
            {
                for (int spin=1; spin<4; spin++)
                {
                    spinshape(SHAPE1,shape1);
                    if (same(SHAPE1,SHAPE2))
                    {
                        VISITED[shape2]=true;
                        res[shape2]=cntres;
                        break;
                    }
                }
            }
        }
    }
    cout<<cntres<<'\n';
    for (int i=1; i<=m; i++)
    {
        for (int j=1; j<=n; j++) cout<<res[b[i][j]]<<" ";
        cout<<'\n';
    }
    for (int i=1; i<=cnt; i++) cout<<area[i]<<' ';
}

int main()
{
    freopen("hinh.inp","r",stdin);
    freopen("hinh.out","w",stdout);
    scanf("%d%d\n",&m,&n);
    for (int i=1; i<=m; i++) scanf("%s",a[i]+1);
    yolo1();
    yolo2();
    return 0;
}
