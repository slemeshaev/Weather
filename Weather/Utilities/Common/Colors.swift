//
//  Colors.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

struct Color {
    private init() {}
    
    // MARK: - ContentPrimary
    struct ContentPrimary {
        private init() {}
        
        static var background: UIColor { "w.content.primary".uiColor }
        static var primaryBackground: UIColor { "w.content.primary.background".uiColor }
        static var button: UIColor { "w.content.background.button".uiColor }
        static var placeholder: UIColor { "w.content.background".uiColor }
        
        // MARK: - Text
        struct Text {
            private init() {}
            
            static var title: UIColor { "w.content.primary.text.title".uiColor }
            static var subtitle: UIColor { "w.content.primary.text.subtitle".uiColor }
            static var text: UIColor { "w.content.primary.text".uiColor }
        }
    }
    
    // MARK: - ContentSecondary
    struct ContentSecondary {
        private init() {}
        
        // MARK: - Text
        struct Text {
            private init() {}
            
            static var title: UIColor { "w.content.secondary.text.title".uiColor }
        }
    }
    
    // MARK: - GradientPrimary
    struct GradientPrimary {
        private init() {}
        
        static var startColor: UIColor { "w.gradient.startColor".uiColor }
        static var endColor: UIColor { "w.gradient.endColor".uiColor }
    }
}
