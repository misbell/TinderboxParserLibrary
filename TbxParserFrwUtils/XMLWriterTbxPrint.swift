//
//  XMLWriterTbxPrint.swift
//  TbxParserFrwUtils
//
//  Created by michael isbell on 8/6/19.
//  Copyright © 2019 michael isbell. All rights reserved.
//

import Foundation


public class XMLWriterTbx {
    
   fileprivate var tbxItem: TbxItem
    
    public init?(tbxItem: TbxItem) {

       self.tbxItem = tbxItem

    }

    public func print() {

        if tbxItem.type == .element {
            Swift.print(tbxItem.name)
           // Swift.print(tbxItem.value)
        }
        
        write(tbxItems: tbxItem.children)
        
        }

    
    
    fileprivate func write(tbxItems: [TbxItem]) {
        
        for child in tbxItems {
            
            if child.type == .element {
//                if child.name == "linkTypes" {
//
//                    Swift.print("\n ========= \n \(child.name) \n")
//                    writeSingleLevelChildElements(tbxItems: child.children)
//                }
//                if child.name == "colors" {
//                    Swift.print("\n ========= \n \(child.name) \n")
//                    writeSingleLevelChildElements(tbxItems: child.children)
//                }
//                if child.name == "links" {
//                    Swift.print("\n ========= \n \(child.name) \n")
//                    writeSingleLevelChildElements(tbxItems: child.children)
//                }
                if child.name == "item" {
                    Swift.print("\n ========= \n ITEM \(child.name) \n")
                    writeItems(tbxItems: child.children)
                }
//                if child.name == "attrib" {
//                    Swift.print("\n ========= \n \(child.name): \(child.value) \n")
//                    writeAttribs(tbxItems: child.children)
//                }
            }
            
        }
        
    }
    
    fileprivate func writeSingleLevelChildElements(tbxItems: [TbxItem]) {

        for child in tbxItems {
             Swift.print("\n -------- \n \(child.name) \n ")
             Swift.print(child.value)


            writeAttributes(tbxItems: child.children)
        }
    }
    
    fileprivate func writeItems(tbxItems: [TbxItem]) {

// attribute or item or adornment or rtfd or text
        
       for child in tbxItems {
          
          switch child.type {
              
          case .element:
            if child.name == "attribute" {
                
            }
            
            if child.name == "item" {
                
                    Swift.print("\n item \n ====== ")
                    Swift.print("\n -------- \n ITEM \(child.name): \(child.value) \n ")
                    writeItems(tbxItems: child.children)
            }
            
            if child.name == "adornment" {
                
                    Swift.print("\n adornment \n ====== ")
                    Swift.print("\n -------- \n ADORNMENT \(child.name): \(child.value) \n ")
                    writeItems(tbxItems: child.children)
            }
            
            if child.name == "agent" {
                    // make an agent and see how this works
                    Swift.print("\n agent \n ====== ")
                    Swift.print("\n -------- \n  \(child.name): \(child.value) \n ")
                    writeItems(tbxItems: child.children)
            }
            
            if child.name == "rtfd" {
                Swift.print("\n ===== \n FOUND AN RTFD \n ===== \n ")
            }
            
            if child.name == "image" {
                Swift.print("\n ===== \n FOUND AN IMAGE \n ===== \n ")
                
            }
            
            if child.name == "text" {
                Swift.print("\n text \n ====== ")
                Swift.print("\n -------- \n  TEXT!! : \(child.name): \(child.value) \n ")
            }
            
            

          case .attribute:
                Swift.print("\n -------- \n _attribute_ \(child.name): \(child.value) \n ")
          }
          

       }
   }
  
    
    fileprivate func writeAttribs(tbxItems: [TbxItem]) {

         for child in tbxItems {
            
            switch child.type {
                
            case .element:
                  Swift.print("\n attrib \n ====== ")
                  Swift.print("\n -------- \n  \(child.name): \(child.value) \n ")
                  writeAttribs(tbxItems: child.children)
            case .attribute:
                  Swift.print("\n -------- \n _attribute_ \(child.name): \(child.value) \n ")
            }
            

         }
     }
    
    
       fileprivate func writeAttributes(tbxItems: [TbxItem]) {
            
            for child in tbxItems {

                Swift.print("\(child.name): \(child.value)")
                
              write(tbxItems: child.children)
                
            }
    }
    
            

}
