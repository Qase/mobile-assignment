//
//  AppTheme.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import SwiftUI
import UIKit

public enum AppTheme {

    /// Defines all the colors used in the app in a semantic way
    public enum Colors {
        
        // Main colors
        public static let mainPink = Asset.Colors.mainPink.color
        public static let black = Color.black
        
        // Navigation bar
        public static let navBarTitle = Asset.Colors.mainText.color
        
        // Backgrounds
        public static let bgGradientDark = Asset.Colors.bgGradientDark.color
        public static let bgGradientDarker = Asset.Colors.bgGradientDarker.color
        public static let itemGradientDark = Asset.Colors.itemGradientDark.color
        public static let itemGradientDarker = Asset.Colors.itemGradientDarker.color
    
        // Gradients
        public static let bgGradient = [
            Color(Asset.Colors.bgGradientDark.uiColor),
            Color(Asset.Colors.bgGradientDarker.uiColor)
        ]
        
        public static let itemGradient = [
            Color(Asset.Colors.itemGradientDark.uiColor),
            Color(Asset.Colors.itemGradientDarker.uiColor)
        ]
        
        // Texts
        public static let text = Asset.Colors.mainText.color
        
        // Text fields
        public static let textFieldTitle = Color(UIColor.systemGray)
        public static let textFieldBorder = Color(UIColor.systemGray4)
        
        // ProgressView
        public static let progressView = Asset.Colors.mainPink.color
        
        // Toast
        public static let toastSuccessColor = Color(Asset.Colors.success.uiColor)
        public static let toastErrorColor = Color(Asset.Colors.error.uiColor)
        public static let toastInfoColor = Color(Asset.Colors.info.uiColor)
    }
    
    /// Defines all the fonts used in the app in a semantic way
    public enum Fonts {
        
        // Text
        public static let headlineText = Font.custom("Helvetica", size: 34).bold()
        public static let headlineTextSmall = Font.custom("Helvetica", size: 20).bold()
        public static let bodyText = Font.custom("Helvetica", size: 16)
        public static let bodyTextBold = Font.custom("Helvetica", size: 16).bold()
        public static let bodyTextSmall = Font.custom("Helvetica", size: 12)
        
        // Views
        public static let cellLargeTitle = Font.custom("Helvetica", size: 32).bold()
        
        // Text fields
        public static let textFieldText = Font.system(size: 17.0, weight: .medium)
        public static let textFieldTitle = Font.system(size: 14.0, weight: .regular)
        
        // Buttons
        public static let photoButton = Font.custom("Helvetica", size: 12)
        
        // Toast message
        public static let toastMessage = Font.custom("Helvetica", size: 12)
    }
    
    /// Defines all the icon used in the app in a semantic way
    public enum Images {
        public static let rocketFlyingIcon = Image(uiImage: Asset.Images.rocketFlyingIcon.uiImage)
        public static let rocketIdleIcon = Image(uiImage: Asset.Images.rocketIdleIcon.uiImage)
        public static let rocketIcon = Image(uiImage: Asset.Images.rocketIcon.uiImage)
        public static let chevronRightIcon = Image(uiImage: Asset.Images.chevronRightIcon.uiImage)
        public static let backgroundImage = Image(uiImage: Asset.Images.background.uiImage)
        
        // Rocket stages icons
        public static let reusableIcon = Image(uiImage: Asset.Images.reusableIcon.uiImage)
        public static let enginesIcon = Image(uiImage: Asset.Images.engineIcon.uiImage)
        public static let fuelAmountIcon = Image(uiImage: Asset.Images.fuelIcon.uiImage)
        public static let burnTimeIcon = Image(uiImage: Asset.Images.burnIcon.uiImage)
        
        // System icons
        public static let xMarkIcon = Image(systemName: "xmark")
        public static let chevronBackIcon = Image(systemName: "chevron.backward")
        public static let cameraIcon = Image(systemName: "camera")
        public static let infoIcon = Image(systemName: "info.circle")
    }
}

