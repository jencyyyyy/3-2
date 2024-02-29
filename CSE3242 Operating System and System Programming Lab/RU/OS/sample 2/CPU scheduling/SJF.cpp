#include <bits/stdc++.h>
using namespace std;


int main(){
    int n;

    float totalWaitingTime=0.0,totalTurnATime=0.0;
    cin>>n;
    vector <int> waiting(n),turnaround(n);
    vector <pair<int,int>> burstTime(n);

    for (int i=0;i<n;i++){
        burstTime[i].second=i+1;
        cin>>burstTime[i].first;
    }
    sort(burstTime.begin(),burstTime.end());

    waiting[0]=0;

    for (int i=0;i<n;i++){
        if (i){
            waiting[i]=waiting[i-1]+burstTime[i-1].first;
        }
        turnaround[i]=burstTime[i].first+waiting[i];
    }

    for (int i=0;i<n;i++){
        totalWaitingTime+=waiting[i];
        totalTurnATime+=turnaround[i];
        cout<<" p"<<burstTime[i].second<<"\t\t"<<burstTime[i].first<<"\t\t"<<waiting[i]<<"\t\t"<<turnaround[i]<<endl;;
    }
    float avgTime = totalWaitingTime/(float)n;
    float avgTAT = totalTurnATime/(float)n;

    cout<<"Average Time: "<<avgTime<<endl;
    cout<<"Average Turn around time: "<<avgTAT<<endl;




    for (int i=0;i<n;i++)
        printf("----------------");
    printf("\n");

    for (int i=0;i<n;i++)
        printf("|\tP%d\t",burstTime[i].second);
    
    printf("|\n");
    for (int i=0;i<n;i++)
        printf("----------------");
    
    cout<<endl;
    printf("0\t");
    for(int i=0;i<n;i++){
        printf("\t%d\t",turnaround[i]);
    }
    cout<<endl;


}