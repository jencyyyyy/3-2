#include <bits/stdc++.h>
using namespace std;

int main(){
    //freopen("priorityInput.txt","r",stdin);
    int n;
    cin>>n;
    vector <pair<int, int>> prio;
    vector <int> waiting(n),turnaround(n);
    vector <int> burst(n),priority(n);
    float totalWaitingTime=0.0,totalTurnATime=0.0;
    for (int i=0;i<n;i++){
        cin>>burst[i];
        cin>>priority[i];
        prio.push_back(make_pair(priority[i],i));
    }
    sort(prio.begin(),prio.end());

    for (int i=0;i<n;i++){
        if (i == 0 )
            turnaround[prio[i].second] = burst[prio[i].second];
        else 
            turnaround[prio[i].second] = turnaround[prio[i-1].second] + burst[prio[i].second];
            
    }
    for (int i=0;i<n;i++){
        waiting[i] = turnaround[i] - burst[i];
    }

    cout<<"Processes    "<<"Burst Time  "<<"Waiting time    "<<"Turn around time"<<endl;
    for (int i=0;i<n;i++){
        totalWaitingTime+=waiting[i];
        totalTurnATime+=turnaround[i];
        cout<<" p"<<prio[i].second+1<<"\t\t"<<burst[prio[i].second]<<"\t\t"<<waiting[i]<<"\t\t"<<turnaround[i]<<endl;;
    }
    float avgTime = totalWaitingTime/(float)n;
    float avgTAT = totalTurnATime/(float)n;

    cout<<"Average Time: "<<avgTime<<endl;
    cout<<"Average Turn around time: "<<avgTAT<<endl;

    for (int i=0;i<n;i++)
        printf("----------------");
    printf("\n");

    for (int i=0;i<n;i++)
        printf("|\tP%d\t",prio[i].second+1);
    
    printf("|\n");
    for (int i=0;i<n;i++)
        printf("----------------");
    
    cout<<endl;
    printf("0\t");
    for(int i=0;i<n;i++){
        printf("\t%d\t",turnaround[prio[i].second]);
    }
    cout<<endl;

}