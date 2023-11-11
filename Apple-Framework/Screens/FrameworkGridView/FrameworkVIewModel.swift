//
//  FrameworkVIewModel.swift
//  Apple-Framework
//
//  Created by Aryan Kaushik on 08/11/23.
//

import SwiftUI

final class FrameworkGridViewModel : ObservableObject{
    
    var selectedFramework : Framework? {
        didSet{
            // whenever selectedFramework changes from null to something isShowingDetail will change to true 
            isShowingDetailView = true
        }
    }
   @Published var isShowingDetailView : Bool = false

    
}
