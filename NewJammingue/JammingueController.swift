//
//  JammingueController.swift
//  NewJammingue
//
//  Created by Felix Herron on 2/20/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

import Cocoa
import AVFoundation

//no more protocols called nose

//extension String{
//    var firstCharacter: String{
//        if self.utf16Count != 0{
//           // return self.substringFromIndex(self.startIndex)
//            return self.substringToIndex(self.startIndex.successor())
//        }
//        else{
//            return ""
//        }
//    }
//}


class JammingueController: NSViewController {
    

    var tryagainInstance = tryagain()
    
    
    
    
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
    var theThreeNotes = [String: [Int]]()
    var tuneCounter = 0
    var bassList = [Int]()
    var evenTimeSig = true
    
    var keyInInt0to120beingC12beingB = Int()

  
//    var pianoPlayer1: AVAudioPlayer!=nil
//    var pianoPlayer2: AVAudioPlayer!=nil
//    var pianoPlayer3: AVAudioPlayer!=nil
//    var pianoPlayer4: AVAudioPlayer!=nil
//    var drumsPlayer1: AVAudioPlayer!=nil
////
//    var pianoPlayerListchen: [AVAudioPlayer]?
//    var metronomeSound1: AVAudioPlayer!=nil
    var metronomeQausiNSSound = String()
//    var metronomeSound2: AVAudioPlayer!=nil
    var metronomeQausiNSSound2 = String()
//    var metronomeListchen: [AVAudioPlayer]?

    var timeTracker = -10
    var timerGoing = false
    var timeurOnDownBeat = NSTimer()
    
    var tempo: AnyObject = 0
    var timeSignature:Double = 0
    var notBPM = Double()
    var passeddict = [String: AnyObject]()
    var timeSigFromPasseddict: AnyObject = ""
    var int1 = 1

    
    
    @IBOutlet weak var tempoLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        passeddict = self.representedObject! as! [String: AnyObject]
        
        
        keyInInt0to120beingC12beingB = (Int(passeddict["Key"]! as! Int))%12

        chordProgressionInTheRaw = passeddict["ChordProgression"]! as! String
        
        
        
        chordProgressionInTheRawArray = chordProgressionInTheRaw.componentsSeparatedByString(", ")
        var keys = [0,1,2,3,4,5,6,7,8,9,10,11]
        var keyOfPiece = keys[keyInInt0to120beingC12beingB]
        for (x,y) in enumerate(chordProgressionInTheRawArray){
            if y == "I"{
                theThreeNotes[String(x)] = [(0 + keyOfPiece)%12,(4 + keyOfPiece)%12,(7 + keyOfPiece)%12]
                bassList.append(((0 + keyOfPiece)%12)+5)
            }
            else if y == "i"{
                theThreeNotes[String(x)] = [(0 + keyOfPiece)%12,(3 + keyOfPiece)%12,(7 + keyOfPiece)%12]
                bassList.append(((0 + keyOfPiece)%12)+5)
            }
            else if y == "II"{
                theThreeNotes[String(x)] = [(2 + keyOfPiece)%12,(6 + keyOfPiece)%12,(9 + keyOfPiece)%12]
                bassList.append(((2+keyOfPiece)%12)+5)
            }
            else if y == "ii"{
                theThreeNotes[String(x)] = [(2 + keyOfPiece)%12,(5 + keyOfPiece)%12,(9 + keyOfPiece)%12]
                bassList.append(((2 + keyOfPiece)%12)+5)
            }
            else if y == "III"{
                theThreeNotes[String(x)] = [(4 + keyOfPiece)%12,(8 + keyOfPiece)%12,(11 + keyOfPiece)%12]
                bassList.append(((4 + keyOfPiece)%12)+5)
            }
            else if y == "iii"{
                theThreeNotes[String(x)] = [(4 + keyOfPiece)%12,(7 + keyOfPiece)%12,(11 + keyOfPiece)%12]
                bassList.append(((4 + keyOfPiece)%12)+5)
            }
            else if y == "IV"{
                theThreeNotes[String(x)] = [(5 + keyOfPiece)%12,(9 + keyOfPiece)%12,(12 + keyOfPiece)%12]
                bassList.append(((5 + keyOfPiece)%12)+5)
            }
            else if y == "iv"{
                theThreeNotes[String(x)] = [(5 + keyOfPiece)%12,(8 + keyOfPiece)%12,(12 + keyOfPiece)%12]
                bassList.append(((5 + keyOfPiece)%12)+5)
            }
            else if y == "V"{
                theThreeNotes[String(x)] = [(7 + keyOfPiece)%12,(11 + keyOfPiece)%12,(14 + keyOfPiece)%12]
                bassList.append(((7 + keyOfPiece)%12)+5)
            }
            else if y == "v"{
                    theThreeNotes[String(x)] = [(7 + keyOfPiece)%12,(10 + keyOfPiece)%12,(14 + keyOfPiece)%12]
                bassList.append(((7 + keyOfPiece)%12)+5)
            }
            else if y == "VI"{
                theThreeNotes[String(x)] = [(9 + keyOfPiece)%12,(13 + keyOfPiece)%12,(16 + keyOfPiece)%12]
                bassList.append(((9 + keyOfPiece)%12)+5)
            }
            else if y == "vi"{
                theThreeNotes[String(x)] = [(9 + keyOfPiece)%12,(12 + keyOfPiece)%12,(16 + keyOfPiece)%12]
                bassList.append(((9 + keyOfPiece)%12)+5)
            }
            else if y == "VII"{
                theThreeNotes[String(x)] = [(11 + keyOfPiece)%12,(15 + keyOfPiece)%12,(18 + keyOfPiece)%12]
                bassList.append(((11 + keyOfPiece)%12)+5)
            }
            else if y == "vii"{
                theThreeNotes[String(x)] = [(11 + keyOfPiece)%12,(14 + keyOfPiece)%12,(18 + keyOfPiece)%12]
                bassList.append(((11+keyOfPiece)%12)+5)
            }
            else{
                self.dismissController(nil)
                timeurOnDownBeat.invalidate()
            }
        }
        
        
        
        pianoListchen = [pianoC, pianoCSharp, pianoD, pianoDSharp, pianoE, pianoF, pianoFSharp, pianoG, pianoGSharp, pianoA, pianoASharp, pianoB]
        
        
        
        if passeddict["Foist"] as! Int == 0{
            metronomeQausiNSSound = "Nose.wav"
        } else if passeddict["Foist"] as! Int == 1{
            metronomeQausiNSSound="Noooze.wav"
        } else if passeddict["Foist"] as! Int == 2{
            metronomeQausiNSSound="hmhmhm.mp3"
        } else if passeddict["Foist"] as! Int == 3{
            metronomeQausiNSSound="Boop2.wav"
        } else{
            metronomeQausiNSSound="swiftToss.wav"
        }
        
        if passeddict["Secoind"] as! Int == 0{
            metronomeQausiNSSound2="Nose.wav"
        } else if passeddict["Secoind"] as! Int == 1{
            metronomeQausiNSSound2="Noooze.wav"
        } else if passeddict["Secoind"] as! Int == 2{
            metronomeQausiNSSound2="hmhmhm.mp3"
        } else if passeddict["Secoind"] as! Int == 3{
            metronomeQausiNSSound2="Boop2.wav"
        } else{
            metronomeQausiNSSound2="swiftToss.wav"
        }
        
//        let fileStringMetronome1 = NSBundle.mainBundle().pathForResource(metronomeQausiNSSound[0], ofType: "wav")
//        let fileStringMetronome2 = NSBundle.mainBundle().pathForResource(metronomeQausiNSSound2[0], ofType: "wav")
//        let fileUrlMetronome1 = NSURL(fileURLWithPath: fileStringMetronome1!)
//        let fileUrlMetronome2 = NSURL(fileURLWithPath: fileStringMetronome2!)
//        metronomeSound1 = AVAudioPlayer(contentsOfURL: fileUrlMetronome1, error: nil)
//        metronomeSound2 = AVAudioPlayer(contentsOfURL: fileUrlMetronome2, error: nil)
//        metronomeListchen = [metronomeSound1, metronomeSound2]
//        for y in metronomeListchen!{
//
//            y.delegate = self
//            y.prepareToPlay()
//            
//        }
//        var fileStringDrums = NSBundle.mainBundle().pathForResource("Drums2", ofType: "wav")
//        if passeddict["Drums1"] as Int == 1{
//            fileStringDrums = NSBundle.mainBundle().pathForResource("Drums1", ofType: "wav")
//            println("yup")
//        } else if passeddict["Drums2"] as Int == 1{
//            fileStringDrums = NSBundle.mainBundle().pathForResource("Drums1", ofType: "wav")
//            println("seconduup")
//        }
//        
//        
//        
//        let fileURLDrums = NSURL(fileURLWithPath: fileStringDrums!)
//        drumsPlayer1 = AVAudioPlayer(contentsOfURL: fileURLDrums, error: nil)
//        
//        drumsPlayer1.enableRate = true
//        drumsPlayer1.rate=Float(Double(passeddict["tempo"]! as Int)/(Double(120)*0.24*Double(passeddict["timeSig"]! as Int)))
//        drumsPlayer1.delegate=self
//        drumsPlayer1.prepareToPlay()
//        
//       
//        
        
        
        notBPM = Double(passeddict["tempo"]! as! Int)/Double(60)
        notBPM = pow(notBPM, Double(-1))
        
        
        
        timeSigFromPasseddict = passeddict["timeSig"]!
        var timeSigFromPasseddictStringValue:String = ""
        for x in 1...Int(timeSigFromPasseddict as! NSNumber){
            timeSigFromPasseddictStringValue = timeSigFromPasseddictStringValue + ("a")
        }
        timeurOnDownBeat = NSTimer.scheduledTimerWithTimeInterval((notBPM/2), target: self, selector: Selector("Countingue"), userInfo: nil, repeats: true)
        tryagainInstance.whoBePlayinDo([passeddict["Brass"]!,passeddict["Bass"]!,passeddict["Mandolin"]!,passeddict["Piano"]!,passeddict["Guittar"]!,passeddict["Drums1"]!,passeddict["Drums2"]!])
        if Int(timeSigFromPasseddict as! NSNumber)%2 != 0{
            evenTimeSig = true
        }else{
            evenTimeSig = false
        }
        int1=Int(timeSigFromPasseddict as! NSNumber)
        tryagainInstance.passyoChordProgression(theThreeNotes)
//        tryagainInstance.passTheBass(bassList)
        tryagainInstance.passTheMetronome([metronomeQausiNSSound,metronomeQausiNSSound2])
        notBPM = notBPM/2
        println(notBPM)
        tryagainInstance.passyonotBPMSyo(notBPM)
        timeSignature=Double(passeddict["timeSig"]! as! NSNumber)
        tryagainInstance.passTheTimeSigm8(timeSignature)
    }
    

//    func Countingue(){
//        println("borscht")
//        if timeTracker == int1*2 {
//            println("in the if statement")
//            timeTracker = 0
//            
//            tuneCounter += 1
//            
//        }
//        if tuneCounter == (theThreeNotes.count){
//            tuneCounter = 0
//        }
//        timeTracker += 1
//        tempoLabel.stringValue=String((timeTracker%8)+1)
//        println(timeTracker)
//        if timeTracker >= 0{
//            if timeTracker == int1*2{
//                tryagainInstance.passTheBass(Int32(bassList[tuneCounter]))
//                tryagainInstance.passyoChordProgression(theThreeNotes[tuneCounter]!)
//                tryagainInstance.passTheMetronome(metronomeQausiNSSound)
//            }else if timeTracker == int1{
//                tryagainInstance.passYoOtroBass(Int32(bassList[tuneCounter]-5))
//                tryagainInstance.passTheMetronome(metronomeQausiNSSound2)
//           // }else if timeTracker%int1{
//               // tryagainInstance.passTheMetronome(metronomeQausiNSSound2)
//            }else {
//                //mandolin ish
//            }
//        }
////
//        
//        
//        
//        
//        
//        
//        
//        
////        if timeTracker == (Int(timeSigFromPasseddict as NSNumber)*2)-1{
////            tuneCounter += 1
////        }
////        if tuneCounter == ((theThreeNotes.count)){
////            tuneCounter = 0
////        }
////        if timeTracker%2 == 0 && timeTracker%4 != 0{
////            tryagainInstance.passTheBass(Int32(bassList[tuneCounter]-5))
////        }
////        if timeTracker%(Int(timeSigFromPasseddict as NSNumber)*2) == 0 && timeTracker >= 0{
////           // tryagainInstance.passTheBass(Int32(bassList[tuneCounter]))
////            
////            tryagainInstance.passYoOtroBass(Int32(bassList[tuneCounter]))
////            tryagainInstance.passyoChordProgression(theThreeNotes[tuneCounter]!)
////            tryagainInstance.passTheMetronome(metronomeQausiNSSound)
////        }
////        
////        
////        if timeTracker == Int(timeSigFromPasseddict as NSNumber)*2{
////            timeTracker = 1
////            
////            tempoLabel.stringValue = String(timeTracker/2)
////        
////        }else if timeTracker < Int(timeSigFromPasseddict as NSNumber)*2 && timeTracker >= 0{
////            timeTracker += 1
////            tempoLabel.stringValue = String(timeTracker/2)
////            tryagainInstance.passTheMetronome(metronomeQausiNSSound2)
////        }else if timeTracker < 0{
////            tempoLabel.stringValue = "Get Yo Self Ready"
////            timeTracker += 1
////        }
////        
////       
////        
////        
//
//    }

    @IBAction func noazSaysCloaz(sender: AnyObject) {
        self.dismissController(nil)
        tryagainInstance.close()
        timeurOnDownBeat.invalidate()
        
    }
    
}
