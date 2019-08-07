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

        Swift.print(tbxItem.name)
        Swift.print(tbxItem.value)
        
        write(tbxItems: tbxItem.children)
        
        }

    
    
    fileprivate func write(tbxItems: [TbxItem]) {
        for child in tbxItems {
             Swift.print(child.name)
             Swift.print(child.value)
             
             
            write(tbxItems: child.children)
        }
        
    }

}
