//
//  JourneysView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 04/08/26.
//

import SwiftUI

struct JourneysView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: EmptyView()) {
                rowContent(
                    icon: "plus.circle",
                    title: "Create a group",
                    subtitle: "I want to create a group and invite my friends to join"
                )
            }
            .buttonStyle(.plain)

            Divider()

            NavigationLink(destination: EmptyView()) {
                rowContent(
                    icon: "person.3.fill",
                    title: "Join a group",
                    subtitle: "Someone invited me, and I want to join a group"
                )
            }
            .buttonStyle(.plain)

            Divider()

            NavigationLink(destination: EmptyView()) {
                rowContent(
                    icon: "person.fill",
                    title: "Go solo",
                    subtitle: "I want to use the app by myself for now"
                )
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
        .background(Color(.tertiarySystemFill))
    }

    private func rowContent(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .frame(width: 40)
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.custom("ElmsSans-Bold", size: 22))
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(.custom("ElmsSans-Medium", size: 16))
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        JourneysView()
    }
}
