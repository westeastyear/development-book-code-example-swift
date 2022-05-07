//
//  Movie.swift
//  chapter04_movieTicketSystem(Data.ver)
//
//  Created by Donnie on 2022/05/07.
//

import Foundation

struct Movie {
    private let title: String
    private let runningTime: TimeInterval
    private var fee: Money
    private var discountCondition: [DiscountCondition]
    private var movieType: MovieType
    private var discountAmount: Money
    private var discountPercent: Double
    
    func getMovieType() -> MovieType {
        return self.movieType
    }
    
    func getDiscountPercent() -> Double {
        return self.discountPercent
    }
    
    mutating func setMovieType(movieType: MovieType) {
        self.movieType = movieType
    }
    
    mutating func setFee(fee: Money) {
        self.fee = fee
    }
    
    mutating func setDiscountCondition(discountCondition: [DiscountCondition]) {
        self.discountCondition = discountCondition
    }
    
    mutating func getDiscountAmount() -> Money {
        return discountAmount
    }
    
    mutating func setDiscountAmount(discountAmount: Money) {
        self.discountAmount = discountAmount
    }
    
    mutating func setDiscountPercent(discountPercent: Double) {
        self.discountPercent = discountPercent
    }
    
//    public List<DiscountCondition> getDiscountCondition() {
//        return Collections.unmodifiableList(discountConditions);
//    }
}
