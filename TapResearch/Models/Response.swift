//
//  Response.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import Foundation

struct Response: Codable {
    var hasOffer: Bool
    var offerReason: Int
    var reasonComment: String
    var offerUrl: String
    var messageHash: MessageHash
    var abandonUrl: String
    
    enum CodingKeys: String, CodingKey {
        case hasOffer = "has_offer"
        case offerReason = "offer_reason"
        case reasonComment = "reason_comment"
        case offerUrl = "offer_url"
        case messageHash = "message_hash"
        case abandonUrl = "abandon_url"
    }
}

struct MessageHash: Codable {
    var min: String
    var max: String
    var currency: String
}
