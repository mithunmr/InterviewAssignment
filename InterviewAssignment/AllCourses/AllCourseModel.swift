//
//  model.swift
//  InterviewAssignment
//
//  Created by MRM on 21/11/23.
//

import Foundation

struct Branch: Codable {
    var id:Int
    var name:String
    var short:String
    
}

struct AllCourseModel: Codable {
    var status:String
    var branches:[Branch]
}

//{
//  "status": "success",
//  "branches": [
//    {
//      "id": 1,
//      "name": "Electronics and Communication Engineering",
//      "short": "ECE"
//    },
//    {
//      "id": 3,
//      "name": "Instrumentation Engineering",
//      "short": "EIE"
//    },
//    {
//      "id": 4,
//      "name": "Computer Science",
//      "short": "CSE"
//    },
//    {
//      "id": 5,
//      "name": "Applied Electronics & Instrumentation",
//      "short": "AEI"
//    },
//    {
//      "id": 6,
//      "name": "Biomedical Engineering",
//      "short": "BME"
//    },
//    {
//      "id": 7,
//      "name": "Mechanical Engineering",
//      "short": "ME"
//    },
//    {
//      "id": 2,
//      "name": "Electrical and Electronics Engineering",
//      "short": "EEE"
//    },
//    {
//      "id": 9,
//      "name": "Civil Engineering",
//      "short": "CE"
//    },
//    {
//      "id": 10,
//      "name": "First Year Common Subjects",
//      "short": "FY"
//    },
//    {
//      "id": 11,
//      "name": "Electronics & Biomedical Engineering",
//      "short": "EBME"
//    },
//    {
//      "id": 15,
//      "name": "ISRO- SC-ME( MECHANICAL ENGINEERING)",
//      "short": "ISRO- ME"
//    },
//    {
//      "id": 16,
//      "name": "ISRO -SC( ELECTRONICS/INSTRUMENTATION )",
//      "short": "ISRO-EC/IN"
//    },
//    {
//      "id": 17,
//      "name": "ISRO -SC( ELECTRICAL ENGINEERING )",
//      "short": "ISRO- EE"
//    },
//    {
//      "id": 12,
//      "name": "GATE - EC/EE/IN - MAY & AUG 2023 BATCH",
//      "short": "E-23-B1&B2"
//    },
//    {
//      "id": 13,
//      "name": "GATE - MECHANICAL - MAY & AUG 2023 BATCH",
//      "short": "M-23-B1&B2"
//    },
//    {
//      "id": 14,
//      "name": "GATE - CIVIL - MAY & AUG 2023 BATCH",
//      "short": "C-23-B1&B2"
//    },
//    {
//      "id": 8,
//      "name": "GATE-2022-BATCH",
//      "short": "E-2022"
//    },
//    {
//      "id": 19,
//      "name": "GATE - MECHANICAL -SEPT 2023 BATCH",
//      "short": "M-23-B3"
//    },
//    {
//      "id": 18,
//      "name": "GATE - EC/EE/IN - SEPT 2023 BATCH",
//      "short": "E-23-B3"
//    },
//    {
//      "id": 20,
//      "name": "GATE - CIVIL -SEPT 2023 BATCH",
//      "short": "C-23-B3"
//    }
//  ]
//}
