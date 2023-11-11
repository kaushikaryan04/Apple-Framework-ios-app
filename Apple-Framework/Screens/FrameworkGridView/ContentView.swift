//
//  ContentView.swift
//  Apple-Framework
//
//  Created by Aryan Kaushik on 02/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    
    let columns :[GridItem] = [GridItem(.flexible()) , GridItem(.flexible()),
    GridItem(.flexible())
    ]
    var body: some View {
        NavigationView{
            //            BackgroundColorView()
            ScrollView{
                LazyVGrid(columns:columns) {
                    ForEach(MockData.frameworks){ data in
                        FrameworkTitleView(data: data)
                            .onTapGesture {
                                viewModel.selectedFramework = data 
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .fullScreenCover(isPresented: $viewModel.isShowingDetailView , content: {
                // ?? refers to
                // try this if not null ?? do this if null
                FrameworkDetailView(data: viewModel.selectedFramework ?? MockData.frameworks[1] , isShowingDetailView: $viewModel.isShowingDetailView)
            })




        }
        
        
    }
}

#Preview {
    ContentView()
}
struct BackgroundColorView : View {
    var body: some View {
        LinearGradient(colors: [Color.black , Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct FrameworkTitleView: View {
    let data : Framework
    var body: some View {
        VStack{
            Image(data.imageName)
                .resizable()
                .frame(width: 90 , height:90)
            Text(data.name)
                .font(.title2)
                .fontWeight(.semibold )
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }.padding()
        
    }
}
