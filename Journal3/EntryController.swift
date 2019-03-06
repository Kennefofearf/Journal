//
//  EntryController.swift
//  Journal3
//
//  Created by Kenny Peterson on 5/25/17.
//  Copyright © 2017 Kenny Peterson. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entry"
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    init() {
        
        loadToPersistentStorage()
        
    }
    
    func addEntryWith(title: String, text: String) {
        
        let entry = Entry(title: title, bodyText: text)
        
        entries.append(entry)
        
        saveToPersistentStorage()
        
    }
    
    func remove(entry: Entry) {
        
        for entry in entries {
            
            if entry == entry {
                
                remove(entry: entry)
                
            }
            
        }
        
    }
    
    func update(entry: Entry, title: String, text: String) {
        
        entry.title = title
        entry.bodyText = text
        
    }
    
    func saveToPersistentStorage() {
        
        var entryDictionary: [[String: Any]] = []
        
        for entry in entries {
            
            let dictionary = entry.dictionaryRepresentation
            
            entryDictionary.append(dictionary)
            
        }
        
        UserDefaults.standard.set(entryDictionary, forKey: entryKey)
        
    }
    
    func loadToPersistentStorage() {
        
        if let entryDictionaries = UserDefaults.standard.object(forKey: entryKey) as? [[String: Any]] {
            
            var entries: [Entry] = []
            
            for entryDictionary in entryDictionaries {
                
                if let entry = Entry(dictionary: entryDictionary) {
                    
                    entries.append(entry)
                    
                }
                
            }
            
            self.entries = entries
            
        }
        
    }
    
}













