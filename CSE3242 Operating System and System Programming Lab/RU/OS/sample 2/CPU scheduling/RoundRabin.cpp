#include <bits/stdc++.h>
using namespace std;


int main(){
    int n,quantum;
    float totalWaitingTime=0.0,totalTurnATime=0.0;
    int temp =0 ;
    int time=0;
    cin>>n>>quantum;

    vector <int> waiting(n),turnaround(n);
    vector <int> burst(n),left(n);
    vector <int> v,v2;

    v2.push_back(0);

    for (int i=0;i<n;i++){
        cin>>burst[i];
        left[i] = burst[i];
    }
    for (int i=0;true;i++){
        i%=n;
        if (left[i]){ 
            temp = quantum;
            if (left[i]<=quantum){
                temp = left[i];
                turnaround[i] = time + temp;
            }
            left[i]-=temp;
            time+=temp;
            int sum=0;
            int l = left.size();
            for (int j=0;j<l;j++){
                sum+=left[j];
            }
            v.push_back(i+1);
            v2.push_back(time);
            if (sum==0)
                break;
        }
    }

    for (int i=0;i<n;i++){
        waiting[i] = turnaround[i] - burst[i];
    }

    for (int i=0;i<n;i++){
        totalWaitingTime+=waiting[i];
        totalTurnATime+=turnaround[i];
    }
    cout<<endl;

    float avgTime = totalWaitingTime/(float)n;
    float avgTAT = totalTurnATime/(float)n;
    int len1 = v.size();
    int len2 = v2.size();
    for (int i=0; i<len1;i++){
         printf("----------------");
    }
    cout<<endl;
    //cout<<"|";
    for (int i=0;i<len1;i++){
        printf("|\tP%d\t",v[i]);
    }
    cout<<"|"<<endl;
    for (int i=0;i<len1;i++){
         printf("----------------");
    }
    cout<<endl;
    cout<<v2[0];
    for (int i=1;i<len2;i++){
        printf("\t\t%d",v2[i]);
    }
    cout<<endl;

    cout<<"Average Time: "<<avgTime<<endl;
    cout<<"Average Turn around time: "<<avgTAT<<endl;
}