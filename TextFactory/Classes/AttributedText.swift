//
//  AttributedText.swift
//  Pods
//
//  Created by Haizhen Lee on 16/5/5.
//
//

import Foundation

import UIKit

public class AttributedText{
  public var textColor:UIColor?
  public var font:UIFont?
  
  public var backgroundColor: UIColor?
  public var ligature = LigatureStyle.None // 连写
  public var kern:CGFloat? // 字符间距
  public var baselineOffset:CGFloat?
  
  // Under line
  public var underlineColor:UIColor?
  public var underlineStyle = NSUnderlineStyle.StyleNone
  
  // strikethrough
  public var strikethroughColor:UIColor?
  public var strikethroughStyle = NSUnderlineStyle.StyleNone
  
  // stroke
  // UIColor, default nil: same as foreground color
  public var strokeColor:UIColor?
  // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
  public var strokeWidth:CGFloat?
  
  public var obliqueness:CGFloat?
  public var expansion:CGFloat?
  
  public var textEffect = TextEffectStyle.None
  
  
  
  public private(set) var text:String
  
  public init(text:String){
    self.text = text
  }
  
  public  func backgroundColor(color:UIColor?) -> AttributedText{
    self.backgroundColor = color
    return self
  }
  
  public  func textColor(color:UIColor?) -> AttributedText{
    self.textColor = color
    return self
  }
  
  public  func foregroundColor(color:UIColor?) -> AttributedText{
    self.textColor = color
    return self
  }
  
  public  func font(font:UIFont?) -> AttributedText{
    self.font = font
    return self
  }
  
  public  func ligature(style:LigatureStyle) -> AttributedText{
    self.ligature = style
    return self
  }
  
  // The kerning attribute indicates how much the following character should be shifted from its default offset as defined by the current character’s font; a positive kern indicates a shift farther along and a negative kern indicates a shift closer to the current character.
  public  func kern(value:CGFloat?) -> AttributedText{
    self.kern = value
    return self
  }
  
  // The baseline offset attribute is a literal distance, in pixels, by which the characters should be shifted above the baseline (for positive offsets) or below (for negative offsets).
  public  func baselineOffset(value:CGFloat?) -> AttributedText{
    self.baselineOffset = value
    return self
  }
  
  public  func underlineColor(color:UIColor?) -> AttributedText{
    self.underlineColor = color
    return self
  }
  
  public  func underlineStyle(style:NSUnderlineStyle) -> AttributedText{
    self.underlineStyle = style
    return self
  }
  
  public  func strikethroughColor(color:UIColor?) -> AttributedText{
    self.strikethroughColor = color
    return self
  }
  
  public  func strikethroughStyle(style:NSUnderlineStyle) -> AttributedText{
    self.strikethroughStyle = style
    return self
  }
  
  public  func strokeColor(color:UIColor?) -> AttributedText{
    self.strokeColor = color
    return self
  }
  
  public  func strokeWidth(width:CGFloat?) -> AttributedText{
    self.strokeWidth = width
    return self
  }
  
  // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
  public  func obliqueness(liq:CGFloat?) -> AttributedText{
    self.obliqueness = liq
    return self
  }
  
  // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion
  public  func expansion(expansion:CGFloat?) -> AttributedText{
    self.expansion = expansion
    return self
  }
  
  public  func textEffect(effect:TextEffectStyle) -> AttributedText{
    self.textEffect = effect
    return self
  }
  
  
  
  var attributedText:NSAttributedString{
    var attrs: [String : AnyObject] = [:]
    
    if let font = self.font{
      attrs[NSFontAttributeName] = font
    }
    
    if let color = self.textColor {
      attrs[NSForegroundColorAttributeName] = color
    }
    
    if let color = self.backgroundColor{
      attrs[NSBackgroundColorAttributeName] = color
    }
    
    if !ligature.isDefault{
      attrs[NSLigatureAttributeName] = ligature.rawValue
    }
    
    if let kern = self.kern{
      attrs[NSKernAttributeName] = kern
    }
    
    if let offset = baselineOffset{
      attrs[NSBaselineOffsetAttributeName] = offset
    }
    
    if let color = underlineColor{
      attrs[NSUnderlineColorAttributeName] = color
    }
    
    if underlineStyle != .StyleNone{
      attrs[NSUnderlineStyleAttributeName] = underlineStyle.rawValue
    }
    
    if let color = strikethroughColor{
      attrs[NSStrikethroughColorAttributeName] = color
    }
    
    if strikethroughStyle != .StyleNone{
      attrs[NSStrikethroughStyleAttributeName] = strikethroughStyle.rawValue
    }
    
    if !textEffect.isNone{
      attrs[NSTextEffectAttributeName] = textEffect.styleValue
    }
    
    if let color = strokeColor{
      attrs[NSStrokeColorAttributeName] = color
    }
    
    if let width = strokeWidth{
      attrs[NSStrokeWidthAttributeName] = width
    }
    
    if let oblique = obliqueness{
      attrs[NSObliquenessAttributeName] = oblique
    }
    
    if let style = paragraphStyle{
      attrs[NSParagraphStyleAttributeName] = style
    }else if hasCustomParagraphStyle{
      attrs[NSParagraphStyleAttributeName] = _paragraphStyle
    }
    
    if let shadow = self.shadow{
      attrs[NSShadowAttributeName] = shadow
    }else if hasCustomShadow {
      attrs[NSShadowAttributeName] = _shadow
    }
    
    
    return NSAttributedString(string: text, attributes:attrs)
  }
  
  
  // If this value is set, has high priority than other shadow property
  public var shadow:NSShadow?
  private var _shadow = NSShadow()
  private var hasCustomShadow = false
  
  public  func shadow(shadow:NSShadow?) -> AttributedText{
    self.shadow = shadow
    return self
  }
  
  // If this value is set, has high priority than other fragment paragraph style.
  public var paragraphStyle:NSParagraphStyle?
  
  public  func paragraphStyle(style:NSParagraphStyle?) -> AttributedText{
    self.paragraphStyle = style
    return self
  }
  
  private  let _paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
  private var hasCustomParagraphStyle = false
}


extension AttributedText{
  // The horizontal and vertical offset values, specified using the width and height fields of the NSSize data type. These offsets are measured using the default user coordinate space and are not affected by custom transformations. This means that positive values always extend up and to the right from the user's perspective.
  public  func shadowOffset(offset:CGSize) -> AttributedText{
    _shadow.shadowOffset = offset
    hasCustomShadow = true
    return self
  }
  
  public  func shadowBlurRadius(radius:CGFloat) -> AttributedText{
    _shadow.shadowBlurRadius = radius
    hasCustomShadow = true
    return self
  }
  
  public  func shadowColor(color:UIColor) -> AttributedText{
    _shadow.shadowColor = color
    hasCustomShadow = true
    return self
  }
}

extension AttributedText{
  public  func alignment(align:NSTextAlignment) -> AttributedText{
    _paragraphStyle.alignment = align
    hasCustomParagraphStyle = true
    return self
  }
  
  public  func lineBreakMode(mode:NSLineBreakMode) -> AttributedText{
    _paragraphStyle.lineBreakMode = mode
    hasCustomParagraphStyle = true
    return self
  }
  
  // "Leading": distance between the bottom of one line fragment and top of next (applied between lines in the same container). This value is included in the line fragment heights in layout manager.
  public  func lineSpacing(spacing:CGFloat) -> AttributedText{
    _paragraphStyle.lineSpacing = spacing
    hasCustomParagraphStyle = true
    return self
  }
  
  // Distance between the bottom of this paragraph and top of next (or the beginning of its paragraphSpacingBefore, if any).
  public  func paragraphSpacing(spacing:CGFloat) -> AttributedText{
    _paragraphStyle.paragraphSpacing = spacing
    hasCustomParagraphStyle = true
    return self
  }
  
  // The following values are relative to the appropriate margin (depending on the paragraph direction)
  
  // Distance from margin to front edge of paragraph
  public  func headIndent(indent:CGFloat) -> AttributedText{
    _paragraphStyle.headIndent = indent
    hasCustomParagraphStyle = true
    return self
  }
  
  // Distance from margin to back edge of paragraph; if negative or 0, from other margin
  public  func tailIndent(indent:CGFloat) -> AttributedText{
    _paragraphStyle.tailIndent = indent
    hasCustomParagraphStyle = true
    return self
  }
  
  // Distance from margin to edge appropriate for text direction
  public  func firstLineHeadIndent(indent:CGFloat) -> AttributedText{
    _paragraphStyle.firstLineHeadIndent = indent
    hasCustomParagraphStyle = true
    return self
  }
  
  // Line height is the distance from bottom of descenders to top of ascenders; basically the line fragment height. Does not include lineSpacing (which is added after this computation).
  public  func minimumLineHeight(height:CGFloat) -> AttributedText{
    _paragraphStyle.minimumLineHeight = height
    hasCustomParagraphStyle = true
    return self
  }
  
  // 0 implies no maximum.
  public  func maximumLineHeight(height:CGFloat) -> AttributedText{
    _paragraphStyle.maximumLineHeight = height
    hasCustomParagraphStyle = true
    return self
  }
  
  // Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height.
  public  func lineHeightMultiple(multiple:CGFloat) -> AttributedText{
    _paragraphStyle.lineHeightMultiple = multiple
    hasCustomParagraphStyle = true
    return self
  }
  
  // Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph.
  public  func paragraphSpacingBefore(spacing:CGFloat) -> AttributedText{
    _paragraphStyle.paragraphSpacingBefore = spacing
    hasCustomParagraphStyle = true
    return self
  }
  
  public  func hyphenationFactor(factor:Float) -> AttributedText{
    _paragraphStyle.hyphenationFactor = factor
    hasCustomParagraphStyle = true
    return self
  }
  
  // An array of NSTextTabs. Contents should be ordered by location. The default value is an array of 12 left-aligned tabs at 28pt interval
  public  func tabStops(stops:[NSTextTab]) -> AttributedText{
    _paragraphStyle.tabStops = stops
    hasCustomParagraphStyle = true
    return self
  }
  
  // The default tab interval used for locations beyond the last element in tabStops
  public  func defaultTabInterval(interval:CGFloat) -> AttributedText{
    _paragraphStyle.defaultTabInterval = interval
    hasCustomParagraphStyle = true
    return self
  }
  
  @available(iOS 9.0, *)
  public  func allowsDefaultTighteningForTruncation(allows:Bool) -> AttributedText{
    _paragraphStyle.allowsDefaultTighteningForTruncation = allows
    hasCustomParagraphStyle = true
    return self
  }
  
  
}

// English text has no essential ligatures, and typically has only two standard ligatures, those for “fi” and “fl”—all others being considered more advanced or fancy.
//
public enum LigatureStyle :Int {
  
  case None =  0 //  A value of 0 indicates that only ligatures essential for proper rendering of text should be used
  
  case Default =  1 // 1 indicates that standard ligatures should be used
  
  case All =  2 // and 2 indicates that all available ligatures should be used
  
  public var isNone:Bool{
    return self == .None
  }
  
  public var isDefault:Bool{
    return self == .Default
  }
  
  public var isAll:Bool{
    return self == .All
  }
  
  static let allCases:[LigatureStyle] = [None,Default,All]
}

// Build for target enum
//-TextEffectStyle:i
//None
//Letterpress
public enum TextEffectStyle :Int {
  case None =  0
  
  case Letterpress =  1
  
  public var isNone:Bool{
    return self == .None
  }
  
  public var isLetterpress:Bool{
    return self == .Letterpress
  }
  
  public var styleValue:String{
    switch self{
    case .Letterpress: return NSTextEffectLetterpressStyle
    default: return ""
    }
  }
  
  static let allCases:[TextEffectStyle] = [None,Letterpress]
}





