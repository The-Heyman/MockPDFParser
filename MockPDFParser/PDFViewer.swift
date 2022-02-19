//
//  PDFViewer.swift
//  MockPDFParser
//
//  Created by Alex Gameli Heyman on 19/02/2022.
//

import SwiftUI

struct PDFViewer: View {
    @Binding var documentUrl: URL
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationView{
            
            VStack {
                PreviewController(url: $documentUrl)
            }
            .navigationBarTitle(Text("PDF file"), displayMode: .inline)
            .navigationBarItems(leading: Button("Done", action:{
                self.presentationMode.wrappedValue.dismiss()
            })
            )
        }
    }
}

