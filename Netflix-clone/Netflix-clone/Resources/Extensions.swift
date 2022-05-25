//
//  Extensions.swift
//  Netflix-clone
//
//  Created by Utkarsh Upadhyay on 20/05/22.
//

import Foundation

extension String {
    func capitalizedFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
