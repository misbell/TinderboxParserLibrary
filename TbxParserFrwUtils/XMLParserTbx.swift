//
//  XMLParserTbx.swift
//  Tinderbox-Aeon-Exchange
//
//  Created by prenez on 6/28/15.
//  Copyright © 2015 Michael Prenez-Isbell. All rights reserved.
//

import Foundation
import AppKit
import Cocoa
import AEXML

public class XMLParserTbx   {
    
    
    
   fileprivate var path: String
   fileprivate var data: Data
   fileprivate var items: [TbxItem]?
    
    // this should be a property
    public var tbxItems : TbxItem = TbxItem()
    
    
    var itemIDNumbers : [Int] = []
 
    
    
    public  init?(contentPath: URL) {
        
        self.path = contentPath.path
        self.data = FileManager.default.contents(atPath: path)!
    
        
        
    }
    

    func getChildren(parentItem: TbxItem, element : AEXMLElement) {
        var currentItem = TbxItem()
        for child in element.children {
            
            if let _ = child.value {
           //      print("\(child.name) and \(child.value!)")
                currentItem = TbxItem(name: child.name, value: child.value!, type: .element, children: [])
                parentItem.addChild(item: currentItem)
            }
            else {
               // print("\(child.name) and NO VALUE  )")
                currentItem = TbxItem(name: child.name, value: "", type: .element, children: [])
                parentItem.addChild(item: currentItem)
                
                
            }
            
            for attribute in child.attributes {
                if currentItem.name == "item" {
                    if attribute.0 == "ID" {

                        let x = Int(attribute.1 )
                        self.itemIDNumbers.append(x!)
                    }
                }
                
                currentItem.addChild(item: TbxItem(name: attribute.0 as! String, value: attribute.1 as! String, type: .attribute, children: [])) // this could break
            }
            getChildren(parentItem: currentItem, element: child)
        }
    }
    
   public func parse() {
        
//        do {
//            let x = try AEXMLDocument(xml: self.data)
//        } catch {
//            print("\(error)")
//        }
//
        
        
        do {
            let xmlDoc = try AEXMLDocument(xml: self.data)
            
            
            // might want to structure it
            // parse items
            // parse colors
            // parse etc
            // all the top level stuff
            // also think about making an array for each of the top level elements,
            // the easier to make key value lists with later
            
            // var firstelement = xmlDoc.root["item"]
            // print (xmlDoc.root[xmldoc "item"].stringValue)
            
            // var firstitem =  xmlDoc.root["attrib"].countWithAttributes(["Name" : "Item"])
            
            // xmlDoc.root["attrib"].countWithAttributes(["Name" : "Item"])
            
            // this parses every element in the document
            // this is where i build my array
            
            
            var currentItem = TbxItem(name: (xmlDoc.root.first?.name)!, value: "", type: .element, children: [])
            self.tbxItems = currentItem
            for attribute in xmlDoc.root.attributes {
                currentItem.addChild(item: TbxItem(name: attribute.0 , value: attribute.1 , type: XmlType.attribute, children: [])) // this could break
            }
            
            // top level below root elements handled here, and their attributes
            // then get children gets the child elements of each root child
            // recursively
            for child in xmlDoc.root.children {
                if let _ = child.value {
                    //   print("\(child.name) and \(child.value!)")
                    currentItem = TbxItem(name: child.name, value: child.value!, type: .element, children: [])
                    self.tbxItems.addChild(item: currentItem)
                }
                else {
                    //print("\(child.name) and NO VALUE NO VALUE NO VALUE )")
                    currentItem = TbxItem(name: child.name, value: "", type: .element, children: [])
                    self.tbxItems.addChild(item: currentItem)
                }
                
                for attribute in child.attributes {
                    
                    if currentItem.name == "item" {
                        if attribute.0 == "ID" {
                            
                            let x = Int(attribute.1 as! String)
                            self.itemIDNumbers.append(x!)
                        }
                    }
                    
                    currentItem.addChild(item: TbxItem(name: attribute.0 as! String, value: attribute.1 as! String, type: .attribute, children: [])) // this could break
                    
                }
                
                getChildren(parentItem: currentItem, element: child)
            }
            
            
            
            let sortedItemIDNumbers =  itemIDNumbers.sorted()
            let lowest = sortedItemIDNumbers.first
    
            
            
            
            // make accessible to outlineview
            self.items?.append(tbxItems)
            
            
            
  
            
        }
        catch {
            print("\(error)")
        }
        
        
    }
}





