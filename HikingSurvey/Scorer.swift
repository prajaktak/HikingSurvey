//
//  Scorer.swift
//  HikingSurvey
//
//  Created by Prajakta Kulkarni on 06/10/2025.
//

import Foundation
import NaturalLanguage

class Scorer {
    let tagger = NLTagger(tagSchemes:[.sentimentScore])
    
    func score(_ text: String)-> Double {
        var sentimentScore: Double = 0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .sentimentScore,
            options: []) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue,
                let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }
                return false
            }
        return sentimentScore
    }
}
