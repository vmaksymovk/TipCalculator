//
//  HistoryModel.swift
//  TipCalculator
//
//  Created by Влад on 2/3/24.
//

import Foundation

class UserData : ObservableObject{
    @Published var DictionaryForHistory : [Date:String] = [:]
}
