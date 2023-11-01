//
//  TempoCidades.swift
//  tempo
//
//  Isadora Guerra e Debora Pierosan
//

import SwiftUI

struct TempoCidades: View {
    @State private var searchText = ""
    var location: Location
    var body: some View {
        ZStack(){
            Image(location.back)
                .resizable()
                .frame(height: 120)
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
                Spacer()//.frame(width: 110)
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
            .frame(maxWidth: .infinity)
            .padding()

        }
        .padding(.horizontal)
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
    @Environment(\.dismiss) var dismiss
    @State var tap: Bool = false
    @State private var text: String = ""
    var locations: [Location] = [Location(back: "sunny", city: "Punta Cana", time: "09:30", temp: "27º", max: "10", min: "10", tempString: "sunny"), Location(back: "flash", city: "Toronto", time: "18:39", temp: "04º", max: "10", min: "10", tempString: "storm"), Location(back: "snow", city: "Kraków", time: "00:06", temp: "10º", max: "14", min: "7", tempString: "flurries"), Location(back: "rising", city: "Los Andes",time: "20:13", temp: "15º", max: "22", min: "9", tempString: "rising"), Location(back: "storm", city: "Lima",time: "22:08", temp: "20º", max: "24", min: "17", tempString: "storm"), Location(back: "sunny", city: "POA", time: "18:34", temp: "27º", max: "10", min: "10", tempString: "cloudy"), Location(back: "nice", city: "Bento Goncalves", time: "20:40",temp: "7º", max: "8", min: "13", tempString: "partly cloudy"), Location(back: "night", city: "Bagé",time: "03:07", temp: "16º", max: "10", min: "10", tempString: "night")]
    
    var filteredLocations: [Location] {
        if text.isEmpty {
            return locations
        } else {
            return locations.filter { location in
                return location.city.lowercased().contains(text.lowercased())
            }
        }
    }
    
    var body: some View{
            NavigationStack {
                ScrollView{
                    ForEach(filteredLocations, id: \.self){ location in
                        NavigationLink {
                            WeatherMain()
                        } label: {
                            TempoCidades(location: location)
                                .listRowBackground(Color.clear)
                                .padding(0)
                                .contentMargins(0)
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
                .searchable(text: $text)
                    .navigationTitle("Weather")
        }
//            .navigationViewStyle(.stack)
//        .sheet(isPresented:$tap, content:{
//            WeatherMain()
//        })
    }
}

#Preview {
    BodyContent()
}
