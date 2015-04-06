//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by me on 4/2/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
  var audioPlayer:AVAudioPlayer!
  var receivedAudio:RecordedAudio!

  var audioEngine:AVAudioEngine!
  var audioFile:AVAudioFile!

  override func viewDidLoad(){
    super.viewDidLoad()

    audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
    audioPlayer.enableRate = true

    audioEngine = AVAudioEngine()
    audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
  }

  override func didReceiveMemoryWarning(){
    super.didReceiveMemoryWarning()
  }

  @IBAction func playSlowAudio(sender:UIButton){
    playAudio(0.5)
  }
   
  @IBAction func playFastAudio(sender:UIButton){
    playAudio(1.5)
  }

  func playAudio(rate:Float){
	stopAll()
	audioPlayer.rate = rate
	audioPlayer.currentTime = 0.0
    audioPlayer.play()
  }

  @IBAction func playChipmunkAudio(sender:UIButton){
	playAudioWithVariablePitch(1000)
  }

  @IBAction func playDarthvaderAudio(sender:UIButton) {
	playAudioWithVariablePitch(-1000)
  }

  func playAudioWithVariablePitch(pitch:Float){
	stopAll()

	var audioPlayerNode = AVAudioPlayerNode()
	audioEngine.attachNode(audioPlayerNode)

	var changePitchEffect = AVAudioUnitTimePitch()
	changePitchEffect.pitch = pitch
	audioEngine.attachNode(changePitchEffect)

	audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
	audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)

	audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
	audioEngine.startAndReturnError(nil)

	audioPlayerNode.play()
  }

  func stopAll(){
	audioPlayer.stop()
	audioEngine.stop()
	audioEngine.reset()
  }

  @IBAction func stopAudio(sender:UIButton){
	stopAll()
  }
}