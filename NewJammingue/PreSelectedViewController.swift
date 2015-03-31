//
//  PreSelectedViewController.swift
//  NewJammingue
//
//  Created by Felix Herron on 3/9/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa
protocol predesignedDelegate{
    func sendPredesignedFunction(info: [String])
}

class PreSelectedViewController: NSViewController {
    
    var predesignedArray = [String]()
    var delegate: predesignedDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func IviIVVGemCD(sender: AnyObject) {
        predesignedArray = ["I","vi","IV","V"]
        doDelegateStuff()
        

    }
    @IBAction func IIIVIVIVII8BarBlues(sender: AnyObject) {
        predesignedArray = ["I","I","IV","I","V","IV","I","V"]
        doDelegateStuff()
    }
    @IBAction func IviIVVGDemC(sender: AnyObject) {
        predesignedArray = ["I","vi","IV","V"]
        doDelegateStuff()
    }
    @IBAction func IVviIVGDemC(sender: AnyObject) {
        predesignedArray = ["I","V","vi","IV"]
        doDelegateStuff()
    }
    @IBAction func IviIVVGDemC2(sender: AnyObject) {
        predesignedArray = ["I","vi","IV","V"]
        doDelegateStuff()
    }
    @IBAction func IIVI7IVIIVIIVBoston(sender: AnyObject) {
        predesignedArray = ["I","IV","I7","IV","I","IV","I","IV"]
        doDelegateStuff()
    }
    @IBAction func IVIViiV(sender: AnyObject) {
        predesignedArray = ["I","V/IV","ii","V"]
        doDelegateStuff()
    }
    @IBAction func IIVIVIVIViiIOdetoJoy(sender: AnyObject) {
        predesignedArray = ["I","IV","I","V","I","V/IV","ii","i"]
        doDelegateStuff()
    }
    @IBAction func IIVIIVIIIVIIivV(sender: AnyObject) {
        predesignedArray = ["I","I","VII","VII","I","VII","iv","V"]
        doDelegateStuff()
    }
    @IBAction func iViViVIIiiv(sender: AnyObject) {
        predesignedArray = ["i","V","i","V","i","VII","i","iv"]
        doDelegateStuff()
    }
    @IBAction func iVIIIVIIvIIVV7(sender: AnyObject) {
        predesignedArray = ["i","V","III","VII","v","II","V","V7"]
        doDelegateStuff()
    }
    @IBAction func iViViVIIIIIV(sender: AnyObject) {
        predesignedArray = ["i","V","i","V","i","VII","III","V"]
        doDelegateStuff()
    }
    func doDelegateStuff(){
        if let delegate = delegate{
            delegate.sendPredesignedFunction(predesignedArray)
            self.dismissController(nil)
    
        }

    }
        
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if let second = segue.destinationController as?  ViewController{
            second.representedObject = predesignedArray
        }
    }
}
