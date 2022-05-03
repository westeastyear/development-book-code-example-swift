//
//  Reservation.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

class Reservation {
    private let customer: Customer
    private let screening: Screening
    private let fee: Money
    private let audience: Int
    
    init(_ customer: Customer, _ screening: Screening, _ fee: Money, _ audience: Int) {
        self.customer = customer
        self.screening = screening
        self.fee = fee
        self.audience = audience
    }
}
