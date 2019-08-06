
//
//  TbxItem.swift
//  Tinderbox-Aeon-Exchange
//
//  Created by prenez on 6/27/15.
//  Copyright © 2015 Michael Prenez-Isbell. All rights reserved.
//

import Foundation


class TbxItem {
    
    var name : String
    var value: String
//    var ID: String
//    var isPrototype: Bool
//    var aliasID:String
//    var nextNull: Bool
//    var hasNoteDescendants: Bool
//    var hasNoteSiblings: Bool
//    var parent : TbxItem?
    
    var children: Array<TbxItem>
    
    
    
    //default
        init () {
            
            self.name = ""
            self.value = ""
//            self.ID = ""
//            self.isPrototype = false
//            self.aliasID = ""
//            self.nextNull = true
//            self.hasNoteDescendants = false
//            self.hasNoteSiblings = false
//            self.parent = nil
            self.children = []
            

      }
    
    //designated
    init(name: String, value: String, children: Array<TbxItem>) {
        
        
        self.name = name
        self.value = value
        self.children = []
        
    }
    
    //convenience
    // convenience init (aname: String) {
        
    //    self.init(name: aname, age: 25, children: [])
        
        
   // }
    
    func addChild(item: TbxItem) -> (Void) {
        
        children.append(item)
        
    }
    
    func hasChildren() -> Bool {
        return self.children.count != 0
    }
}



/*
public class TbxItem : NSObject
{
public string Name { get; set; }
public string Text {get; set; }
public string ID { get; set; }
public bool IsPrototype { get; set;}
public string AliasID { get; set; }
public bool NextNull {get;set;}
public bool HasNoteDescendants { get; set;}
public bool HasNoteSiblings { get; set;}
public TbxItem Parent { get; set; }


public TbxItem () {
this.Name = String.Empty;
this.Text = string.Empty;
this.ID = string.Empty;
this.AliasID = string.Empty;
this.IsPrototype = false;
this.NextNull = false;
}

public IList<TbxItem> Children
{
get { return this.children; }
set { this.children = value; }
}
protected IList<TbxItem> children = new List<TbxItem>();

public bool HasChildren
{
get { return (this.children.Count > 0); }
}

public override string ToString ()
{
return this.Name.ToString ();
}
}
*/
