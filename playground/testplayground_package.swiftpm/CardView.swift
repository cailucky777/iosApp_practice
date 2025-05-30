import SwiftUI
import PlayingCard

extension Suit {
    /// 根据花色返回红或黑
    var color: Color {
        switch self {
        case .hearts, .diamonds:
            return .red
        default:
            return .black
        }
    }
}

struct CardView: View {
    let card: PlayingCard
    
    var body: some View {
        ZStack {
            // 背景 + 描边 + 阴影
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .shadow(radius: 3)
            
            VStack {
                // 角标：左上小点数 + 花色
                HStack {
                    Text("\(card.rank.rawValue)")
                    Text(card.suit.rawValue)
                }
                .font(.caption)
                .foregroundColor(card.suit.color)
                
                Spacer()
                
                // 中心超大花色
                Text(card.suit.rawValue)
                    .font(.system(size: 60))
                    .foregroundColor(card.suit.color)
                
                Spacer()
                
                // 角标：右下小花色 + 点数（翻转）
                HStack {
                    Spacer()
                    Text(card.suit.rawValue)
                    Text("\(card.rank.rawValue)")
                        .rotationEffect(.degrees(180))
                }
                .font(.caption)
                .foregroundColor(card.suit.color)
            }
            .padding(12)
        }
        // 保持 2:3 的扑克牌比例
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CardView(card: PlayingCard(rank: .ace, suit: .spades))
            CardView(card: PlayingCard(rank: .ten, suit: .hearts))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

