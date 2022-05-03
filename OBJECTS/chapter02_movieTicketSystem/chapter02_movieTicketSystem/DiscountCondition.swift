//
//  DiscountCondition.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

protocol DiscountCondition {
    func isSatisfiedBy(_ screening: Screening) -> Bool
}

class SequenceCondition: DiscountCondition {
    private var sequence: Int
    
    init(_ sequence: Int) {
        self.sequence = sequence
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        return screening.isSequence(self.sequence)
    }
}

class PeriodCondition: DiscountCondition {
    private let dayOfWeek: Int
    private let startTime: DateComponents
    private let endTime: DateComponents
    
    init(_ dayOfWeek: Int, _ startTime: DateComponents, _ endTime: DateComponents) {
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        let whenScreened = screening.getStartTime()
        return (Calendar.current.component(.weekday, from: whenScreened) == dayOfWeek) &&
        (getTimeInterval(components: startTime) <= whenScreened.timeIntervalSince1970) &&
        (getTimeInterval(components: endTime) >= whenScreened.timeIntervalSince1970)
    }
    
    func getTimeInterval(components: DateComponents) -> TimeInterval {
        guard let date = Calendar(identifier: .gregorian).date(from: components) else {
            return TimeInterval()
        }
        return date.timeIntervalSince1970
    }
}
