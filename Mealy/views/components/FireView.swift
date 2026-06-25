//import SwiftUI
//
//// MARK: - Brasa individual com delay escalonado
//struct EmberView: View {
//    let index: Int
//    @State private var active = false
//
//    private var duration: Double  { 1.6 + Double(index % 5) * 0.35 }
//    private var delay:    Double  { Double(index) * 0.37 }
//    private var size:     CGFloat { CGFloat(3 + index % 4) }
//    private var driftX:   CGFloat {
//        let mag = CGFloat(8 + (index % 4) * 6)
//        return index % 2 == 0 ? mag : -mag
//    }
//    private var startX: CGFloat {
//        CGFloat(sin(Double(index) * 2.5) * 28)
//    }
//
//    private var startY: CGFloat {
//        -CGFloat((index % 4) * 14) - CGFloat((index / 4) * 6)
//    }
//
//    var body: some View {
//        Circle()
//            .fill(Color(hex: "#FFD37A"))
//            .frame(width: size, height: size)
//            .offset(
//                x: startX + (active ? driftX * 0.25 : 0),
//                y: startY + (active ? -8 : 4)
//            )
//            .opacity(active ? 0.82 : 0.42)
//            .scaleEffect(active ? 1.05 : 0.75)
//            .animation(
//                .easeInOut(duration: duration)
//                    .delay(delay)
//                    .repeatForever(autoreverses: true),
//                value: active
//            )
//            .onAppear { active = true }
//    }
//}
//
//// MARK: - Fogo
//struct FireAnimationView: View {
//    // Uma variável por camada → velocidades independentes
//    @State private var baseFlicker = false   // 1.8s — lento, blurred
//    @State private var midFlicker  = false   // 1.4s — corpo
//    @State private var topFlicker  = false   // 1.1s — ponta dourada, rotaciona
//
//    var body: some View {
//        ZStack {
//
//            // ── Fundo escuro ────────────────────────────────────────
//            RadialGradient(
//                colors: [Color(hex: "#1A0800"), Color(hex: "#0D0300"), .black],
//                center: .bottom, startRadius: 0, endRadius: 420
//            )
//            .ignoresSafeArea()
//
//            // ── Ground glow ─────────────────────────────────────────
//            Ellipse()
//                .fill(Color(hex: "#FBA61F").opacity(0.35))
//                .frame(width: 260, height: 60)
//                .blur(radius: 18)
//                .offset(y: 140)
//
//            // ── Glow ambiente ────────────────────────────────────────
//            RadialGradient(
//                colors: [
//                    Color(hex: "#FB640A").opacity(0.22),
//                    Color(hex: "#FB3C05").opacity(0.08),
//                    .clear
//                ],
//                center: UnitPoint(x: 0.5, y: 0.6),
//                startRadius: 0, endRadius: 200
//            )
//            .frame(width: 340, height: 380)
//            .blur(radius: 32)
//
//            // ── Brasas ───────────────────────────────────────────────
//            ZStack {
//                ForEach(0..<10, id: \.self) { i in
//                    EmberView(index: i)
//                }
//            }
//            .frame(width: 150, height: 130)
//            .offset(x: -58, y: -190) // acima e à esquerda da chama
//
//            // ── Camadas da chama ─────────────────────────────────────
//            ZStack {
//
//                // Halo ambiente atrás da chama, sem tocar na base nítida
//                Image("BlurBackground")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 250, height: 250)
//                    .opacity(baseFlicker ? 0.32 : 0.22)
//                    .scaleEffect(baseFlicker ? 1.04 : 0.98)
//                    .offset(y: 30)
//                    .animation(
//                        .easeInOut(duration: 1.8).repeatForever(autoreverses: true),
//                        value: baseFlicker
//                    )
//
//                // Brilho baixo separado, menor e atrás do desenho
//                Image("BlurBase")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 230, height: 80)
//                    .opacity(baseFlicker ? 0.34 : 0.22)
//                    .scaleEffect(x: baseFlicker ? 1.04 : 0.98, y: baseFlicker ? 0.96 : 1.02)
//                    .offset(y: 118)
//                    .animation(
//                        .easeInOut(duration: 1.8).repeatForever(autoreverses: true),
//                        value: baseFlicker
//                    )
//
//                // Chama externa laranja nítida, como no design original
//                Image("FireBackground")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 280, height: 360)
//                    .opacity(1)
//                    .scaleEffect(
//                        x: midFlicker ? 1.012 : 0.996,
//                        y: midFlicker ? 0.996 : 1.012
//                    )
//                    .animation(
//                        .easeInOut(duration: 1.4).repeatForever(autoreverses: true),
//                        value: midFlicker
//                    )
//
//                // Chama interna amarela nítida por cima
//                Image("Fire")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 220, height: 295)
//                    .opacity(topFlicker ? 1.0 : 0.96)
//                    .scaleEffect(
//                        x: topFlicker ? 1.01 : 0.995,
//                        y: topFlicker ? 0.995 : 1.01
//                    )
//                    .offset(y: 36)
//                    .animation(
//                        .easeInOut(duration: 1.1).repeatForever(autoreverses: true),
//                        value: topFlicker
//                    )
//            }
//            .offset(y: -4)
//        }
//        .onAppear {
//            baseFlicker = true
//            midFlicker  = true
//            topFlicker  = true
//        }
//    }
//}
//
//// MARK: - Helper hex color
//extension Color {
//    init(hex: String) {
//        let h = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
//        var val: UInt64 = 0
//        Scanner(string: h).scanHexInt64(&val)
//        self.init(
//            red:   Double((val >> 16) & 0xFF) / 255,
//            green: Double((val >> 8)  & 0xFF) / 255,
//            blue:  Double( val        & 0xFF) / 255
//        )
//    }
//}
//
//
//#Preview {
//    FireAnimationView()
//}
