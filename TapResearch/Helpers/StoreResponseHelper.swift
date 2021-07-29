//
//  StoreResponseHelper.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import Foundation

struct StoreResponseHelper {
    
    static func storePayload(_ response: Response) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(response)
            UserDefaults.standard.set(data, forKey: "payload")
        } catch {
            print("didn't save")
        }
    }
    
    static func retreivePayload() -> Response? {
        if let response = UserDefaults.standard.data(forKey: "payload") {
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from:  response)
                return response
            } catch {
                print("error decoding")
                return nil
            }
        }
        
        return nil
    }
}
