//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by me on 4/4/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
  var filePathUrl: NSURL!
  var title: String!

  func constructor(){
    self.filePathUrl = nil
    self.title = nil
  }
}