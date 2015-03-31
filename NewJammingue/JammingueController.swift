//
//  JammingueController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/20/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa
import AVFoundation

extension String{
    var firstCharacter: String{
        if self.utf16Count != 0{
           // return self.substringFromIndex(self.startIndex)
            return self.substringToIndex(self.startIndex.successor())
        }
        else{
            return ""
        }
    }
}

class JammingueController: NSViewController, AVAudioPlayerDelegate {
    
    
    
    
    //TUNES!!!!!
    //MajorPiano
    var pianoC = ["pianoCNoo","wav"]
    var pianoCSharp = ["pianoCSharpNoo","wav"]
    var pianoD = ["pianoDNoo","wav"]
    var pianoDSharp = ["pianoDSharpNoo","wav"]
    var pianoE = ["pianoENoo","wav"]
    var pianoF = ["pianoFNoo","wav"]
    var pianoFSharp = ["pianoFSharpNoo","wav"]
    var pianoG = ["pianoGNoo","wav"]
    var pianoGSharp = ["pianoGSharpNoo","wav"]
    var pianoA = ["pianoANoo","wav"]
    var pianoASharp = ["pianoASharpNoo","wav"]
    var pianoB = ["pianoBNoo","wav"]
    var drums1 = "Drums1"
    var drums2 = "Drums2"
    var pianoListchen = [[String]]()
    var chordProgressionInTheRaw = ""
    var chordProgressionInTheRawArray = [String]()
    var theThreeNotes = [Int: [Int]]()
    var tuneCounter = 0
    
    var keyInInt0to120beingC12beingB = Int()

  
    var pianoPlayer1: AVAudioPlayer!=nil
    var pianoPlayer2: AVAudioPlayer!=nil
    var pianoPlayer3: AVAudioPlayer!=nil
    var pianoPlayer4: AVAudioPlayer!=nil
    var drumsPlayer1: AVAudioPlayer!=nil
    
    var pianoPlayerListchen: [AVAudioPlayer]?
    var metronomeSound1: AVAudioPlayer!=nil
    var metronomeQausiNSSound = [String]()
    var metronomeSound2: AVAudioPlayer!=nil
    var metronomeQausiNSSound2 = [String]()
    var metronomeListchen: [AVAudioPlayer]?

    var timeTracker = -5
    var timerGoing = false
    var timeur = NSTimer()
    var tempo: AnyObject = 0
    var timeSignature: AnyObject = 0
    var notBPM = Double()
    var passeddict = [String: AnyObject]()
    
    
    
    @IBOutlet weak var tempoLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passeddict = self.representedObject! as [String: AnyObject]
        
        keyInInt0to120beingC12beingB = (Int(passeddict["Key"]! as Int))%12

        chordProgressionInTheRaw = passeddict["ChordProgression"]! as String
        
        
        
        chordProgressionInTheRawArray = chordProgressionInTheRaw.componentsSeparatedByString(", ")
        
        for (x,y) in enumerate(chordProgressionInTheRawArray){
            if y == "I"{
                theThreeNotes[x] = [0,4,7]
            }
            else if y == "i"{
                theThreeNotes[x] = [0,3,7]
            }
            else if y == "II"{
                theThreeNotes[x] = [2,6,9]
            }
            else if y == "ii"{
                    theThreeNotes[x] = [2,5,9]
            }
            else if y == "III"{
                theThreeNotes[x] = [4,8,11]
            }
            else if y == "iii"{
                theThreeNotes[x] = [4,7,11]
            }
            else if y == "IV"{
                theThreeNotes[x] = [5,9,12]
            }
            else if y == "iv"{
                theThreeNotes[x] = [5,8,12]
            }
            else if y == "V"{
                theThreeNotes[x] = [7,11,14]
            }
            else if y == "v"{
                    theThreeNotes[x] = [7,10,14]
            }
            else if y == "VI"{
                theThreeNotes[x] = [9,13,16]
            }
            else if y == "vi"{
                theThreeNotes[x] = [9,12,16]
            }
            else if y == "VII"{
                theThreeNotes[x] = [11,15,18]
            }
            else if y == "vii"{
                theThreeNotes[x] = [11,14,18]
            }
            else{
                self.dismissController(nil)
                timeur.invalidate()
            }
        }
        
        
    
        
        
        pianoListchen = [pianoC, pianoCSharp, pianoD, pianoDSharp, pianoE, pianoF, pianoFSharp, pianoG, pianoGSharp, pianoA, pianoASharp, pianoB]
        
        
        
        if passeddict["Foist"] as Int == 0{
            metronomeQausiNSSound.append("Nose")
        } else if passeddict["Foist"] as Int == 1{
            metronomeQausiNSSound.append("Noooze")
        } else if passeddict["Foist"] as Int == 2{
            metronomeQausiNSSound.append("hmhmhm")
        } else if passeddict["Foist"] as Int == 3{
            metronomeQausiNSSound.append("Boop2")
        } else{
            metronomeQausiNSSound.append("swiftToss")
        }
        
        if passeddict["Secoind"] as Int == 0{
            metronomeQausiNSSound2.append("Nose")
        } else if passeddict["Secoind"] as Int == 1{
            metronomeQausiNSSound2.append("Noooze")
        } else if passeddict["Secoind"] as Int == 2{
            metronomeQausiNSSound2.append("hmhmhm")
        } else if passeddict["Secoind"] as Int == 3{
            metronomeQausiNSSound2.append("Boop2")
        } else{
            metronomeQausiNSSound2.append("swiftToss")
        }
        
        let fileStringMetronome1 = NSBundle.mainBundle().pathForResource(metronomeQausiNSSound[0], ofType: "wav")
        let fileStringMetronome2 = NSBundle.mainBundle().pathForResource(metronomeQausiNSSound2[0], ofType: "wav")
        let fileUrlMetronome1 = NSURL(fileURLWithPath: fileStringMetronome1!)
        let fileUrlMetronome2 = NSURL(fileURLWithPath: fileStringMetronome2!)
        metronomeSound1 = AVAudioPlayer(contentsOfURL: fileUrlMetronome1, error: nil)
        metronomeSound2 = AVAudioPlayer(contentsOfURL: fileUrlMetronome2, error: nil)
        metronomeListchen = [metronomeSound1, metronomeSound2]
        for y in metronomeListchen!{

            y.delegate = self
            y.prepareToPlay()
            
        }
        var fileStringDrums = NSBundle.mainBundle().pathForResource("Drums2", ofType: "wav")
        if passeddict["Drums1"] as Int == 1{
            fileStringDrums = NSBundle.mainBundle().pathForResource("Drums1", ofType: "wav")
            println("yup")
        } else if passeddict["Drums2"] as Int == 1{
            fileStringDrums = NSBundle.mainBundle().pathForResource("Drums1", ofType: "wav")
            println("seconduup")
        }
        
        
        
        let fileURLDrums = NSURL(fileURLWithPath: fileStringDrums!)
        drumsPlayer1 = AVAudioPlayer(contentsOfURL: fileURLDrums, error: nil)
        
        drumsPlayer1.enableRate = true
        drumsPlayer1.rate=Float(Double(passeddict["tempo"]! as Int)/(Double(120)*0.24*Double(passeddict["timeSig"]! as Int)))
        drumsPlayer1.delegate=self
        drumsPlayer1.prepareToPlay()
        
       
        
        
        
        notBPM = Double(passeddict["tempo"]! as Int)/Double(60)
        notBPM = pow(notBPM, Double(-1))
        
        
        
        
        
        timeur = NSTimer.scheduledTimerWithTimeInterval(notBPM, target: self, selector: Selector("Countingue"), userInfo: nil, repeats: true)
        
    }

    func Countingue(){
        
        
        if timeTracker == Int(passeddict["timeSig"]! as Int){
            timeTracker = 1
        }
        else{
            timeTracker += 1
            
        }
       
        
        
        
        if passeddict["DöwnBeat"]! as Int == 1{
            if timeTracker == 1 {
                println(rand())
                if tuneCounter == (theThreeNotes.count-1){
                    tuneCounter = 0
                }
                else{
                    tuneCounter += 1
                }
            
                let pitch1 = NSBundle.mainBundle().pathForResource((pianoListchen[(keyInInt0to120beingC12beingB + theThreeNotes[tuneCounter]![0])%12][0]), ofType: (pianoListchen[keyInInt0to120beingC12beingB][1]))
                let pitchurl1 = NSURL(fileURLWithPath: pitch1!)
                let pitch2 = NSBundle.mainBundle().pathForResource((pianoListchen[(keyInInt0to120beingC12beingB + theThreeNotes[tuneCounter]![1])%12][0]), ofType: ("wav"))
                let pitchurl2 = NSURL(fileURLWithPath: pitch2!)
                let pitch3 = NSBundle.mainBundle().pathForResource((pianoListchen[(keyInInt0to120beingC12beingB+theThreeNotes[tuneCounter]![2])%12][0]), ofType: "wav")
                let pitchurl3 = NSURL(fileURLWithPath: pitch3!)
                if passeddict["Piano"] as Int == 1{
                    pianoPlayer1 = AVAudioPlayer(contentsOfURL: pitchurl1, error: nil)
                    pianoPlayer2 = AVAudioPlayer(contentsOfURL: pitchurl2, error: nil)
                    pianoPlayer3 = AVAudioPlayer(contentsOfURL: pitchurl3, error: nil)
                    pianoPlayerListchen = [pianoPlayer1, pianoPlayer2, pianoPlayer3]
                    for x in pianoPlayerListchen!{
                        x.enableRate=true
                        x.rate=Float(Double(passeddict["tempo"]! as Int)/(Double(120)*0.35*Double(passeddict["timeSig"]! as Int)))
                        x.delegate=self
                        x.prepareToPlay()
                    }
                    pianoPlayer3.play()
                    pianoPlayer2.play()
                    pianoPlayer1.play()
                    
                }
                
                
                
                if passeddict["Drums1"]! as Int == 1 || passeddict["Drums2"]! as Int == 1{
                    drumsPlayer1.play()
                }
                metronomeSound1.play()
                
                
                
                
                tempoLabel.stringValue = String(timeTracker)
            
            
                
                
                
            } else if timeTracker <= Int(passeddict["timeSig"]! as Int) && timeTracker > 1{
                metronomeSound2.play()
                tempoLabel.stringValue = String(timeTracker)
            } else {
                tempoLabel.stringValue = "Get Ready"
            }
        }
        else{
            if  timeTracker <= Int(passeddict["timeSig"]! as Int) && timeTracker > 0{
                tempoLabel.integerValue = timeTracker
                metronomeSound1.prepareToPlay()
                metronomeSound2.play()
                tempoLabel.stringValue = String(timeTracker)
            } else {
                tempoLabel.stringValue = "Get Ready"
            }
        }
        

        
        
        
    }

    @IBAction func noazSaysCloaz(sender: AnyObject) {
        self.dismissController(nil)
        timeur.invalidate()
        
    }
    
}
