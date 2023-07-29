//
//  Home.swift
//  Currency Converter
//
//  Created by Bamantara S on 19/07/23.
//

import SwiftUI

struct Home: View {
    @State private var hasilAPI: CurrencyAPI?
    @State var fromChoiceMade = "From"
    @State var fromChoiceFlag = ""
    @State var toChoiceMade = "To"
    @State var toChoiceFlag = ""
    @State private var jumlah: String = ""
    @State var textFrom = ""
    @State var textResult = ""
    
    
    var body: some View {
        VStack(spacing: 48) {
            Text("Currency Converter")
                .font(.system(size: 32, weight: .semibold))
            VStack(spacing: 48) {
                VStack(spacing: 24) {
                    HStack {
                        TextField("Input ammount here...", text: $jumlah)
                            .onChange(of: jumlah) { newValue in
                                Task {
                                    do {
                                        hasilAPI = try await getPrice()
                                        } catch CoinError.invalidURL {
                                            print("invalid URL")
                                        } catch CoinError.invalidResponse {
                                            print("invalid Response")
                                        } catch CoinError.invalidData {
                                            print("invalid Data")
                                        } catch {
                                            print("Unexpected Errors")
                                        }
                                    }
                            }
                            .frame(height: 40)
                            .keyboardType(.decimalPad)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1.0)
                                    .opacity(0.3)
                            )
                        Menu {
                            Button(action: {
                                fromChoiceMade = "CNY"
                                fromChoiceFlag = "CN"
                                textFrom = "China Yuan"
                            }, label: {
                                Text("CNY")
                                Image("CN")
                            })
                            Button(action: {
                                fromChoiceMade = "IDR"
                                fromChoiceFlag = "ID"
                                textFrom = "Indonesian Rupiah"
                            }, label: {
                                Text("IDR")
                                Image("ID")
                            })
                            Button(action: {
                                fromChoiceMade = "INR"
                                fromChoiceFlag = "IN"
                                textFrom = "Indian Rupee"
                            }, label: {
                                Text("INR")
                                Image("IN")
                            })
                            Button(action: {
                                fromChoiceMade = "JPY"
                                fromChoiceFlag = "JP"
                                textFrom = "Japan Yen"
                            }, label: {
                                Text("JPY")
                                Image("JP")
                            })
                            Button(action: {
                                fromChoiceMade = "KRW"
                                fromChoiceFlag = "KR"
                                textFrom = "Korean Won"
                            }, label: {
                                Text("KRW")
                                Image("KR")
                            })
                            Button(action: {
                                fromChoiceMade = "USD"
                                fromChoiceFlag = "US"
                                textFrom = "US Dollar"
                            }, label: {
                                Text("USD")
                                Image("US")
                            })
                        } label: {
                            Label(
                                title: {Text(fromChoiceMade)},
                                icon: {
                                    Image(fromChoiceFlag)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                }
                            )
                        }
                        .frame(width: 106, height: 40)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .opacity(0.3)
                        )
                    }
                    HStack {
                        Text((String(format: "%.2f", hasilAPI?.rates["\(toChoiceMade)"] ?? 0.0)))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1.0)
                                    .opacity(0.3)
                            )
                        Menu {
                            Button(action: {
                                toChoiceMade = "CNY"
                                toChoiceFlag = "CN"
                                textResult = "China Yuan"
                            }, label: {
                                Text("CNY")
                                Image("CN")
                            })
                            Button(action: {
                                toChoiceMade = "IDR"
                                toChoiceFlag = "ID"
                                textResult = "Indonesian Rupiah"
                            }, label: {
                                Text("IDR")
                                Image("ID")
                            })
                            Button(action: {
                                toChoiceMade = "INR"
                                toChoiceFlag = "IN"
                                textResult = "Indian Rupee"
                            }, label: {
                                Text("INR")
                                Image("IN")
                            })
                            Button(action: {
                                toChoiceMade = "JPY"
                                toChoiceFlag = "JP"
                                textResult = "Japan Yen"
                            }, label: {
                                Text("JPY")
                                Image("JP")
                            })
                            Button(action: {
                                toChoiceMade = "KRW"
                                toChoiceFlag = "KR"
                                textResult = "Korean Won"
                            }, label: {
                                Text("KRW")
                                Image("KR")
                            })
                            Button(action: {
                                toChoiceMade = "USD"
                                toChoiceFlag = "US"
                                textResult = "US Dollar"
                            }, label: {
                                Text("USD")
                                Image("US")
                            })
                        } label: {
                            Label(
                                title: {Text(toChoiceMade)},
                                icon: {
                                    Image(toChoiceFlag)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                }
                            )
                        }
                        .frame(width: 106, height: 40)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        .cornerRadius(4)
                        .opacity(1.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .opacity(0.3)
                        )
                    }
                }
            }
            VStack(spacing: 16) {
                Text("\(jumlah) \(textFrom) equals")
                    .font(.system(size: 14, weight: .semibold))
                    .opacity(0.6)
                Text(" \(String(format: "%.2f", hasilAPI?.rates["\(toChoiceMade)"] ?? 0.0)) \(textResult)")
                    .font(.system(size: 24, weight: .semibold))
            }
            Menu {
                Button {
                    // do something
                } label: {
                    Text("Linear")
                    Image(systemName: "arrow.down.right.circle")
                }
                Button {
                    // do something
                } label: {
                    Text("Radial")
                    Image(systemName: "arrow.up.and.down.circle")
                }
            } label: {
                 Text("Style")
                    .foregroundColor(.white)
                 Image(systemName: "tag.circle")
                    .foregroundColor(.white)
            }
        }
        .accentColor(Color("Color"))
        .padding(.horizontal, 32)
    }
    
    func getPrice() async throws -> CurrencyAPI {
        let apikey = "https://api.exchangerate.host/latest?base=usd&amount=\(jumlah)"
        guard let url = URL(string: apikey) else {
            throw CoinError.invalidURL
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CoinError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CurrencyAPI.self, from: data)
            
        } catch {
            throw CoinError.invalidData
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
