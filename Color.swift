//
//  Color.swift
//  Muslink
//
//  Created by Aisha Nurgaliyeva on 05.08.2023.
//

import UIKit

enum Color {
    case neutral100
    case neutral80
    case neutral72
    case neutral32
    case neutral16

    case primaryBgColor
    case elevatedBgColor
    case bgColor20
    case primaryMain
    case primaryPressed
    case primaryHover
    case primaryFocus
    case primaryBorder
    
    case accentMain
    case accentPressed
    case accentHover
    case accentFocus
    case accentBorder
    
    case successMain
    case successBgColor
    case successPressed
    case successHover
    case successFocus
    case successBorder
    
    case warningMain
    case warningBgColor
    case warningPressed
    case warningHover
    case warningFocus
    case warningBorder
    
    case dangerMain
    case dangerBgColor
    case dangerPressed
    case dangerHover
    case dangerFocus
    case dangerBorder
    
    case infoMain
    case infoBgColor
    case infoPressed
    case infoHover
    case infoFocus
    case infoBorder
    
    
}

extension Color {
    var color: UIColor {
        var color: UIColor?

        switch self {
        case .neutral100:
            color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .neutral80:
            color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        case .neutral72:
            color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.72)
        case .neutral32:
            color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.32)
        case .neutral16:
            color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.16)
            
            
        case .primaryBgColor:
            color = UIColor(red: 21/255, green: 24/255, blue: 36/255, alpha: 1)
        case .elevatedBgColor:
            color = UIColor(red: 34/255, green: 39/255, blue: 56/255, alpha: 1)
        case .bgColor20:
            color = UIColor(red: 100/255, green: 136/255, blue: 180/255, alpha: 0.2)
        case .primaryMain:
            color = UIColor(red: 184/255, green: 126/255, blue: 238/255, alpha: 1)
        case .primaryPressed:
            color = UIColor(red: 34/255, green: 15/255, blue: 128/255, alpha: 1)
        case .primaryHover:
            color = UIColor(red: 105/255, green: 77/255, blue: 249/255, alpha: 1)
        case .primaryFocus:
            color = UIColor(red: 226/255, green: 220/255, blue: 255/255, alpha: 1)
        case .primaryBorder:
            color = UIColor(red: 188/255, green: 176/255, blue: 245/255, alpha: 1)
            
            
        case .accentMain:
            color = UIColor(red: 254/255, green: 211/255, blue: 44/255, alpha: 1)
        case .accentPressed:
            color = UIColor(red: 222/255, green: 177/255, blue: 1/255, alpha: 1)
        case .accentHover:
            color = UIColor(red: 255/255, green: 219/255, blue: 80/255, alpha: 1)
        case .accentFocus:
            color = UIColor(red: 255/255, green: 240/255, blue: 180/255, alpha: 1)
        case .accentBorder:
            color = UIColor(red: 255/255, green: 229/255, blue: 129/255, alpha: 1)
            
        
        case .successMain:
            color = UIColor(red: 33/255, green: 114/255, blue: 94/255, alpha: 1)
        case .successBgColor:
            color = UIColor(red: 231/255, green: 250/255, blue: 245/255, alpha: 1)
        case .successPressed:
            color = UIColor(red: 22/255, green: 76/255, blue: 63/255, alpha: 1)
        case .successHover:
            color = UIColor(red: 27/255, green: 95/255, blue: 78/255, alpha: 1)
        case .successFocus:
            color = UIColor(red: 200/255, green: 235/255, blue: 226/255, alpha: 1)
        case .successBorder:
            color = UIColor(red: 181/255, green: 208/255, blue: 201/255, alpha: 1)
        
            
        case .warningMain:
            color = UIColor(red: 224/255, green: 206/255, blue: 44/255, alpha: 1)
        case .warningBgColor:
            color = UIColor(red: 254/255, green: 250/255, blue: 220/255, alpha: 1)
        case .warningPressed:
            color = UIColor(red: 149/255, green: 137/255, blue: 29/255, alpha: 1)
        case .warningHover:
            color = UIColor(red: 187/255, green: 172/255, blue: 37/255, alpha: 1)
        case .warningFocus:
            color = UIColor(red: 253/255, green: 248/255, blue: 207/255, alpha: 1)
        case .warningBorder:
            color = UIColor(red: 245/255, green: 239/255, blue: 185/255, alpha: 1)
            
        case .dangerMain:
            color = UIColor(red: 224/255, green: 81/255, blue: 81/255, alpha: 1)
        case .dangerBgColor:
            color = UIColor(red: 255/255, green: 232/255, blue: 232/255, alpha: 1)
        case .dangerPressed:
            color = UIColor(red: 84/255, green: 18/255, blue: 18/255, alpha: 1)
        case .dangerHover:
            color = UIColor(red: 140/255, green: 31/255, blue: 31/255, alpha: 1)
        case .dangerFocus:
            color = UIColor(red: 255/255, green: 223/255, blue: 223/255, alpha: 1)
        case .dangerBorder:
            color = UIColor(red: 226/255, green: 182/255, blue: 182/255, alpha: 1)
            
            
        case .infoMain:
            color = UIColor(red: 0/255, green: 35/255, blue: 221/255, alpha: 1)
        case .infoBgColor:
            color = UIColor(red: 235/255, green: 238/255, blue: 255/255, alpha: 1)
        case .infoPressed:
            color = UIColor(red: 0/255, green: 23/255, blue: 147/255, alpha: 1)
        case .infoHover:
            color = UIColor(red: 0/255, green: 29/255, blue: 184/255, alpha: 1)
        case .infoFocus:
            color = UIColor(red: 226/255, green: 231/255, blue: 255/255, alpha: 1)
        case .infoBorder:
            color = UIColor(red: 170/255, green: 182/255, blue: 244/255, alpha: 1)
        }

        return color ?? UIColor()
    }
}
