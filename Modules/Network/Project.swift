import ProjectDescription

// MARK: - Constants

let frameworkName = "Network"
let organizationName = "OLX"
let bundleIdPrefix = "br.com.olx."
let deploymentVersion = "14.4"

// MARK: - Build Settings

let settings = Settings(defaultSettings: .recommended)

// MARK: - Deployment Target

let deploymentTarget: DeploymentTarget = .iOS(targetVersion: deploymentVersion, devices: [.iphone, .ipad])

// MARK: - Build Schemes

let schemes: [Scheme] = [
    Scheme(
        name: frameworkName,
        shared: true,
        buildAction: BuildAction(
            targets: [
                TargetReference(stringLiteral: "\(frameworkName)"),
                TargetReference(stringLiteral: "\(frameworkName)Tests")
            ]
        ),
        testAction: TestAction(
            targets: [TestableTarget(stringLiteral: "\(frameworkName)Tests")],
            configurationName: "Debug"
        ),
        runAction: RunAction(configurationName: "Debug"),
        archiveAction: ArchiveAction(configurationName: "Release"),
        profileAction: ProfileAction(configurationName: "Release"),
        analyzeAction: AnalyzeAction(configurationName: "Debug")
    )
]

// MARK: - Targets

let targets: [Target] = [
    Target(
        name: frameworkName,
        platform: .iOS,
        product: .framework,
        bundleId: "\(bundleIdPrefix)\(frameworkName)",
        deploymentTarget: deploymentTarget,
        infoPlist: .file(path: "\(frameworkName)/Info.plist"),
        sources: ["\(frameworkName)/**/*.swift", "\(frameworkName)/**/*.h"],
        resources: [],
        dependencies: []
    ),
    
    Target(
        name: "\(frameworkName)Tests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(bundleIdPrefix)\(frameworkName)Tests",
        infoPlist: .default,
        sources: ["\(frameworkName)Tests/**"],
        resources:[],
        dependencies: [.target(name: frameworkName)]
    )
]

// MARK: - Project

let project = Project(
    name: frameworkName,
    organizationName: organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
