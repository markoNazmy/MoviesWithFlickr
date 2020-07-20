//
//  MovieDetailsModelsMocks.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

var photosResponse1 = PhotosResponse(photos: Photos(page: 1,
                                                    pages: 2,
                                                    perpage: 5,
                                                    total: "10",
                                                    photo: [Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0)]),
                                     stat: "")

var photosResponse2 = PhotosResponse(photos: Photos(page: 2,
                                                    pages: 2,
                                                    perpage: 5,
                                                    total: "10",
                                                    photo: [Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0),
                                                            Photo(id: "", owner: "", secret: "", server: "", farm: 0, title: "", ispublic: 1, isfriend: 1, isfamily: 0)]),
                                     stat: "")

var photosEmptyResponse = PhotosResponse(photos: Photos(page: 0,
                                                        pages: 0,
                                                        perpage: 0,
                                                        total: "0",
                                                        photo: nil),
                                         stat: "")

var photosURLS = ["https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example", "https//example"]

var emptyPhotosURLS: [String] = []
