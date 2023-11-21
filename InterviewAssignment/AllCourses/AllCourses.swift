//
//  AllCourses.swift
//  InterviewAssignment
//
//  Created by MRM on 21/11/23.
//

import SwiftUI

struct AllCourses: View {
    let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    @ObservedObject var allCoursesViewModel = AllCoursesViewModle()
    
    @State var searchText:String = ""
    var body: some View {
        ScrollView{
            ZStack(alignment: .top){
                
                Image("AllCourseBG")
                    .resizable()
                    .scaledToFit()
                VStack(alignment:.leading){
                    
                    Text("All Your Branches")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.top,20)
                    Text("Find your Branch")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundColor(.white)
                        .padding([.leading,.bottom])
                        .padding(.top,3)
                    Section{
                        HStack{
                            Image("search")
                                .tint(Color("LightBlueText"))
                                .onTapGesture {
                                 print(searchText)
                                    allCoursesViewModel.filterBranches(seachText: searchText)
                                }
                            TextField("Find Your Branch", text: $searchText,
                                      
                            onCommit: {
                                allCoursesViewModel.filterBranches(seachText: searchText)
                            })
                                
                              
                                
                            
                        }.padding()
                    }.background(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .padding(.vertical,30)
                    
                   
                  
                       
                    LazyVGrid(columns: adaptiveColumn, alignment: .leading,spacing: 5){
                        ForEach(allCoursesViewModel.showingBranches,id: \.id) { branch in
                            BranchCard(branch: branch)
                        }.padding()
                    }
                  
                }
            }
        }.task {
            allCoursesViewModel.getAllCourses()
        }
    }
}

struct AllCourses_Previews: PreviewProvider {
    static var previews: some View {
        AllCourses()
    }
}


struct BranchCard:View{
    var branch:Branch
    var body: some View {
        VStack{
            HStack{
                Image("btech")
                Text("\(branch.short)")
                    .font(.system(size: 16,weight: .bold))
                    .foregroundColor(Color("DarkBlueText"))
                
            }
            HStack(){
             
                Text("\(branch.name)")
                    .font(.system(size: 10,weight: .regular))
                    .foregroundColor(Color("LightBlueText"))
                    .multilineTextAlignment(.center)
                
            }
        }.frame(minWidth: 160 ,minHeight: 90)
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 6)
            .padding()
    }
}
