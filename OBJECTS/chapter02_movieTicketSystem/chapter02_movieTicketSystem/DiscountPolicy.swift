//
//  DiscountPolicy.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

// MARK: - protocol과 extension으로 구현

protocol DiscountPolicy {
    var conditions: [DiscountCondition] { get set }
    
    func calculateDiscountAmount(_ screening: Screening) -> Money
    func getDiscountAmount(_ screening: Screening) -> Money
}

extension DiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        for each in conditions {
            if each.isSatisfiedBy(screening) {
                return getDiscountAmount(screening)
            }
        }
        return Money.zero
    }
}

extension DiscountPolicy where Self: NoneDiscountPolicy {
    func getDiscountAmount(_ screening: Screening) -> Money {
        return Money.zero
    }
}

// MARK: - class에 protocol 채택 및 구현

class AmountDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private let discountAmount: Money
    
    init(discountAmount: Money, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.discountAmount = discountAmount
    }
    
    func getDiscountAmount(_ screening: Screening) -> Money {
        return self.discountAmount
    }
}

class PercentDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private let percent: Double
    
    init(percent: Double, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.percent = percent
    }
    
    func getDiscountAmount(_ screening: Screening) -> Money {
        return screening.getMovieFee().times(percent)
    }
}

class NoneDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition] = []
}
