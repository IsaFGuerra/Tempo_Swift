//
//  Temperature.swift
//  tempo
//
//  Created by Foundation09 on 31/10/23.
//

import SwiftUI

struct TemperatureDetailsView: View {
    
    let weather: Weather
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "thermometer.medium")
                    .resizable()
                    .frame(width: 20, height: 30)
                Text("Temperature")
                    .bold()
                    .font(.system(size: 20))
                
            }
    
            Text("Wednesday, 1 November 2023")
                .font(.system(size: 20))
            HStack{
                VStack {
                    HStack {
                        Text("\(weather.highestTemperature)º")
                            .font(.system(size: 35))
                            .padding(.leading)
                            .bold()
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .frame(width: 50, height: 40)
                    }
                    Text("H:\(String(weather.highestTemperature)) L:\(String(weather.lowestTemperature))")
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                Spacer()
                ;Image(systemName: "thermometer.medium")
                    .resizable()
                    .frame(width: 20, height: 30)
                    .padding()
            }
            Image("graphic")
                .resizable()
                .frame(width: 350,height: 250)
            HStack {
                Text("Forecast")
                    .font(.title)
                .bold()
                .padding(.horizontal)
                .padding(.top)
                Spacer()
            }
            Text("\(weather.highestTemperature)º now and mostly sunny. Partly cloudly conditions expect around 17:00. Today's temperature range is from \(weather.lowestTemperature)º and \(weather.highestTemperature)º.")
                .padding()
                .font(.system(size: 20))
                
        }
    }
}

#Preview {
    TemperatureDetailsView(weather: Weather(weekDay: .wednesday, month: .november, lowestTemperature: 25, highestTemperature: 33, weatherCondition: .sunny))
}
