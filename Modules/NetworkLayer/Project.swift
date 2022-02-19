import ProjectDescription

// MARK: - Constants

let frameworkName = "NetworkLayer"
let organizationName = "OLX"
let bundleIdPrefix = "br.com.olx."
let deploymentVersion = "14.4"

// MARK: - Build Settings

let settings: Settings = .settings()

// MARK: - Deployment Target

let deploymentTarget: DeploymentTarget = .iOS(targetVersion: deploymentVersion, devices: [.iphone, .ipad])

// MARK: - Actions

let buildAction: BuildAction = .buildAction(targets: [.init(stringLiteral: "\(frameworkName)")])
let testAction: TestAction = .targets(
    [
        .init(stringLiteral: "\(frameworkName)Tests")
    ],
    configuration: .debug
)

// MARK: - Build Schemes

let schemes: [Scheme] = [
    Scheme(
        name: frameworkName,
        shared: true,
        buildAction: buildAction,
        testAction: testAction,
        runAction: .runAction(configuration: .debug),
        archiveAction: .archiveAction(configuration: .release),
        profileAction: .profileAction(configuration: .release),
        analyzeAction: .analyzeAction(configuration: .debug)
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
        resources: [],
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
