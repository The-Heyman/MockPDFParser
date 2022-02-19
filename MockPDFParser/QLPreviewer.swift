//
//  QLPreviewer.swift
//  MockPDFParser
//
//  Created by Alex Gameli Heyman on 19/02/2022.
//

import Foundation
import SwiftUI
import QuickLook

struct PreviewController: UIViewControllerRepresentable {
    
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: QLPreviewController, context: Context) {}
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: QLPreviewControllerDataSource {
        
        let parent: PreviewController
        
        init(parent: PreviewController) {
            self.parent = parent
        }
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return parent.url as NSURL
        }
        
    }
}
