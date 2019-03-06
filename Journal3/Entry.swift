//
//  Entry.swift
//  Journal3
//
//  Created by Kenny Peterson on 5/25/17.
//  Copyright © 2017 Kenny Peterson. All rights reserved.
//

import Foundation

class Entry {
    
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    let timestamp: Int
    var title: String
    var bodyText: String
    
    init(timestamp: Int = 15, title: String, bodyText: String) {
        
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
        
    }
    
    init?(dictionary: [String: Any]) {
        
        guard let timestamp = dictionary[timestampKey] as? Int,
        let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else { return nil }
        
        self.timestamp = timestamp
        self.bodyText = bodyText
        self.title = title
        
    }
    
    var dictionaryRepresentation: [String: Any] {
        
        let journalDictionary: [String: Any] = [timestampKey: timestamp, titleKey: title, bodyTextKey: bodyText]
        
        return journalDictionary
        
    }
    
}

extension Entry: Equatable {
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        
        return lhs.timestamp == rhs.timestamp
        && lhs.bodyText == rhs.bodyText
        && lhs.title == rhs.title
        
    }
    
}
