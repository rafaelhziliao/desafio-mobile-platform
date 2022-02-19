import ProjectDescription

// MARK: - Constants

let appName = "desafio"
let organizationName = "OLX"
let bundleIdPrefix = "br.com.olx."
let deploymentVersion = "14.4"

// MARK: - Build Settings

let settings: Settings = .settings()

// MARK: - Deployment Target

let deploymentTarget: DeploymentTarget = .iOS(targetVersion: deploymentVersion, devices: [.iphone, .ipad])

// MARK: - Actions

let buildAction: BuildAction = .buildAction(targets: [.init(stringLiteral: "\(appName)")])
let testAction: TestAction = .targets(
    [
        .init(stringLiteral: "\(appName)Tests"),
        .init(stringLiteral: "\(appName)UITests")
    ],
    configuration: .debug
)

let runAction: RunAction = .runAction(configuration: .debug)
let archiveAction: ArchiveAction = .archiveAction(configuration: .release)
let profileAction: ProfileAction = .profileAction(configuration: .release)
let analyzeAction: AnalyzeAction = .analyzeAction(configuration: .debug)

// MARK: - Build Schemes

let schemes: [Scheme] = [
    Scheme(
        name: appName,
        shared: true,
        buildAction: buildAction,
        testAction: testAction,
        runAction: runAction,
        archiveAction: archiveAction,
        profileAction: profileAction,
        analyzeAction: analyzeAction
    )
]

// MARK: - Resources

let appResources: ResourceFileElements =
[
    .folderReference(path: "Sources/\(appName)/Resources/Assets/Assets.xcassets"),
    .glob(pattern: "Sources/\(appName)/**/*.xib"),
    .glob(pattern: "Sources/\(appName)/**/*.storyboard")
]

let testResources: ResourceFileElements = [
    .glob(pattern: "Sources/\(appName)Tests/Resources/**/*.json")
]

// MARK: - Dependencies

let appDependencies: [TargetDependency] = [
    .project(target: "NetworkLayer", path: "Modules/NetworkLayer")
]

// MARK: - Build Phases

let appRunScripts: [TargetScript] = [
    .pre(path: "Scripts/swiftlint.sh", name: "SwiftLint Script")
]

// MARK: - Targets

let targets: [Target] = [
    Target(
        name: appName,
        platform: .iOS,
        product: .app,
        bundleId: "\(bundleIdPrefix)\(appName)",
        deploymentTarget: deploymentTarget,
        infoPlist: .file(path: "Sources/\(appName)/Resources/Properties/Info.plist"),
        sources: ["Sources/\(appName)/**/*.swift"],
        resources: appResources,
        scripts: appRunScripts,
        dependencies: appDependencies
    ),
    
    Target(
        name: "\(appName)Tests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(bundleIdPrefix)\(appName)Tests",
        infoPlist: .file(path: "Sources/\(appName)Tests/Info.plist"),
        sources: ["Sources/\(appName)Tests/**"],
        resources: testResources,
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
    )
]

// MARK: - Project

let project = Project(
    name: appName,
    organizationName: organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
