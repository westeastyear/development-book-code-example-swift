//
//  Screening.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

class Screening {
    private let movie: Movie
    private let sequence: Int
    private var whenScreened: Date = Date()
    
    init(movie: Movie, sequence: Int, whenScreened: Date) {
        self.movie = movie
        self.sequence = sequence
        self.whenScreened = whenScreened
    }
    
    func getStartTime() -> Date {
        return self.whenScreened
    }
    
    func isSequence(_ sequence: Int) -> Bool {
        return sequence == sequence
    }
    
    func getMovieFee() -> Money {
        return self.movie.getFee()
    }
    
    func reserve(customer: Customer, audienceCount: Int) -> Reservation {
        return Reservation(customer, self, calculateFee(audienceCount), audienceCount)
    }
    
    func calculateFee(_ audienceCount: Int) -> Money {
        return self.movie.calculateMovieFee(self).multiply(by: audienceCount)
    }
}
