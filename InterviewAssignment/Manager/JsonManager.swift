//
//  File.swift
//  InterviewAssignment
//
//  Created by MRM on 20/11/23.
//

import Foundation

class JsonManager {
    let responseHandre = ResponnseHandler()
    func fetch<T:Codable>(type:T.Type, fileName:String,FileExtension:String,complition:@escaping(Result<T,fetchError>)->Void){
        guard let url = Bundle.main.url(forResource: fileName, withExtension:FileExtension) else {
            return complition(.failure(.badUrl))
        }
        do {
            let data = try Data(contentsOf: url)
            responseHandre.fetchModel(type: type, data: data, complition: complition)
        }catch {
            complition(.failure(.noData))
        }
    }
}
