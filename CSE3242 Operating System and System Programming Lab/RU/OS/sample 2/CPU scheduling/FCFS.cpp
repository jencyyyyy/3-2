#include <bits/stdc++.h>
using namespace std;

void waitingT(int n,int *bt,int *wt){
    wt[0] = 0;
    for (int i=1;i<n;i++){
        wt[i]=wt[i-1]+ bt[i-1];
    }

}
void turnATime(int n,int *bt,int *wt,int *tat){
    for (int i=0;i<n;i++){
        tat[i]=wt[i]+ bt[i];
    }

}
void findavgTime(int n,int *bt){
    int wt[n],tat[n];
    float totalWaitingTime=0.0,totalTurnATime=0.0;
    waitingT(n,bt,wt);
    turnATime(n,bt,wt,tat);

    cout<<"Processes    "<<"Burst Time  "<<"Waiting time    "<<"Turn around time"<<endl;

    for (int i=0;i<n;i++){
        totalWaitingTime+=wt[i];
        totalTurnATime+=tat[i];
        cout<<" p"<<i+1<<"\t\t"<<bt[i]<<"\t\t"<<wt[i]<<"\t\t"<<tat[i]<<endl;;
    }
    float avgTime = totalWaitingTime/(float)n;
    float avgTAT = totalTurnATime/(float)n;


    cout<<"Average Time: "<<avgTime<<endl;
    cout<<"Average Turn around time: "<<avgTAT<<endl;


    for (int i=0;i<n;i++)
        printf("----------------");
    printf("\n");

    for (int i=0;i<n;i++)
        printf("|\tP%d\t",i+1);
    
    printf("|\n");
    for (int i=0;i<n;i++)
        printf("----------------");
    
    cout<<endl;
    printf("0\t");
    for(int i=0;i<n;i++){
        printf("\t%d\t",tat[i]);
    }
    cout<<endl;

}

int main(){
    freopen("inputFCFS.txt", "r", stdin);
    freopen("outputFCFS.txt", "w", stdout);
    int n;
    cin>>n;
    int process[n];
    int burstT[n];
    for (int i=0;i<n;i++){
        cin>>process[i];
        cin>>burstT[i];
    }
    findavgTime(n, burstT);
}