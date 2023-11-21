//
//  AllCoursesViewModel.swift
//  InterviewAssignment
//
//  Created by MRM on 21/11/23.
//

import Foundation


class AllCoursesViewModle:ObservableObject {
    let networkManager = NetworkManager()
    @Published var showingBranches:[Branch] = []
    @Published var allCourses:AllCourseModel?
    
    
    func getAllCourses(){
        guard let url = URL(string: "https://api.msigma.in/btech/v2/branches") else {
            return
        }
        networkManager.fetchRequest(type: AllCourseModel.self, url: url){ result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.allCourses = data
                    self.showingBranches = self.allCourses?.branches ?? []
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func filterBranches(seachText: String){
        guard let allCourses = allCourses else{
            return
        }
        
        self.showingBranches =  allCourses.branches.filter({$0.short.lowercased().hasPrefix(seachText.lowercased()) || $0.name.lowercased().hasPrefix(seachText.lowercased())})
        
    }
}
