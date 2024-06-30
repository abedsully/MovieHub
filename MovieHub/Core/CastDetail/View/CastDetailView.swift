//
//  CastDetailView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import SwiftUI

struct CastDetailView: View {
    @ObservedObject var viewModel: CastDetailViewModel
    
    var cast: Cast {
        return viewModel.cast
    }
    
    var detail: CastDetail {
        return viewModel.castDetail ?? CastDetail.MOCK_CASTDETAIL[0]
    }
    
    init(cast: Cast){
        self.viewModel = CastDetailViewModel(cast: cast)
    }
    
    var body: some View {
        VStack {
            Text(detail.name)
            Text(detail.biography)
        }
    }
}

#Preview {
    CastDetailView(cast: Cast.MOCK_CAST[0])
}
