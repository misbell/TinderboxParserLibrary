//
//  TinderboxIO.swift
//  TinderboxParser
//
//  Created by michael isbell on 8/5/19.
//  Copyright © 2019 michael isbell. All rights reserved.
//

import Foundation
import Cocoa

public struct TinderboxIO {
    
    var tbxfileURL: URL?
    var tbxItems: TbxItem?
    var xmlParser: XMLParserTbx?
    
    
    public init(tbxFileURL: URL?) {
        self.tbxfileURL = tbxFileURL
    }
    
    public mutating func loadTinderboxXmlDocument() {
        
        // print("well done tb")
        
        let openFileTypes = ["tbx"]
        
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = openFileTypes
        
        openPanel.directoryURL = self.tbxfileURL
        let _ = openPanel.urls
        let _ = openPanel.runModal()
        
        if let fileurl  = openPanel.url {
            
            self.tbxfileURL = fileurl
            
            if let xmlParserTbx = XMLParserTbx(contentPath: fileurl  ) {
                xmlParserTbx.parse()
                self.tbxItems = xmlParserTbx.tbxItems
                
            }
            else {
                
            }
            
        }
        
    }
    
    public func writeTinderboxXmlDocument() {
        
        
        if let xmlWriterTbx = XMLWriterTbx(tbxItem: self.tbxItems!) {
            xmlWriterTbx.print()
            
            
        }
        else {
            
        }
        
    }
}
