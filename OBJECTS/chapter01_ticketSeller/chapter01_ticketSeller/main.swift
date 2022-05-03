//
//  main.swift
//  chapter01_ticketSeller
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

struct Invitation {
    private let when: Date = Date()
}

struct Ticket {
    private let fee: Int
    
    func getFee() -> Int {
        return self.fee
    }
}

class Bag {
    private var amount: Int
    private let invitation: Invitation?
    private var ticket: Ticket?
    
    init(amount: Int, invitation: Invitation? = nil, ticket: Ticket? = nil) {
        self.amount = amount
        self.invitation = invitation
        self.ticket = ticket
    }
    
    func hold(_ ticket: Ticket) -> Int {
        if hasInvitation() {
            setTicket(ticket)
            return 0
        }
        setTicket(ticket)
        minusAmount(ticket.getFee())
        return ticket.getFee()
    }
    
    private func hasInvitation() -> Bool {
        return self.invitation != nil
    }
    
    private func setTicket(_ newTicket: Ticket) {
        self.ticket = newTicket
    }
    
    private func minusAmount(_ minus: Int) {
        self.amount -= minus
    }
    
    private func plusAmount(_ plus: Int) {
        self.amount += plus
    }
}

class Audience {
    private let bag: Bag
    
    init(bag: Bag) {
        self.bag = bag
    }
    
    func buy(_ ticket: Ticket) -> Int {
        return self.bag.hold(ticket)
    }
}

class TicketOffice {
    private var amount: Int
    private var tickets: [Ticket] = []
    
    init(amount: Int, tickets: [Ticket]) {
        self.amount = amount
        self.tickets = tickets
    }
    
    func sellTicketTo(_ audience: Audience) {
        guard let ticket = getTicket() else { return }
        plusAmount(audience.buy(ticket))
    }
    
    private func getTicket() -> Ticket? {
        guard !self.tickets.isEmpty else { return nil }
        return self.tickets.removeFirst()
    }
    
    private func minusAmount(_ minus: Int) {
        self.amount -= minus
    }
    
    private func plusAmount(_ plus: Int) {
        self.amount += plus
    }
}

class TicketSeller {
    private var ticketOffice: TicketOffice
    
    init(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    func sellTo(_ audience: Audience) {
        ticketOffice.sellTicketTo(audience)
    }
}

class Theater {
    private let ticketSeller: TicketSeller
    
    init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    func enter(_ audience: Audience) {
        self.ticketSeller.sellTo(audience)
    }
}

