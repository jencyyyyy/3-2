#include <bits/stdc++.h>
using namespace std;

int main(){
    freopen("BestFit.txt","r",stdin);

    int n,m,proc,fs,req;
    vector <pair<int,int >> p;
    vector <pair<int,int> > blockNo;
    vector<pair<int,int> > freeSpace;

    cin>>n;
    for (int i=0;i<n;i++){
        cin>>fs;
        freeSpace.push_back(make_pair(fs,i+1));
    }
    cin>>m;
    bool flag[m] ={false};

    for (int i=0;i<m;i++){
        cin>>proc>>req;
        p.push_back(make_pair(req,proc));
    }
    sort(freeSpace.begin(),freeSpace.end());


    for (int i=0;i<m;i++){
        cout<<p[i].first<<" "<<p[i].second<<endl;
    }

    for (int i=0;i<m;i++){
            for (int j=0;j<n;j++){
                if (flag[i]){
                        break;
                }
                if (p[i].first<=freeSpace[j].first){
                    blockNo.push_back(make_pair(p[i].second,freeSpace[j].second));
                    freeSpace[j].first-=p[i].first;
                    flag[i] = true;
                }

            }
            if (!flag[i]){
                 blockNo.push_back(make_pair(p[i].second,-1));
            }
    }

    cout<<"Process      BlockNo"<<endl;

    for (int i=0;i<blockNo.size();i++){
        cout<<blockNo[i].first<<"               "<<blockNo[i].second<<endl;
    }
    cout<<endl;
}

