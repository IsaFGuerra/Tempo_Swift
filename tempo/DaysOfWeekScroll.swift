//
//  DaysOfWeekScroll.swift
//  tempo
//
//  Created by Foundation09 on 01/11/23.


import SwiftUI

struct DaysOfWeekScroll: View {
    let weather: Weather
    let weekDays: [WeekDay] = WeekDay.allCases
    
    func getWeekDay(day: Int) -> String {
        switch day%7 {
            case 0:
                return "M"
            case 1:
                return "T"
            case 2:
                return "W"
            case 3:
                return "T"
            case 4:
                return "F"
            case 5:
                return "S"
            case 6:
                return "S"
        default:
            return "BRUH"
        }
    }
    
    var body: some View {
        
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                HStack {
                    ForEach(0..<30, id: \.self) { i in
                        Text("\(getWeekDay(day:i))")
                            .frame(width: 30, height: 30)
                    }
                    
                }
                
                HStack {
                    ForEach(1..<31, id: \.self) { index in
                        Text(String(index))
                            .frame(width: 30, height: 30)
                    }
                }
            }
        }
        
//        HStack {
//            ForEach(1..<31, id: \.self) { index in
//                VStack {
//                    Text(String(index))
//                        .frame(width: 30, height: 30)
//
//                    Text("\(weekDays[index].shortName)")
//                }
//            }
//        }
        
        
        //            HStack {
        //                ForEach(Array(weather.weekDay.shortName), id: \.self) { day in
        //                    Text(String(day))
        //                        .frame(width: 30, height: 30)
        //                }
        //            }
        //
        //            HStack {
        //                ForEach(1..<31, id: \.self) { day in
        //                    Text(String(day))
        //                        .frame(width: 30, height: 30)
        //                }
        //            }
    }
}

#Preview {
    DaysOfWeekScroll(weather: Weather(weekDay: .wednesday, month: .november, lowestTemperature: 10, highestTemperature: 20, weatherCondition: .sunny))
}
