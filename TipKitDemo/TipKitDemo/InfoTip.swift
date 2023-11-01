//
//  InfoTip.swift
//  TipKitDemo
//
//  Created by abdul karim on 01/11/23.
//

import SwiftUI
import TipKit

struct InfoTipView: Tip {
    
    var title: Text {
        Text("Halloween Events")
    }
    
    var message: Text? {
        Text("All Halloween Events Near by")
    }
    
    var image: Image? {
            Image("Info.tip.image")
    }
    
    @Parameter
    static var hasViewedInfoTip: Bool = false
    
    
    var rules: [Rule] {
           #Rule(Self.$hasViewedInfoTip) { $0 == true }
    }
}

struct InfoTip: View {
    private let infoTipView = InfoTipView()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .popoverTip(infoTipView, arrowEdge: .top)
    }
}

#Preview {
    InfoTip()
        .task {
            try? Tips.resetDatastore()
 
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
