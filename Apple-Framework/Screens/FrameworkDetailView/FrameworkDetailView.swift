//
//  FrameworkDetailView.swift
//  Apple-Framework
//
//  Created by Aryan Kaushik on 08/11/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    let data : Framework
    @Binding var isShowingDetailView : Bool
    @State private var isShowingSafariView = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailView = false 
                    
                }label:{
                        Image(systemName: "xmark")
                        .foregroundColor(  Color(.label))
                        .imageScale(.large)
                        .frame(width: 44 , height: 44)
                }
            }.padding()

            Spacer()
            FrameworkTitleView(data: data)
            Text(data.description)
                .padding()
                .font(.system(size : 17 ,weight: .light))
            Spacer()
            Button(action: {
                isShowingSafariView = true
            }, label: {
                LearnMoreButtonView(title:"Learn More")
            })
            .sheet(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string:data.urlString) ?? URL(string:"www.google.co.in")!)
            })
        }
    }}

#Preview {
    FrameworkDetailView(data: MockData.frameworks[0] , isShowingDetailView: .constant(false) )
}
