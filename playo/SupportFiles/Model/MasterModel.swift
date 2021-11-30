//
//  MasterModel.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import Foundation

struct DataMaster:Codable
{
    
    var status:String?
    var totalResults:Int?
    var articles: [innerArticle]?
    
    struct innerArticle:Codable{
        var author:String?
        var description:String?
        var content:String?
        var title:String?
        var urlToImage:String?
        var url:String?
    }
}
