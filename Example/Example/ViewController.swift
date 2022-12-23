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
        presentUIKit()
    }

    @IBAction func presentSwiftUI(_ sender: Any) {

    }

    @IBAction func presentUIKit() {
        let markdown = """
         **Bold**, _Italic_, ~~Strike~~, ___bold italic___

         # h1
         ## h2
         ### h3
         #### h4
         ##### h5
         ###### h6
         ####### h7 will not support

        **This is multiline text** this should be wrapped by **default**

         * List
         * List

        - List
        - List

         1. Order list
         2. Order list

         - [ ] todo box
         - [x] another check

         | table | c2  |
         | ---   | --- |
         | r1    | r2  |

         Image

         <img width="928" alt="image" src="https://user-images.githubusercontent.com/39718754/208992692-d8d642f2-545a-4f71-a831-246c8fdfef02.png">

         `code inline`

         ```javascript
         console.log("code block in js")
         ```

         [Link](https://github.com/ldakhoa/GistHub)

        > quote
        > > quote 1

        """
        present(MarkdownViewController(markdown: markdown), animated: true)
    }
}
