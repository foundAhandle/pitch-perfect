//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by me on 3/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true;
        recordButton.enabled = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordButton.enabled = false
        stopButton.hidden = false
        recordingInProgress.hidden = false
        println("t")
    }

    @IBAction func stopAudio(sender: UIButton) {
    }
}