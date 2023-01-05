//
//  StringExtension.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import Foundation

extension String {
    
    
    /// Returns string by trimming and adding percent sign on spaces.
    ///
    /// Here's an example
    ///
    ///     let movie = " The Batman "
    ///     print(movie.trimmedAndEscaped())
    ///     // Prints "The%Batman"
    ///
    /// - Returns: string by trimming and adding percent sign on spaces
    ///
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}


extension String {
    
    /// Returns year from date string.
    ///
    /// Here's an example
    ///
    ///     let date = "2014-01-12"
    ///     print(date.getYear())
    ///     or
    ///     print(date.getYear("yyyy-MM-dd"))
    ///     // Prints "2014"
    ///
    /// - Returns: year string from date string
    ///

    func getYear(from dateFormat: String = "yyyy-MM-dd")-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let s = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: s!)
    }
}

