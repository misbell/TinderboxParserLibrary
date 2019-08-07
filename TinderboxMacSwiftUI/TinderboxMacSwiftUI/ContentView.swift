//
//  ContentView.swift
//  TinderboxMacSwiftUI
//
//  Created by michael isbell on 8/6/19.
//  Copyright © 2019 Writerly Gizmos. All rights reserved.
//

import SwiftUI
import TbxParserFrwUtils



struct ContentView: View {
    
    @State private var io : TinderboxIO? = nil
    @State private var fullName: String = "/Users/michaelisbell/Dropbox/___tbx/" //create State
    

    var body: some View {
        VStack {
            Spacer()

            TextField("directory for Tinderbox files", text: $fullName) // passing it to bind
            
                .textFieldStyle(RoundedBorderTextFieldStyle()) // adds border
                .frame(width: 300.0, height: 100.0, alignment: .center)
            
            // Spacer()
            Button(
                action: {
                    self.io = TinderboxIO(tbxFileURL: URL(fileURLWithPath: self.fullName ,isDirectory: false) )
                    self.io?.loadTinderboxXmlDocument()
            },
                label: { Text("Load Tindexbox Notes") }
            )
                .frame(minWidth: 200.0, idealWidth: 350.0, maxWidth: .infinity, minHeight: 200.0, idealHeight: 250.0, maxHeight: .infinity, alignment: .center)
            Spacer()
            
            Button(
                    action: {
                        self.io?.writeTinderboxXmlDocument()
                },
                    label: { Text("Print Tindexbox Notes") }
                )
                    .frame(minWidth: 200.0, idealWidth: 350.0, maxWidth: .infinity, minHeight: 200.0, idealHeight: 250.0, maxHeight: .infinity, alignment: .center)
        }
        
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
