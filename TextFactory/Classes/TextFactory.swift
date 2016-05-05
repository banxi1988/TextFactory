//
//  TextFactory.swift
//  Pods
//
//  Created by Haizhen Lee on 16/5/5.
//
//

import Foundation

public struct TextFactory{
  
  public static func createAttributedText(textAttributes:[AttributedText]) -> NSAttributedString{
    let attributedText = NSMutableAttributedString()
    for attr in textAttributes{
      attributedText.appendAttributedString(attr.attributedText)
    }
    return attributedText
  }
  

  
  
}