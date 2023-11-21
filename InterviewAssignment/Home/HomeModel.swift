//
//  Model.swift
//  InterviewAssignment
//
//  Created by MRM on 20/11/23.
//

import Foundation


struct ExploreCourse:Codable,Hashable {
    var id:Int
    var name:String
    var image:String
    var enrolled:Double
}
struct ExploreCourseModel:Codable,Hashable {
    var courses:[ExploreCourse]
}


struct FeaturedCourse:Codable {
    var id:Int
    var name:String
    var major:String
    var image:String
    var discription:String
    var price:Int
}
struct FeaturedCourseModel:Codable {
    var courses:[FeaturedCourse]
    
}
