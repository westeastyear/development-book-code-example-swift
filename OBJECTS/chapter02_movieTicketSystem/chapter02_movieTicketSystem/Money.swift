//
//  Money.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

class Money {
    static let zero: Money = Money.wons(0)
    
    private let amount: Decimal
    
    init(amount: Decimal) {
        self.amount = amount
    }
    
    static func wons(_ amount: Int) -> Money {
        return Money(amount: Decimal(amount))
    }
    
    static func wons(_ amount: Double) -> Money {
        return Money(amount: Decimal(amount))
    }
    
    func plus(_ amount: Money) -> Money {
        return Money(amount: self.amount + amount.amount)
    }
    
    func minus(_ amount: Money) -> Money {
        return Money(amount: self.amount - amount.amount)
    }
    
    func times(_ percent: Double) -> Money {
        return Money(amount: self.amount * Decimal(percent))
    }
    
    func multiply(by people: Int) -> Money {
        return Money(amount: self.amount * Decimal(people))
    }
    
    func isLessThan(_ other: Money) -> Bool {
        return self.amount < other.amount
    }
    
    func isGreaterThanOrEqual(_ other: Money) -> Bool {
        return self.amount >= other.amount
    }
}
