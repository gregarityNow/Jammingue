//
//  ViewController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/20/15.
//  Copyright (c) 2015 Snockety. All rights reserved.

//http://kstenerud.github.io/ObjectAL-for-iPhone/index.html
//

import Cocoa



import AVFoundation

class ViewController: NSViewController, chordSelectionDelegate, predesignedDelegate, AVAudioPlayerDelegate {

    var allSetBool = false
    var designOwnBool = false
    var preExistingBool = false
    var chordProgressionArray = [String]()
    var chordProgression = (String)()
    var player : AVAudioPlayer!=nil
    var chordProgresionNumbers = [Int]()
    var listOfChords = ["I","II","III","IV","V","VI","VII","i","ii","iii","vi","v","vi","vii"]
    
    
    @IBOutlet weak var allSetButton: NSButton!
    @IBOutlet weak var welcome: NSTextField!
    @IBOutlet weak var brassButton: NSButton!
    @IBOutlet weak var bassButton: NSButton!
    @IBOutlet weak var mandolinButton: NSButton! //guitar clicker
    @IBOutlet weak var pianoButton: NSButton! //mandolin clicker
    @IBOutlet weak var guittarButton: NSButton! //piano clicker
    @IBOutlet weak var drums1Button: NSButton! //drumsclicker
    @IBOutlet weak var drums2Button: NSButton!
    @IBOutlet weak var keySelection: NSPopUpButton!
    @IBOutlet weak var displayLabel: NSTextField!
    @IBOutlet weak var tempoManual: NSTextField!
    @IBOutlet weak var tempoSlider: NSSlider!
    @IBOutlet weak var timeSignature: NSTextField!
    @IBOutlet weak var firstSoundchen: NSPopUpButton!
    @IBOutlet weak var secoindSoundchen: NSPopUpButton!
    @IBOutlet weak var döwnBeat: NSButton!
    @IBOutlet weak var designOwnButton: NSButton!
    @IBOutlet weak var preDesignButton: NSButton!
    @IBOutlet weak var chordProgressionLabelorum: NSTextField!
    
    
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
        chordProgressionLabelorum.stringValue = "I"
        
        keySelection.addItemsWithTitles(["A","A#/Bb","B","C","C#/Db","D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A","A#/Bb","B"])
        firstSoundchen.addItemsWithTitles(["Nose", "Noooze", "HMHMHM", "Booope", "SwiftToss"])
        secoindSoundchen.addItemsWithTitles(["Nose", "Noooze", "HMHMHM", "Booope", "SwiftToss"])
        
        
        
        
        
        //
        let fileString = NSBundle.mainBundle().pathForResource("reggae", ofType: "wav")
        let fileurl = NSURL(fileURLWithPath: fileString!)
        player = AVAudioPlayer(contentsOfURL: fileurl, error: nil)
        
        player.prepareToPlay()
        player.enableRate = true
        player.rate = 1
        player.delegate = self
        //player.play()
        
        

    }
    
    func applicationWillEnterForeground() {
        if let chordProgression = self.representedObject as? [Int: String] {
            
        }
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
//    override var representedObject: AnyObject? {
//        didSet {
//        }
//    }

    @IBAction func allSetGo(sender: AnyObject) {
        allSetBool = true
    }
    @IBAction func designOwnGo(sender: AnyObject) {
        designOwnBool = true
    }
    @IBAction func preExistingGo(sender: AnyObject) {
        preExistingBool = true
    }
    
    override func prepareForSegue(segue:NSStoryboardSegue, sender: AnyObject?) {
        
        
        var transFah = ["tempo": tempoManual.integerValue, "timeSig": timeSignature.integerValue, "Brass": brassButton.state, "Bass": bassButton.state, "Mandolin": mandolinButton.state, "Piano": pianoButton.state, "Guittar": guittarButton.state, "Drums1": drums1Button.state, "Drums2": drums2Button.state, "Key": keySelection.indexOfSelectedItem, "Foist": firstSoundchen.indexOfSelectedItem, "Secoind": secoindSoundchen.indexOfSelectedItem, "DöwnBeat": döwnBeat.state, "ChordProgression": chordProgressionLabelorum.stringValue ]
        
        if let second = segue.destinationController as? JammingueController {
            second.representedObject = transFah
        }
            
        
        if segue.identifier == "showSecondVC" {
            let secondVC:chordSelectionViewController = segue.destinationController as chordSelectionViewController
            secondVC.delegate = self
        }
        if segue.identifier == "preDesignedShowSecondVC"{
            let secondVC: PreSelectedViewController = segue.destinationController as PreSelectedViewController
            secondVC.delegate = self
        }

                
    }
    func passBack(array: [String]) {
        chordProgressionArray = array
        chordProgression = ", ".join(chordProgressionArray)
        chordProgressionLabelorum.stringValue = chordProgression
        
        
    }
    func sendPredesignedFunction(info: [String]){
        chordProgressionArray = info
        chordProgression = ", ".join(chordProgressionArray)
        chordProgressionLabelorum.stringValue = chordProgression
    }
    
       
    
    

}

