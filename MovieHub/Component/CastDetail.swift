//
//  MovieCastDetail.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/28/24.
//

import SwiftUI

struct CastDetail: View {
    let cast: Cast
    
    var body: some View {
        VStack {
            if let profilePath = cast.profile_path, !profilePath.isEmpty {
                AsyncImage(url: cast.profileURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.gray)
            }
            
            Text(cast.name)
                .font(.footnote)
                .fontWeight(.medium)
            
            Text(cast.character)
                .font(.caption)
        }
        .frame(width: 90)
        .lineLimit(1)
        .truncationMode(.tail)
    }
}

struct MovieCastDetail_Previews: PreviewProvider {
    static var previews: some View {
        CastDetail(cast: Cast.MOCK_CAST[0])
    }
}

