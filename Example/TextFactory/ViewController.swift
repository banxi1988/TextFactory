//
//  ViewController.swift
//  TextFactory
//
//  Created by banxi1988 on 05/05/2016.
//  Copyright (c) 2016 banxi1988. All rights reserved.
//

import UIKit
import TextFactory


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let text = AttributedText(text: "banxi")
        .textColor(UIColor.darkTextColor())
            .font(UIFont.systemFontOfSize(15))
        .strikethroughStyle(.StyleSingle)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

