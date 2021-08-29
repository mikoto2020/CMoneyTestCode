//
//  ApiModel.swift
//  CMoneyTestCode
//
//  Created by Jeanne on 2021/8/28.
//

import Foundation

struct ApiModel: Codable {
    var description: String
    var copyright: String
    var title: String
    var url: String
    var apod_site: String
    var date: String
    var media_type: String
    var hdurl: String
    
    enum CodingKeys : String, CodingKey {
        case description
        case copyright
        case title
        case url
        case apod_site
        case date
        case media_type
        case hdurl
    }
}
