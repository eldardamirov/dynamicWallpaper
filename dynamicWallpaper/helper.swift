//
//  helper.swift
//  dynamicWallpaper
//
//  Created by Эльдар Дамиров on 23.12.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Foundation

extension NSDate
    {
    static let requestedComponents: Set<Calendar.Component> = 
        [
        .year,
        .month,
        .day,
        .hour,
        .minute,
        .second
        ]
    
    func hour() -> Int
        {
        //Get Hour
        let calendar = NSCalendar.current
            let components = calendar.dateComponents( NSDate.requestedComponents, from: self as Date )
        let hour = components.hour

        //Return Hour
        return hour!
        }


    func minute() -> Int
        {
        //Get Minute
        let calendar = NSCalendar.current
        let components = calendar.dateComponents( NSDate.requestedComponents, from: self as Date )
        let minute = components.minute

        //Return Minute
        return minute!
        }

    }
