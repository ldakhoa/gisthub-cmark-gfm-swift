//
//  ViewController.swift
//  Example
//
//  Created by Khoa Le on 22/12/2022.
//

import UIKit
import GistHubMarkdownPreview
import SwiftUI

class ViewController: UIViewController {

    private let markdown = """
    **Bold**, _Italic_, ~~Strike~~, ___bold italic___

    # h1
    ## h2
    ### h3
    #### h4
    ##### h5
    ###### h6
    ####### h7 will not support

    * List
    * List

    1. Order list
    2. Order list

    - [ ] todo box
    - [x] another check

    | table | c2 |
    | ---   | --- |
    | r1    |  r2 |

    Image

    <img width="928" alt="image" src="https://user-images.githubusercontent.com/39718754/208992692-d8d642f2-545a-4f71-a831-246c8fdfef02.png">

    `code inline`

    ```javascript
    console.log("code block in js")
    ```

    > Quote 1
    > > quote 2

    [Link](https://github.com/ldakhoa/GistHub)
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentSwiftUI(_ sender: Any) {
        present(UIHostingController(rootView: NestedSwiftUIView()), animated: true)
    }

    @IBAction func presentUIKit(_ sender: Any) {
        present(MarkdownPreviewViewController(markdown: markdown), animated: true)
    }
}
