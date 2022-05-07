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
    private let fee: Money
    private let discountCondition: [DiscountCondition]
    
    private let movieType: MovieType
    private let discountAmount: Money
    private let discountPercent: Double
}
