//
//  TempoCidades.swift
//  tempo
//
//  Created by Isadora Guerra on 30/10/23.
//

import SwiftUI

//struct Header: View{
//    var body: some View{
//        VStack(alignment: .leading, spacing: 16){
//            Text("Weather")
//                .font(.title)
//        }
//    }
//}

struct TempoCidades: View {
    @State private var searchText = ""
    var location: Location
    var body: some View {
        ZStack(){
            Image(location.back)
                .resizable()
                .frame(width: 350, height: 120)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15), style: FillStyle())
            HStack{
                VStack(alignment: .leading){
                    Text(location.city)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(location.time)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(" ")
                    Text(location.tempString)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                }
                Spacer().frame(width: 130)
                VStack(alignment: .trailing){
                    Text(location.temp)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                    Text(" ")
                    HStack{
                        Text("H:" + location.max)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("L:" + location.min)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

struct Location: Hashable {
    var back: String
    var city: String
    var time: String
    var temp: String
    var max: String
    var min: String
    var tempString: String
}

struct searchBar: View{
    @Binding var text: String
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Pesquisar", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding(.horizontal)
    }
}

struct BodyContent: View{
    @State private var text: String = ""
    var locations: [Location] = [Location(back: "back", city: "Punta Cana", time: "09:30", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "Canada", time: "06:07", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "Portugal", time: "18:37", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "England",time: "08:59", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "Brazil",time: "22:08", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "POA", time: "18:34", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "Bento Goncalves", time: "20:40",temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "back", city: "Caribe",time: "03:07", temp: "27º", max: "10", min: "10", tempString: "cloudy")]
    
    var body: some View{
        NavigationStack {
            VStack{
                    List(locations, id: \.self){ location in
                        TempoCidades(location: location)
                            .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                    .navigationTitle("Weather")
                    .searchable(text: $text)
            }
        }
    }
}

#Preview {
    BodyContent()
}
