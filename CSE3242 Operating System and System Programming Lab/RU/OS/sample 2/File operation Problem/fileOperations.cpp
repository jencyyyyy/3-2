#include <bits/stdc++.h>
using namespace std;

int main(){
    string operation;
    cin>>operation;
    cin.ignore();

    if (operation == "Create"){
        string name;
        getline(cin, name);
        ofstream file(name.c_str());


        time_t timeNow = chrono::system_clock::to_time_t(chrono::system_clock::now());








        
        //time_t timeNow = chrono::system_clock::to_time_t(chrono::system_clock::now());
        file<<"This is a newly created file" <<ctime(&timeNow)<<"\n";

        //newFile << "File has created\nTime: " << ctime(&timeNow) << endl;


        file.close();
    }
    else if (operation == "Rename"){
        string oldname,newname;
        getline(cin, oldname);
        getline(cin, newname);
        int check = rename(oldname.c_str(),newname.c_str());
        if (check == 0){
            cout<<"File renamed successfully";
        }
        else{
            cout<<"Error renaming file";
        }
    }
    else if (operation == "Delete"){
        string name;
        getline(cin,name);
        int check = remove(name.c_str());
        if (check == 0){
            cout<<"File deleted successfully";
        }
        else{
            cout<<"Error deleting file";
        }
    }
    else if (operation == "Copy"){
        string oldname,newname;
        getline(cin,oldname);
        getline(cin,newname);
        ifstream source(oldname.c_str());
        ofstream dest(newname.c_str());

        // ifstream source("input.txt");
        // ofstream dest("newCopy.txt");
        string read;
        if (source.is_open()){
            while(getline(source, read)){ 
            // source.getline(read);
                dest<<read<<"\n";
            }
        cout<<"File copied successfully";
        source.close();
        }
        else cout<<"Error !"<<endl;
        dest.close();

    }
    else if (operation == "Move"){
        string oldname,newname;
        getline(cin,oldname);
        getline(cin,newname);
        ifstream source(oldname.c_str(),ios::binary);
        ofstream dest(newname.c_str());

        string read;
        if (source.is_open() && dest.is_open()){
            while (getline(source, read)){
                dest<<read;
            }
            remove(oldname.c_str());
            cout<<"File moved successfully";
        }
        else{
            cout<<"Error moving file";
        }

    }
    else cout<<"Invalid operation";
}