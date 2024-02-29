//   20 3          7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1  -> hit:11 miss:9
//   12 3          2 3 2 1 5 2 4 5 3 2 5 2      ->hit:6 miss:6
//   13 4          7 0 1 2 0 3 0 4 2 3 0 3 2    ->hit:7 miss/page-fault:6



#include <bits/stdc++.h>
using namespace std;


int findPos(int *pages,vector<int> &ff,int n,int loc){
    int next = loc;
    int pos = -1;
    for (int i=0;i<ff.size();i++){
        int j;
        for (j=loc;j<n;j++){
            if (ff[i] == pages[j]){
                if (j>next){
                    next = j;
                    pos = i;
                }
                break;
            }
        }
        // if the page is never referenced in future then replace it
        if (j == n) return i;

    }
    if (pos == -1 )return 0;
    return pos;
}

bool searchPages(int page,vector<int> &ff){
    for (int i=0;i<ff.size();i++){
        if (ff[i] == page)
            return true;
    }
        return false;
}




void optimal(int *pages,int n,int frame){
    int pf=0,hit=0;
    vector <int> ff;

    //finding number of hits
    for (int i=0;i<n;i++){
        if (searchPages(pages[i],ff)){
            hit++;
            continue;
        }
        //  not found
        //  free space in frame then push it to thr frame
        if (ff.size()<frame){
            ff.push_back(pages[i]);
        }
        // no available space in frame ,find the page that will not be used for longest period of time and replace it
        else{
            int pos = findPos(pages,ff,n,i+1);
            ff[pos] = pages[i];

        }
    }
    cout<<"The number of hit: "<<hit<<endl;

    cout<<"The number of miss(page-fault): "<<n-hit<<endl;

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
    optimal(pages,n,frameNo);
}




