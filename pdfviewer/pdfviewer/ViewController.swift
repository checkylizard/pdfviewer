//
//  ViewController.swift
//  pdfviewer
//
//  Created by soo on 2022/01/13.
//

import UIKit
import PDFKit

class ViewController: UIViewController, PDFViewDelegate {
    
    // Views
    let pdfView = PDFView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfView)
        
        // Document
        guard let url = Bundle.main.url(forResource: "swift", withExtension: "pdf") else {
            return
        }
        
        guard let document = PDFDocument(url: url) else {
            return
        }
        
        pdfView.delegate = self
        
        // Create document
        
    let newDocument = PDFDocument()
        guard let page = PDFPage(image: UIImage(systemName: "house")!) else {
            return
        }
        
        newDocument.insert(page, at: 0)
        pdfView.document = newDocument
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }

}

