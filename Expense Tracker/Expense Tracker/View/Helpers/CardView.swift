//
//  CardView.swift
//  Expense Tracker
//
//  Created by Sean Veal on 3/4/24.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var expense: Double
    
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0, content: {
                HStack(spacing: 12, content: {
                    Text("\(currensyString(income - expense))")
                        .font(.title.bold())
                    
                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .red : .green)
                })
                .padding(.bottom, 25)
                
                HStack(spacing: 0, content: {
                    ForEach(Category.allCases, id: \.rawValue) { category in
                        let symbolImage = category == .income ? "arrow.down" : "arrow.up"
                        let tint = category == .income ? Color.green : Color.red
                        
                        HStack(spacing: 10, content: {
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(tint)
                                .frame(width: 35, height: 35)
                                .background {
                                    Circle()
                                        .fill(tint.opacity(0.25).gradient)
                                }
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text(category.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                
                                Text(currensyString(category == .income ? income : expense, allowedDigits: 0))
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                            })
                            
                            if category == .income {
                                Spacer(minLength: 10)
                            }
                        })
                    }
                })
            })
            .padding([.horizontal, .bottom], 25)
            .padding(.top, 15)
        })
    }
}

#Preview {
    ScrollView {
        CardView(income: 4590, expense: 2389)
    }
}
