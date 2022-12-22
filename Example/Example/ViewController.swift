//
//  ViewController.swift
//  Example
//
//  Created by Khoa Le on 22/12/2022.
//

import UIKit
import GistHubMarkdownEditor

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentSwiftUI(_ sender: Any) {

    }

    @IBAction func presentUIKit(_ sender: Any) {
        present(MarkdownViewController(), animated: true)
    }
}

