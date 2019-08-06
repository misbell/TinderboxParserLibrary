//
//  ContentView.swift
//  TinderboxMacSwiftUI
//
//  Created by michael isbell on 8/6/19.
//  Copyright © 2019 Writerly Gizmos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
