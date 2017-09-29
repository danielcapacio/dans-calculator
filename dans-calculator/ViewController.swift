//
//  ViewController.swift
//  dans-calculator
//
//  Created by Daniel Capacio on 2017-07-21.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false; // going to be true when you hit an operation
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if (performingMath) {
            label.text = String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!;
            performingMath = false;
        } else {
            label.text = label.text! + String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!;
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        // going to check if there is a number there
        // tag 11 is 'Clear', tag 16 is equals sign
        if (label.text != "" && sender.tag != 11 && sender.tag != 16) {
            previousNumber = Double(label.text!)!;
            switch (sender.tag) {
                case 12: // divide
                    label.text = "/";
                    break;
                case 13: // multiply
                    label.text = "x";
                    break;
                case 14: // minus
                    label.text = "-";
                    break;
                case 15: // plus
                    label.text = "+";
                    break;
                default:
                    break;
            }
            operation = sender.tag;
            performingMath = true;
        } else if (sender.tag == 16) { // tag 16 is equals sign
            switch (operation) {
                case 12: // divide
                    label.text = String(previousNumber / numberOnScreen);
                    break;
                case 13: // multiply
                    label.text = String(previousNumber * numberOnScreen);
                    break;
                case 14: // minus
                    label.text = String(previousNumber - numberOnScreen);
                    break;
                case 15: // plus
                    label.text = String(previousNumber + numberOnScreen);
                    break;
                default:
                    break;
            }
        } else if (sender.tag == 11) { // tag 11 is 'Clear'
            label.text = "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
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

