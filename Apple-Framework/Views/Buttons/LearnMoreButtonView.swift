//
//  LearnMoreButtonView.swift
//  Apple-Framework
//
//  Created by Aryan Kaushik on 08/11/23.
//

import SwiftUI

struct LearnMoreButtonView: View {
    let title : String
    var body: some View {
        Text(title)
            .frame(width: 200 , height:50)
        //                .background(.)
            .font(.title2)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    LearnMoreButtonView(title:"Learn More")
}
