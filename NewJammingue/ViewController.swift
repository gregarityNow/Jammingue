//
//  ViewController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/20/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    
    @IBOutlet weak var welcome: NSTextField!
    @IBOutlet weak var brassButton: NSButton!
    @IBOutlet weak var bassButton: NSButton!
    @IBOutlet weak var mandolinButton: NSButton! //guitar clicker
    @IBOutlet weak var pianoButton: NSButton! //mandolin clicker
    @IBOutlet weak var guittarButton: NSButton! //piano clicker
    @IBOutlet weak var drumsButton: NSButton! //drumsclicker
    @IBOutlet weak var keySelection: NSPopUpButton!
    @IBOutlet weak var displayLabel: NSTextField!
    @IBOutlet weak var tempoManual: NSTextField!
    @IBOutlet weak var tempoSlider: NSSlider!
    @IBOutlet weak var timeSignature: NSTextField!
    @IBOutlet weak var firstSoundchen: NSPopUpButton!
    @IBOutlet weak var secoindSoundchen: NSPopUpButton!
    @IBOutlet weak var döwnBeat: NSButton!

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        keySelection.removeAllItems()
        firstSoundchen.removeAllItems()
        secoindSoundchen.removeAllItems()
        tempoSlider.intValue = 120
        tempoManual.intValue = 120
        tempoSlider.numberOfTickMarks = 10
        tempoSlider.maxValue = 240
        tempoSlider.minValue = 30
        tempoSlider.altIncrementValue = 5
        
        keySelection.addItemsWithTitles(["A Major", "A minor", "Bb/A# Major", "Bb/A# minor", "B Major","B minor","C Major","C minor","C#/Db Major","C#/Db minor","D Major","D Minor","Eb/D# Major","Eb/D# minor","E Major","E minor","F Major","F minor","F#/Gb Major","F#/Gb minor","G Major","G Minor","G#/Ab Major","G#/Ab minor"])
        firstSoundchen.addItemsWithTitles(["Nose", "Noooze", "HMHMHM", "Booope"])
        secoindSoundchen.addItemsWithTitles(["Nose", "Noooze", "HMHMHM", "Booope"])
    }
    

    @IBAction func sliderChange(sender: AnyObject) {
        
        tempoSlider.stringValue = String(tempoSlider.intValue)
        tempoManual.stringValue = tempoSlider.stringValue
    }
    @IBAction func manualChange(sender: AnyObject) {
        
        tempoManual.stringValue=String(tempoManual.intValue)
        tempoSlider.stringValue=tempoManual.stringValue
    }
    @IBAction func döwnBeatChangé(sender: AnyObject) {
        if döwnBeat.state == 1{
            secoindSoundchen.enabled = true
        }
        else {
            secoindSoundchen.enabled = false
        }
    }
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

   
    override func prepareForSegue(segue:NSStoryboardSegue, sender: AnyObject?) {
        
        var transFah = ["tempo": tempoManual.integerValue, "timeSig": timeSignature.integerValue, "Brass": brassButton.state, "Bass": bassButton.state, "Mandolin": mandolinButton.state, "Piano": pianoButton.state, "Guittar": guittarButton.state, "Drums": drumsButton.state, "Key": keySelection.indexOfSelectedItem, "Foist": firstSoundchen.indexOfSelectedItem, "Secoind": secoindSoundchen.indexOfSelectedItem, "DöwnBeat": döwnBeat.state]
        
      
        
        let second = segue.destinationController as JammingueController
        second.representedObject = transFah
        
        
    }
    

}

