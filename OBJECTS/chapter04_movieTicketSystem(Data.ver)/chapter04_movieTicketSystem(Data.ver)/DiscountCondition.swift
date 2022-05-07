//
//  DiscountCondition.swift
//  chapter04_movieTicketSystem(Data.ver)
//
//  Created by Donnie on 2022/05/07.
//

import Foundation

struct DiscountCondition {
    private let type: DiscountConditionType
    private var sequence: Int
    private var dayOfWeek: Int
    private var startTime: Date
    private var endTime: Date
}

extension DiscountCondition {
    
    func getType() -> DiscountConditionType {
        return self.type
    }
    
    func getDayOfWeek() -> Int {
        return self.dayOfWeek
    }
    
    mutating func setDayOfWeek(dayOfWeek: Int) {
        self.dayOfWeek = dayOfWeek
    }
    
    mutating func getStartTime(startTime: Date) {
        self.startTime = startTime
    }
    
    func getEndTime() -> Date {
        return self.endTime
    }
    
    mutating func setEndTime(endTime: Date) {
        self.endTime = endTime
    }
    
    func getSequence() -> Int {
        return self.sequence
    }
    
    mutating func setSequence(sequence: Int) {
        self.sequence = sequence
    }
}
