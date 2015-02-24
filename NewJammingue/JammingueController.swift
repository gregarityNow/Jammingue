//
//  JammingueController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/20/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa

class JammingueController: NSViewController {
    
    
    var boop = NSSound(named: "Boop2.wav")
    var noseSound = NSSound(named: "Nose.wav")
    var noooze = NSSound(named: "Noooze.wav")
    var hmhmhm = NSSound(named: "hmhmhm.mp3")
    
    var timeTracker = -5
    var timerGoing = false
    var timeur = NSTimer()
    var tempo: AnyObject = 0
    var timeSignature: AnyObject = 0
    var notBPM = Double()
    var newTempoCountDouble = Double()
    var newTimeCountDouble = Double()
    var passeddict = [String: Int]()
    
    
    @IBOutlet weak var tempoLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        passeddict = self.representedObject! as [String: Int]
        
        
        
        notBPM = Double(passeddict["tempo"]!)/Double(60)
        notBPM = pow(notBPM, Double(-1))
        
        
        
        
        
        timeur = NSTimer.scheduledTimerWithTimeInterval(notBPM, target: self, selector: Selector("Countingue"), userInfo: nil, repeats: true)
        
    }

    func Countingue(){
        boop?.stop()
        noseSound?.stop()
        hmhmhm?.stop()
        noooze?.stop()
        if passeddict["DöwnBeat"]! == 1{
            println(timeTracker)
            println(Int(passeddict["timeSig"]!))
            if timeTracker == 1{
                tempoLabel.integerValue = timeTracker
                if passeddict["Foist"]! == 0{
                    noseSound?.play()
                }
                else if passeddict["Foist"]! == 1{
                    noooze?.play()
                }
                else if passeddict["Foist"]! == 2{
                    hmhmhm?.play()
                }
                else if passeddict["Foist"]! == 3{
                    boop?.play()
                }
            } else if timeTracker <= Int(passeddict["timeSig"]!) && timeTracker > 1{
                tempoLabel.integerValue = timeTracker
                if passeddict["Secoind"]! == 0{
                    noseSound?.play()
                }
                else if passeddict["Secoind"]! == 1{
                    noooze?.play()
                }
                else if passeddict["Secoind"]! == 2{
                    hmhmhm?.play()
                }
                else if passeddict["Secoind"]! == 3{
                    boop?.play()
                }
            
            } else {
                tempoLabel.stringValue = "Get Ready"
            }
        }
        else{
            println("ese")
            if  timeTracker <= Int(passeddict["timeSig"]!) && timeTracker > 0{
                tempoLabel.integerValue = timeTracker
                if passeddict["Foist"]! == 0{
                    noseSound?.play()
                }
                if passeddict["Foist"]! == 1{
                    noooze?.play()
                }
                if passeddict["Foist"]! == 2{
                    hmhmhm?.play()
                }
                if passeddict["Foist"]! == 3{
                    boop?.play()
                }
            } else {
                tempoLabel.stringValue = "Get Ready"
            }
        }
        if timeTracker == Int(passeddict["timeSig"]!){
            timeTracker = 1
        }
        else{
            timeTracker += 1
        }

        
        
        
    }

    @IBAction func noazSaysCloaz(sender: AnyObject) {
        self.dismissController(nil)
        timeur.invalidate()
        boop?.stop()
    }
    
}
