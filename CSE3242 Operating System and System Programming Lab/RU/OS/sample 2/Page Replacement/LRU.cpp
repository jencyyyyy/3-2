//   20 3          7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1  -> 12
//   12 3          2 3 2 1 5 2 4 5 3 2 5 2      ->7
//   13 4          7 0 1 2 0 3 0 4 2 3 0 3 2    ->page-fault:6



#include <bits/stdc++.h>
using namespace std;

int optimal(int *pages,int n,int frame){
    set<int> s;
    map<int,int> pos;


    int pf = 0;
    for (int i=0;i<n;i++){
        if (s.size()<frame){
            if (s.find(pages[i]) == s.end()){
                s.insert(pages[i]);
                pf++;
            }
        }
        else{
            if (s.find(pages[i]) == s.end()){
                int prev = INT_MAX,loc;
                set<int>::iterator j;
                // finding the least recently used pages that is already in the set
                for (j=s.begin();j!=s.end();j++){
                    if (pos[*j]<prev){
                        prev = pos[*j];
                        loc = *j;
                    }
                }
                pf++;
                s.erase(loc);
                s.insert(pages[i]);

            }
        }
        //   storing the recently used pos of each page
        pos[pages[i]] = i;
    }
    return pf;
}

int main(){
    int n,frameNo,pagefault;
    cout<<"Enter the length of reference string and frame no: "<<endl;
    cin>>n>>frameNo;
    int pages[n];
    cout<<"Enter the reference string: "<<endl;
    for (int i=0;i<n;i++){
        cin>>pages[i];
    }
    pagefault=optimal(pages,n,frameNo);
    cout<<"page-fault: "<<pagefault<<endl;
}




