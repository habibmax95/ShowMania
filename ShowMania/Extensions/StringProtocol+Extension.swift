//
//  StringProtocol+Extension.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    
    /// Returns a string encoded in utf format from htm
    ///
    /// Here's an example
    ///
    ///     let movie = "<p><b>Under the Dome</b></p>"
    ///     print(movie.html2String)
    ///     // Prints "Under the Dome"
    ///
    /// - Returns: a string without html tags
    ///
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
