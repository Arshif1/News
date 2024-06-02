//
//  DetailView.swift
//  News
//
//  Created by Arshif on 02/06/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let item: ArticleDetailItem
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                imageView
                contentView
            }
            titleView
                .background(Color.titleViewBackgroundColor, in: RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
                .frame(height: 140)
        }
    }
    
    private var imageView: some View {
        Color.black
    }
    
    private var contentView: some View {
        ZStack {
            Color.white
            ScrollView(showsIndicators: false) {
                Text(item.content)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 86)
        }
    }
    
    private var titleView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.date)
                    .font(.system(size: 10, weight: .light, design: .serif))
                Spacer()
                Text(item.title)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                Spacer()
                Text(item.publishedBy)
                    .font(.system(size: 10, weight: .medium, design: .serif))

            }
            .padding(.leading)
            .padding(.top)
            .padding(.bottom)
            Spacer()
        }
    }
}

#Preview {
    ArticleDetailView(item: ArticleDetailItem.create())
}

private extension ArticleDetailItem {
    static func create() -> ArticleDetailItem {
        
        ArticleDetailItem(date: "Sunday, 9 May 2021",
                          title: "Crypto investors should be prepared to lose all their money, BOE governor says",
                          publishedBy: "Published by Ryan Browne",
                          content: "LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\nDigital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward $20,000, only to sink as low as $3,122 a year later.\nAsked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”\n“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”\nBailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.\n“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.\n“If consumers invest in these types of product, they should be prepared to lose all their money.”\nBailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”"
        )
    }
}
