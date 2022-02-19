//
//  ContentView.swift
//  MockPDFParser
//
//  Created by Alex Gameli Heyman on 19/02/2022.
//



import PDFKit
import QuickLook
import UniformTypeIdentifiers
import SwiftUI
import os



struct ContentView: View {
    @State  var isDocumentPickerPresented = false
    @State var pdfData = Data()
    @State var isPreviewControllerPresented = false
    @State var documentUrl: URL = URL(fileURLWithPath: "")
    let logger = Logger()
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.isDocumentPickerPresented.toggle()
                })
                {
                    Text("Import PDF")
                        .bold()
                        .padding()
                        .foregroundColor(.blue)
                        .frame(minWidth: 160, maxWidth: nil, maxHeight: 35, alignment: .center)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10.0)
                        .shadow(radius: 10)
                }
            }
            .fileImporter(
                isPresented: $isDocumentPickerPresented,
                allowedContentTypes: [.pdf],
                allowsMultipleSelection: false
            ) { result in
                do {
                    guard let selectedFile: URL = try result.get().first else { return }
                    if selectedFile.startAccessingSecurityScopedResource() {
                        
                        defer { selectedFile.stopAccessingSecurityScopedResource() }
                        
                        documentUrl = selectedFile
                        pdfData = try Data(contentsOf: selectedFile)
//                        call removeString function here to make changes to the pdfdata
                        
                        isPreviewControllerPresented.toggle() // toggle to show the pdf file
                        
                        
                    }
                } catch {
                    logger.error("\(error.localizedDescription)")
                }
            }
        }
        .fullScreenCover(isPresented: $isPreviewControllerPresented, content: {
            PDFViewer(documentUrl: $documentUrl)
        })
    }
    
    func removeString(data: Data){
//        ToDo
//        write code here to remove all occurances of the string "Machine Translated By Google" from  pdfData
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
