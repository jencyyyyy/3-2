//   20 3          7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1  -> 15
//   12 3          2 3 2 1 5 2 4 5 3 2 5 2      ->9
//   13 4          7 0 1 2 0 3 0 4 2 3 0 3 2    ->7
#include <bits/stdc++.h>
using namespace std;

int fifo(int *pages,int n,int frame){
    set<int> s;
    queue<int> q;
    int first,pf = 0;
    for (int i=0;i<n;i++){
        if (s.size()<frame){
            if (s.find(pages[i]) == s.end()){  // not found
                pf++;
                s.insert(pages[i]);
                q.push(pages[i]);
            }

        }
        else{
            if (s.find(pages[i]) == s.end()){
                first = q.front();
                pf++;
                q.pop();
                s.erase(first);
                s.insert(pages[i]);
                q.push(pages[i]);
            }
        }
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
    pagefault = fifo(pages,n,frameNo);
    cout<<pagefault<<endl;

}



