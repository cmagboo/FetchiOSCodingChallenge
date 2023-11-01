//
//  StringUtil.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//

import Foundation

extension String {
    func isTrimmedEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
