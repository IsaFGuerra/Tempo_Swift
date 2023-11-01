//
//  WeatherRowCard.swift
//  tempo
//
//  Created by Foundation09 on 31/10/23.
//

import SwiftUI

struct WeatherRowCard: View {
    
    let weather: Weather
    
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(weather.weekDay.mediumtName)
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            Spacer().frame(width: 20)
            
            Image(systemName: weather.weatherCondition.systemName)
                .foregroundColor(.white)
            
            Spacer().frame(width: 20)
            
            Text("\(weather.lowestTemperature)º")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(.system(size:20))
            
            Spacer().frame(width: 20)
            
            Image("barra")
                .resizable()
                .frame(width: 150, height: 10)
                .clipShape(RoundedRectangle(cornerRadius: 15), style: FillStyle())
            
            Spacer().frame(width: 20)
            
                Text("\(weather.highestTemperature)º")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .font(.system(size:20))
        }
    }
}

#Preview {
    WeatherRowCard(weather: Weather(weekDay: .monday, month: .november, lowestTemperature: 10, highestTemperature: 20, weatherCondition: .sunny))
}

