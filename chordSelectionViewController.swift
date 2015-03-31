//
//  chordSelectionViewController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/26/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa
import Darwin

protocol chordSelectionDelegate {
    func passBack(array: [String])
}

class chordSelectionViewController: NSViewController {
    
    @IBOutlet weak var numberOfChordsInProgressionComboBox: NSPopUpButton!
    @IBOutlet weak var chord1: NSTextField!
    @IBOutlet weak var chord2: NSTextField!
    @IBOutlet weak var chord3: NSTextField!
    @IBOutlet weak var chord4: NSTextField!
    @IBOutlet weak var chord5: NSTextField!
    @IBOutlet weak var chord6: NSTextField!
    @IBOutlet weak var chord7: NSTextField!
    @IBOutlet weak var chord8: NSTextField!
    @IBOutlet weak var chord9: NSTextField!
    @IBOutlet weak var chord10: NSTextField!
    @IBOutlet weak var chord11: NSTextField!
    @IBOutlet weak var chord12: NSTextField!
    @IBOutlet weak var noazSaysCloazBrudaButton: NSButton!
    
    var acceptablesArray = ["a","b","c","d","e","f","g","m","b","#"]
    var chordGroup = [NSTextField]()
    //var chordGroup = Array<NSTextField>()
    var transfahBack = [String]()
    
    var delegate: chordSelectionDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfChordsInProgressionComboBox.removeAllItems()
        
        numberOfChordsInProgressionComboBox.addItemsWithTitles(["1","2","3","4","5","6","7","8","9","10","11","12"])
        chordGroup = [chord1,chord2,chord3,chord4,chord5,chord6,chord7,chord8,chord9,chord10,chord11,chord12]
        numberOfChordsInProgressionComboBox.title = "12"
        for x in chordGroup{
            if x.hidden == false{
                if x.stringValue == ""{
                    noazSaysCloazBrudaButton.enabled = false
                    
                }
                
            }
        }

        
    }
    @IBAction func numbaChangé(sender: AnyObject) {
        chordGroup = [chord1,chord2,chord3,chord4,chord5,chord6,chord7,chord8,chord9,chord10,chord11,chord12]
        for x in chordGroup{
            x.hidden = false
        }
        
        
        var afterNumba = ((numberOfChordsInProgressionComboBox.indexOfSelectedItem))
        
        
        
        for (i,x) in enumerate(chordGroup) {
            if i > afterNumba {
                x.hidden = true
            }
        }
        for x in chordGroup{
            if x.hidden == false{
                if x.stringValue == ""{
                    noazSaysCloazBrudaButton.enabled = false
                    
                }
                else{
                    noazSaysCloazBrudaButton.enabled = true
                }

            }
        }

        
    }
    
    
    

    override func keyDown(theEvent: NSEvent) {
        returnWasPressed()
    }
    func returnWasPressed() {
        for x in chordGroup{
            if x.hidden == false{
                if x.stringValue == ""{
                    noazSaysCloazBrudaButton.enabled = false
                }
                else{
                    noazSaysCloazBrudaButton.enabled = true
                }
            
            }
        }

    }
    
    
   
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        
        
        
        
        if let second = segue.destinationController as? ViewController {
            second.representedObject = transfahBack
        }
    }
    
    
    @IBAction func noazsaycloazbruda(sender: AnyObject) {
        for x in 0...numberOfChordsInProgressionComboBox.indexOfSelectedItem{
            transfahBack.append(chordGroup[x].stringValue)
        }
        if let delegate = delegate{
            delegate.passBack(transfahBack)
            self.dismissController(nil)
        }
      
        
        
    }
    
}
