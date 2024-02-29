#include <bits/stdc++.h>
using namespace std;

int main(){
    freopen("safetyAlgoInput.txt","r",stdin);
    int n,m;
    cout<<"Enter the number of process"<<endl;
    cin>>n;
    cout<<"Enter the number of resourses"<<endl;
    cin>>m;

    int counter,marker,process[n],work[m],available[m];
    int maxi[n][m],allocation[n][m],need[n][m];
    bool finish[n] = {false};
    vector <int> seq;

    for (int i=0;i<n;i++){
            cin>>process[i];
        for (int j=0;j<m;j++){
            cin>>allocation[i][j];
        }
    }
    for (int i=0;i<n;i++){
        for (int j=0;j<m;j++){
            cin>>maxi[i][j];
            need[i][j] = maxi[i][j] - allocation[i][j];
        }
    }

    for (int i=0;i<m;i++){
            cin>>available[i];
            work[i] = available[i];
        }
    for (int i=0;i<n;i++){
        for (int j=0;j<m;j++){
            cout<<need[i][j]<<" ";
        }
        cout<<endl;
    }
    for (int it=0;it<n;it++){
        for (int i=0;i<n;i++){
            if (finish[i] == false){
                    marker = 0;
                for (int j=0;j<m;j++){
                    if (need[i][j]>work[j]){
                        marker = 1;
                        break;
                    }
                }
                if (!marker) {
                    finish[i] = true;
                    seq.push_back(i);
                    for (int it2=0;it2<m;it2++){
                        work[it2] = work[it2] + allocation[i][it2];
                    }
                }
            }
        }
    }
    counter = 1;
    for (int it2=0;it2<n;it2++){
        if (!finish[it2]){
            counter=0;
            break;
        }
    }
if (counter){
    cout<<"Safety sequence is there!"<<endl;
    for (int i=0;i<seq.size()-1;i++){
        cout<<"P"<<seq[i]<<"->";
    }
    cout<<"P"<<seq[n-1]<<endl;
}
else cout<<"No safe sequence among processes"<<endl;
}
