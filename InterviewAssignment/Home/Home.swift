//
//  Home.swift
//  InterviewAssignment
//
//  Created by MRM on 20/11/23.
//

import SwiftUI
enum Sections: CaseIterable {
    case header
    case resume
    case exploreCourses
    case featuredCourses
}

struct Home: View {
   
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var navPath = NavigationPath()
    var sections: [Sections] = Sections.allCases
    @State private var isShowingAllCases = false
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: AllCourses(),isActive: $isShowingAllCases) {EmptyView()}
                ForEach(sections,id: \.self){ section in
                    switch section {
                    case .header:
                        Header()
                    case .resume:
                        Resume()
                    case .exploreCourses:
                        ExploreCourses(courses: homeViewModel.exploreCourses?.courses ?? [],onSelctingCourse:{ course in
                          isShowingAllCases = true
                        })
                    case .featuredCourses:
                        FeaturedCourses(courses: homeViewModel.featuredCourses?.courses ?? [])
                    }
                }
            }.task {
                homeViewModel.fetchData()
            }
        }
    }
}



struct Header: View {
    var body : some View {
        ZStack(alignment:.top) {
            Image("HomeBG")
                .resizable()
            
            VStack {
                HStack{
                    VStack(alignment: .leading){
                        Text("Hi Mithun!")
                            .font(.system(size: 16,weight: .semibold))
                        
                        Text("Let's learn something new Today")
                            .font(.system(size: 12,weight: .regular))
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button {
                        print("Clicked")
                    }label: {
                        Image("bellIcon")
                    }
                }.padding()
                
                Image("callNow")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
            }
        }
    }
}


struct Resume: View {
    var body: some View {
        Section(){
            HStack {
                VStack(alignment: .leading){
                    Text("Z Transform using EQN I")
                        .font(.system(size: 14,weight: .semibold))
                        .padding(.vertical,2)
                    Text("Digital Signal Processing")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundColor(.secondary)
                        .padding(.vertical,2)
                    Text("9mins left")
                        .font(.system(size: 12,weight: .semibold))
                        .foregroundColor(Color("Orange"))
                        .padding(.vertical,2)
                    
                }
                .padding(.leading)
                Spacer()
                Image("ResumeImage")
            }
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 6)
            .padding(.horizontal)
            .padding(.vertical,5)
        }
    header: {
        HStack{
            Text("Resume Where You left")
                .font(.system(size: 12,weight: .regular))
                .foregroundColor(.secondary)
                .padding(.vertical,2)
            Spacer()
        }.padding(.leading)
    }
    }
}


struct ExploreCourses: View {
    
    var courses:[ExploreCourse] = []
    let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    var onSelctingCourse:((_ course:ExploreCourse)->Void)
    
    var body: some View{
        Section {
            LazyVGrid(columns: adaptiveColumn, alignment: .leading,spacing: 5){
                ForEach(courses,id: \.id) { course in
                    CoursesCard(course: course)
                        .onTapGesture {
                            onSelctingCourse(course)
                        }
                }.padding()
            }
        }
    header: {
        HStack{
            Text("Explore Courses")
            
                .font(.system(size: 16,weight: .bold))
                .padding(.vertical,2)
            Spacer()
        }.padding(.leading)
    }
    }
}

struct CoursesCard:View{
    var course:ExploreCourse
    var body: some View {
        VStack{
            HStack{
                Image("\(course.image)")
                Text("\(course.name)")
                    .font(.system(size: 16,weight: .bold))
                    .foregroundColor(Color("DarkBlueText"))
                
            }
            HStack(){
                Image("people")
                    .resizable()
                    .frame(width: 8,height: 8)
                Text("\(course.enrolled.formatted())K enrolled")
                    .font(.system(size: 10,weight: .regular))
                    .foregroundColor(Color("LightBlueText"))
            }
        }.frame(minWidth: 160 ,minHeight: 90)
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 6)
    }
}

struct FeaturedCourses:View {
    let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    var courses:[FeaturedCourse] = []
    var body: some View{
        Section {
            LazyVGrid(columns: adaptiveColumn, alignment: .leading,spacing: 5){
                ForEach(courses,id: \.id) { course in
                    FeaturedCourseCard(course: course)
                }.padding()
            }
        }
    header: {
        HStack{
            Text("Featured Courses")
                .font(.system(size: 16,weight: .bold))
                .padding(.vertical,2)
            Spacer()
        }.padding(.leading)
    }
    }
}


struct FeaturedCourseCard:View {
    var course:FeaturedCourse
    var body: some View{
        VStack(alignment:.leading){
            Image(course.image)
                .resizable()
                .frame(height: 160)
                .cornerRadius(8)
            
            Text(course.major)
                .font(.system(size: 14,weight: .regular))
                .foregroundColor(.secondary)
                .padding(.bottom,2)
            Text(course.name)
                .font(.system(size: 16,weight: .bold))
                .padding(.bottom,2)
            Text(course.discription)
                .font(.system(size: 12,weight: .regular))
                .foregroundColor(.secondary)
                .padding(.bottom,2)
            Text("\(course.price)")
                .font(.system(size: 14,weight: .bold))
                .padding(.bottom,2)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
