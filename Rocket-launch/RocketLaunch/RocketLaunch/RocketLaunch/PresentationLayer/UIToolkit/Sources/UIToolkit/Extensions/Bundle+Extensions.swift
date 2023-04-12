//
//  Bundle+Extensions.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import Foundation

extension Bundle {
    /// Workaround for crashing SwiftUI Previews when any of underlying modules uses .module
    /// Taken from: https://developer.apple.com/forums/thread/664295
    static var myModule: Bundle = {
        /* The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS. You may have same PackageName and TargetName*/
        let bundleNameIOS = "LocalPackages_UIToolkit"
        let bundleNameMacOs = "UIToolkit_UIToolkit"
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: BundleToken.self).resourceURL,
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: BundleToken.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: BundleToken.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
        ]
        
        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            let bundlePathMacOS = candidate?.appendingPathComponent(bundleNameMacOs + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            } else if let bundle = bundlePathMacOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle")
    }()
}

/// Get app info
public extension Bundle {

    var appName: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }

    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

}

private final class BundleToken {}
