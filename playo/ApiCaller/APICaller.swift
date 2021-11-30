//
//  APICaller.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import Foundation
import Alamofire

struct APICaller{
    public static let shared = APICaller()
    
    private let APIKey = "cb416a6ae8024abf960c61e94b48d90c"
    public static let BaseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(APICaller.shared.APIKey)"
    
    public func GetMasterData(sucess:@escaping (DataMaster)->Void,failure:@escaping (Bool)->()){
        AF.request("\(APICaller.BaseUrl)", method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    switch response.result {

                    case .success( _):
                        do {
                            let result = try JSONDecoder().decode(DataMaster.self, from: response.data!)
                            print(result)
                            sucess(result)
  
                        } catch let error as NSError {
                            print("Failed to load: \(error)")
                            failure(true)
                        }
                    case .failure(let error):
                        failure(true)
                        print(error)
                    }
            }
    }
    
}
