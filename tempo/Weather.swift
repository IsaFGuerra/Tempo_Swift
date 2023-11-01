//
//  Forecast.swift
//  tempo
//
//  Created by Foundation09 on 31/10/23.
//

enum WeatherCondition {
    case rainy, sunny, snowy, cloudy, windy, sunset, sunrise, moon, storm
    
    var systemName: String {
        switch self {
        case .rainy:
            return "cloud.rain.fill"
        case .sunny:
            return "sun.max.fill"
        case .snowy:
            return "snowflake"
        case .cloudy:
            return "cloud.fill"
        case .windy:
            return "wind"
        case .sunset:
            return "sunset.fill"
        case .sunrise:
            return "sunrise.fill"
        case .moon:
            return "moon.stars"
        case .storm:
            return "cloud.bolt.rain.fill"
        }
    }
}

enum WeekDay {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var shortName: String {
        switch self {
        case .sunday:
            return "S"
        case .monday:
            return "M"
        case .tuesday:
            return "T"
        case .wednesday:
            return "W"
        case .thursday:
            return "T"
        case .friday:
            return "F"
        case .saturday:
            return "S"
        }
    }
    
    var mediumtName: String {
        switch self {
        case .sunday:
            return "Sun"
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tue"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "Thu"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        }
    }
}

enum Month {
    case january, february, march, may, april, june, july, august, september, october, november, december
}

// Struct para a temperadura de uma cidade em um dia
struct Weather: Hashable {
    let weekDay: WeekDay
    let month: Month
    let lowestTemperature: Int
    let highestTemperature: Int
    let weatherCondition: WeatherCondition
}

//Struct temperatura por horário de hoje
struct CurrentWeather {
    let hour: Int
    let temperature: Int
    let weatherCondition: WeatherCondition
}

