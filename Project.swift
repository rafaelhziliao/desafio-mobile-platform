import ProjectDescription

// MARK: - Constants

let appName = "desafio"
let organizationName = "OLX"
let bundleIdPrefix = "br.com.olx."
let deploymentVersion = "14.4"

// MARK: - Build Settings

let settings = Settings(defaultSettings: .recommended)

// MARK: - Deployment Target

let deploymentTarget = DeploymentTarget.iOS(targetVersion: deploymentVersion, devices: [.iphone, .ipad])

// MARK: - Build Schemes

let schemes: [Scheme] = [
    Scheme(
        name: appName,
        shared: true,
        buildAction: BuildAction(
            targets: [
                TargetReference(stringLiteral: "\(appName)"),
                TargetReference(stringLiteral: "\(appName)Tests"),
                TargetReference(stringLiteral: "\(appName)UITests")
            ]
        ),
        testAction: TestAction(
            targets: [TestableTarget(stringLiteral: "\(appName)Tests"), TestableTarget(stringLiteral: "\(appName)UITests")],
            configurationName: "Debug"
        ),
        runAction: RunAction(configurationName: "Debug"),
        archiveAction: ArchiveAction(configurationName: "Release"),
        profileAction: ProfileAction(configurationName: "Release"),
        analyzeAction: AnalyzeAction(configurationName: "Debug")
    )
]

// MARK: - Resources

let appResources: [FileElement] = [
    .folderReference(path: "Sources/\(appName)/Resources/Assets.xcassets"),
    .glob(pattern: "Sources/\(appName)/**/*.xib"),
    .glob(pattern: "Sources/\(appName)/**/*.storyboard")

//    .glob(pattern: "\(appName)/Resources/*.lproj/*"),
//    .glob(pattern: "\(appName)/Resources/xcconfig/General.xcconfig"),
//    .glob(pattern: "\(appName)/Resources/Entitlements/**"),
//    .glob(pattern: "\(appName)/Resources/Font/**"),
//    .glob(pattern: "\(appName)/Resources/Firebase/**"),

//    .folderReference(path: "\(appName)/Resources/Assets.xcassets"),
]


// MARK: - Build Phases

let appRunScripts: [TargetAction] = [
//    .post(path: "Scripts/swiftlint.sh", name: "SwiftLint Script"),
//    .post(path: "Scripts/multi_sim.sh", name: "Simulators Script"),
//    .post(path: "Scripts/remove_unused_archs.sh", name: "Remove Unused Architectures Script"),
//    .post(path: "Scripts/crashlytics.sh", name: "Firebase Crashlytics")
]

// MARK: - Project

let project = Project(
    name: appName,
    organizationName: organizationName,
    settings: settings,
    targets: [
        Target(
            name: appName,
            platform: .iOS,
            product: .app,
            bundleId: "\(bundleIdPrefix)\(appName)",
            deploymentTarget: deploymentTarget,
            infoPlist: .file(path: "Sources/\(appName)/Resources/Properties/Info.plist"),
            sources: ["Sources/\(appName)/**/*.swift"],
            resources: appResources,
            actions: appRunScripts
        ),
        
        Target(
            name: "\(appName)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(bundleIdPrefix)\(appName)Tests",
            infoPlist: .file(path: "Sources/\(appName)Tests/Info.plist"),
            sources: ["Sources/\(appName)Tests/**"],
            dependencies: [.target(name: appName)]
        ),
        
        Target(
            name: "\(appName)UITests",
            platform: .iOS,
            product: .uiTests,
            bundleId: "\(bundleIdPrefix)\(appName)UITests",
            infoPlist: .file(path: "Sources/\(appName)UITests/Info.plist"),
            sources: ["Sources/\(appName)UITests/**"],
            dependencies: [.target(name: appName)]
        ),

    ],
    schemes: schemes
)
