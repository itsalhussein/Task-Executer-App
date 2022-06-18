//
//  PublicMethods.swift
//  Task Executer App
//
//  Created by Hussein Anwar on 18/06/2022.
//


import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork

class PublicMethods: NSObject {
    
    class func getCurrDateTimeAsString() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.dateFormat = "dd-MM-yyy HH:mm:ss"
        let result = formatter.string(from: date)
        
        return result
    }
    
    class func hexaStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
