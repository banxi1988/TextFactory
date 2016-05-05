//
//  NSAttributedString+Helper.swift
//  Pods
//
//  Created by Haizhen Lee on 16/5/5.
//
//

import UIKit

public extension NSAttributedString{
  
  // 在指定的宽度范围内,平均分配字符间距,通过 kern 属性实现,
  // 注意: 如果指定宽度不够大,将不进行其他操作.
  public func equalSpacingInWidth(width:CGFloat) -> NSAttributedString{
    let mutableAttrs = NSMutableAttributedString(attributedString: self)
    let originalWidth = self.size().width
    let totalKernWidth = width - originalWidth
    if totalKernWidth < 1{
      return self
    }
    
    let charCount = self.string.characters.count
    let kernCount = charCount - 1
    let kern = totalKernWidth / CGFloat(kernCount)
    mutableAttrs.addAttribute(NSKernAttributeName, value: kern, range: NSRange(location: 0, length: charCount))
    return NSAttributedString(attributedString: mutableAttrs)
  }
}
  