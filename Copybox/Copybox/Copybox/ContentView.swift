//
//  ContentView.swift
//  Copybox
//
//  Created by Placidity on 2025-08-24.
//

import SwiftUI

struct ContentView: View {
    @State var copyField = ""
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "command.square.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    Text("Copybox")
                        .font(.largeTitle)
                }
                
            }
            
            Text("Type anything, after that click Copy.\n")
                .font(.subheadline)
            
            TextField("", text: $copyField)
                .frame(width: 300)
            
            HStack {
                Spacer()
                
                Button("Copy") {
                    let pasteboard = NSPasteboard.general
                    pasteboard.clearContents()
                    pasteboard.setString(copyField, forType: .string)
                }
                
                Button("Paste") {
                    let pasteboard = NSPasteboard.general
                    if let pasted = pasteboard.string(forType: .string) {
                        copyField = pasted
                    }
                }
                
                Button("Exit") {
                    NSApplication.shared.terminate(nil)
                }
                .foregroundColor(.red)
                
            }
            
            Spacer()
            Text("(C) Pointless Suite 2025")
        }
        .padding(.top, 10)
        .padding()
        .frame(maxWidth: 330, maxHeight: 210)
    }
}

#Preview {
    ContentView()
}
