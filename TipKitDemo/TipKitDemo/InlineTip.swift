//
//  InlineTip.swift
//  TipKitDemo
//
//  Created by abdul karim on 01/11/23.
//

import SwiftUI
import TipKit

struct InlineTipView: Tip {
    
    @Parameter
    static var hasViewedInlineTip: Bool = false
    
    var title: Text {
        Text("Bone fire madness")
    }
    
    var message: Text? {
        Text("A bone fire is a fire lit with bones instead of wood. ")
    }
    
    var image: Image? {
            Image("inline.tip.image")
    }
    
    var actions: [Action] {
        [
            Tip.Action(
                id: "action",
                title: "Learn More",
                perform: executeAction
            )
        ]
    }
    
    @Sendable
    func executeAction() {
        
    }
    
    
    var rules: [Rule] {
           #Rule(Self.$hasViewedInlineTip) { $0 == true }
    }
}



struct InlineTip: View {
    private let inlineTipView = InlineTipView()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TipView(inlineTipView)
            .padding()
    }
}

#Preview {
    InlineTip()
        .task {
            try? Tips.resetDatastore()
 
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
