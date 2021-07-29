//
//  NetworkManager.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import Foundation
import Alamofire

class NetworkManager {
    private let urlString = "https://www.tapresearch.com/supply_api/surveys/offer"
    
    func makeRequest(completion: @escaping (Response?, Error?)-> Void) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let params: Parameters = [
            "device_identifier": UIDevice.current.identifierForVendor!.uuidString,
            "api_token": "f47e5ce81688efee79df771e9f9e9994",
            "user_identifier": "codetest123"
        ]
        
        AF.request(urlString, method: .post, parameters: params, headers: headers).responseDecodable(of: Response.self) { response in
            guard let surveyResponse = response.value else {
                completion(nil, response.error)
                return
            }
            completion(surveyResponse, nil)
        }
    }
}
