//
//  ViewController.swift
//  Drawing
//
//  Created by Developer Inspirus on 4/18/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func pushButtonDidTap(button: DesignableButtonView)
    {
        if button.isAddButton {
            counterView.counter++
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
        }
        counterLabel.text = String(counterView.counter)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

