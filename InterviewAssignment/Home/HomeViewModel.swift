//
//  HomeHelper.swift
//  InterviewAssignment
//
//  Created by MRM on 20/11/23.
//

import Foundation

class HomeViewModel:ObservableObject{
    let jsonManager = JsonManager()
    @Published var exploreCourses:ExploreCourseModel?
    @Published var featuredCourses:FeaturedCourseModel?
    
    
    
    func fetchData(){
        getExporeCourses()
        getFeaturedCourses()
    }
    
    func getExporeCourses(){
        jsonManager.fetch(type: ExploreCourseModel.self, fileName: "ExploreCourses", FileExtension: "json"){ result in
            switch result {
            case .success(let data):
                self.exploreCourses = data
            case .failure(let err):
                print(err)
            }
        }
    }
    func getFeaturedCourses(){
        jsonManager.fetch(type: FeaturedCourseModel.self, fileName: "FeaturedCourses", FileExtension: "json"){ result in
            switch result {
            case .success(let data):
                self.featuredCourses = data
            case .failure(let err):
                print(err)
            }
        }
    }
}
