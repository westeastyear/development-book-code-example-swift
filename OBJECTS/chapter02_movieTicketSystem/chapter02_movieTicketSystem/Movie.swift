//
//  Movie.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

class Movie {
    private let title: String
    private let runningTime: TimeInterval
    private let fee: Money
    private var discountPolicy: DiscountPolicy
    
    init(_ title: String, _ runningTime: TimeInterval, _ fee: Money, _ discountPolicy: DiscountPolicy) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountPolicy = discountPolicy
    }
    
    func getFee() -> Money {
        return self.fee
    }
    
    func calculateMovieFee(_ screening: Screening) -> Money {
        return self.fee.minus(self.discountPolicy.calculateDiscountAmount(screening))
    }
    
    func changeDiscountPolicy(by discountPolicy: DiscountPolicy) {
        self.discountPolicy = discountPolicy
    }
}
