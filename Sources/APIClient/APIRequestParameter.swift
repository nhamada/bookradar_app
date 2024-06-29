//
//  APIRequestParameter.swift
//  
//
//  Created by Naohiro Hamada on 2024/06/04.
//

import Foundation

/**
 * APIリクエスト クエリーパラメーター
 */
public protocol APIRequestQueryParameter {
    /**
     * クエリーパラメーター
     */
    var items: [URLQueryItem] { get }
}

/**
 * APIリクエスト ボディデータ
 */
public protocol APIRequestBodyParameter {
    /**
     * ボディのデータ
     */
    var data: Data { get }
}
