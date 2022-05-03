//
//  main.swift
//  chapter02_movieTicketSystem
//
//  Created by Donnie on 2022/05/03.
//

import Foundation

enum DayOfWeek: Int {
    case mon = 1
    case tue, wen, thu, fri, sat, sun
}

let avatarTitle = "아바타"
let avatarRunningTime = TimeInterval(120*60)
let avatarFee = Money.wons(10000)
let avatarDiscountPolicy = AmountDiscountPolicy(discountAmount: Money.wons(800),
                                                conditions: SequenceCondition(1), SequenceCondition(10),
                                                PeriodCondition(DayOfWeek.mon.rawValue,
                                                                DateComponents(hour: 10, minute: 0),
                                                                DateComponents(hour: 11, minute: 59)),
                                                PeriodCondition(DayOfWeek.mon.rawValue,
                                                                DateComponents(hour: 10, minute: 0),
                                                                DateComponents(hour: 20, minute: 59)))
let avatar = Movie(avatarTitle, avatarRunningTime, avatarFee, avatarDiscountPolicy)
// 아바타 할인 정책 변경!!
avatar.changeDiscountPolicy(by: PercentDiscountPolicy(percent: 0.1,
                                                      conditions: SequenceCondition(1), SequenceCondition(10),
                                                      PeriodCondition(DayOfWeek.mon.rawValue,
                                                                      DateComponents(hour: 10, minute: 0),
                                                                      DateComponents(hour: 11, minute: 59)),
                                                      PeriodCondition(DayOfWeek.mon.rawValue,
                                                                      DateComponents(hour: 10, minute: 0),
                                                                      DateComponents(hour: 20, minute: 59))))

let titanicTitle = "타이타닉"
let titanicRunningTime = TimeInterval(180*60)
let titanicFee = Money.wons(11000)
let titanicDiscountPolicy = PercentDiscountPolicy(percent: 0.1,
                                                  conditions: SequenceCondition(2),
                                                  PeriodCondition(DayOfWeek.tue.rawValue,
                                                                  DateComponents(hour: 14, minute: 0),
                                                                  DateComponents(hour: 16, minute: 59)),
                                                  PeriodCondition(DayOfWeek.mon.rawValue,
                                                                  DateComponents(hour: 10, minute: 0),
                                                                  DateComponents(hour: 13, minute: 59)))
let titanic = Movie(titanicTitle, titanicRunningTime, titanicFee, titanicDiscountPolicy)

let starWarsTitle = "스타워즈"
let starWarsRunningTime = TimeInterval(210*60)
let starWarsFee = Money.wons(1000)
let starWarsDiscountPolicy = NoneDiscountPolicy()
let starWars = Movie(starWarsTitle, starWarsRunningTime, starWarsFee, starWarsDiscountPolicy)
