# Kotlin Multiplatform Mobile
Another solution of **RocketApp** is now available, utilizing the new framework KMM (Kotlin Multiplatform Mobile). We have prepared a comprehensive guide to help you work with and gain a better understanding of the cross-platform development approach for building mobile apps. This guide provides step-by-step instructions for integrating KMM into your project and addresses common issues you may encounter along the way.

 You can find the repository for this app and its showcase here:
  [Mobile-Assignment-KMM repository](https://github.com/Qase/mobile-assignment-kmm).
 
## Table of contents

- [Introduction](#introduction)
- [Importing KMM library into Xcode project](#importing-kmm-library-into-xcode-project)
    - [Version 1 - Local file/Local Package:](#version-1---local-file-or-local-package)
    - [Version 2 - Remote Package](#version-2---remote-package)
    - [Summary](#summary)
- [Preview of code](#preview-of-code)
    - [Kotlin](#kotlin)
    - [Swift](#swift)
- [Troubleshooting](#troubleshooting) 
    - [Suspending function must only run on DispatchQueue.main](#suspending-function-must-only-run-on-dispatchqueuemain)
    - [Problems with running the commands](#problems-with-running-the-commands-on-creating-package)
    - [Error hadling](#error-handling) 
- [Useful links](#useful-links)
  
## Introduction
- Download **Android Studio**, add **Kotlin Multiplatform Mobile** plugin.
- **Create Kotlin Multiplatform Library**.
- Implement necessary functionality. The code must be compatible with the iOS platform. Thus it must be implemented in Kotlin (no Java and its ecosystem of libraries).
    
   ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/kmmLibraries.png)

    *Supported libraries for KMM*
    
- What those libraries do?
    - **Ktor** - REST client
    - **Koin** - tool for managing dependencies
    - **kotlinx.serialization** - implementation of JSON (de)serialization
    - **SQLDelight**, **Firebase** - database abstractions
- Add all necessary dependencies to the `build.gradle.kts`.
- Synchronize the dependencies using `gradle`.
    
   ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/gradleSynchronization.png)
    
    *Gradle synchronization*
    
- Here is the directory representation of the KMM project (note that each package has its associated unit test package):
    
   ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/kmmStructure.png)
    
    *Root directory*
    
    - **androidMain** - code only used in Android apps
    - **iosMain** - code only used in iOS apps
    - **commonMain** - code that is being reused on both platforms
    
    Some functionalities are highly coupled with the specific platform and thus need to have separate implementations. Those implementations are available in the platform specific directories. Those functionalities are then unified by an extra layer of abstraction (interface) and exposed via the **common package**.
    
    e.g: The **commonMain** has `expect fun`, that means you need to provide specific function to both **androidMain** and **iosMain**.
    
    ```kotlin
    package com.example.fetchrockets
    
    interface Platform {
        val name: String
    }
    
    expect fun getPlatform(): Platform
    ```
    *commonMain*
    
    ```kotlin
    package com.example.fetchrockets
    import platform.UIKit.UIDevice

    class IOSPlatform: Platform {
        override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
    }

    actual fun getPlatform(): Platform = IOSPlatform()
    ```
    *iosMain*
  
## Importing KMM library into Xcode project
This article aims to provide perspective on two ways of using the KMM library in an Xcode package. Each approach has its own advantages and disadvantages, allowing us to evaluate which one is best suited for our needs.

- Firstly, let's establish some basic information about the structure to avoid any confusion.
    - The entire project is called `mobile-assignment-kmm`, and within this project, we have a module named `fetchRockets` where all the use cases and code reside.
    - Inside the `fetchRockets`, you will find directories such as `commonMain`, `iosMain`, `androidMain`, as well as test files.
    - For the sake of clarity, we will refer to the project as `nameOfSharedLibrary` and the module as `nameOfSharedModule` throughout the showcase and code snippets.

Let's dive into the details and explore the two different approaches of utilizing the KMM library in an Xcode package.
  ### Version 1 - Local file or Local Package
  - Add the KMM shared library as a folder into the app’s root directory ( In my case `mobile-assignment-kmm` ).
    
    ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/iosRootDir.png)
    
    *Root directory of Xcode project - RocketApp*
    
- Add this script into **Build Phases**:
    
    ```swift
    cd "$SRCROOT/nameOfSharedLibrary"
    ./gradlew :nameOfSharedModule:embedAndSignAppleFrameworkXcode
    ```
    
   ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/buildPhases.png)
    
  *Build phases inside the RocketApp Project*
    
- Next add this piece of code into **BuildSettings-Linking**:
    
    `$(inherited) -framework nameOfSharedModule` 
    
   ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/linking.png)
    
    *Linking inside the RocketApp Project*
    
- Finally, add this to **Framework Search Path**:
    
    `$(SRCROOT)/nameOfSharedLibrary/nameOfSharedModule/build/xcode-frameworks/$(CONFIGURATION)/$(SDK_NAME)`
    
    ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/frameworkSearchPath.png)
    
   *Search Paths inside the RocketApp Project*
    
- And you can freely use the the KMM module in the base project but **not in the packages**.
- You can manually add it as a package as you do with packages like `Infrastructure`, `Domain` and `Features`.
    - And use inspiration from this link:
        
        [Command Line Tool using Swift Package Manager and Utility package](https://dmytro-anokhin.medium.com/command-line-tool-using-swift-package-manager-and-utility-package-e0984224fc04)
        
    - Or use special plugin in Kotlin, which is more in detail in the next section, but the outcome is pretty similar.
- After that, there is easy way to import your local package into the project by using this code:
    
    ```swift
    dependencies: [
    	...
      .package(path: "../../nameOfSharedLibrary"),
    	//Note that it depends where in directory you have your file saved.
    	//The path could vary because of that.
    ],
    
    targets: [
      .target(
        name: "SomeClient",
        dependencies: [
    		...
          .product(name: "nameOfSharedModule", package: "nameOfSharedLibrary")
        ]
      ),
    ```
### Version 2 - Remote Package
- In this version a custom plugin is used that creates the Swift Package by one simple command in terminal. 

For more details, please refer to the following link:
[KMM package plugin](https://github.com/ge-org/multiplatform-swiftpackage).

Before delving into the plugin's description, let's take a moment to understand the project structure.

- Within the entire project structure, there are two main files where you manage dependencies and plugins, similar to the `Package` file in Xcode. These files are named `build.gradle.kts`. One resides inside the KMM module (`fetchRockets`), while the other is located in the root directory.
    
    ![](https://github.com/Qase/mobile-assignment/blob/00448a9e026150a1364bbf7c5b291d003f028cd5/Solution/iOS/Docs/KMM/Images/entireProjectStruct.png)
    
- The key distinction is that the root project does not contain any source code. It is used to store global configurations in its `build.gradle.kts` file. On the other hand, the **KMM module's** `build.gradle.kts` (`fetchRockets`) file is where code-specific dependencies and plugins are added. Consequently, the *gradle* file in the **KMM module** (`fetchRockets`) tends to be more complex.
    - Quick tip: If you are uncertain about where to place the plugin, consider including it in both *gradle* files.

   ### Lets start with the plugin
	To add the plugin that will transform your project into a library, follow these steps:
	
	- Open the `build.gradle.kts` file in the **KMM module**.
	- Add the following configuration:
	    
	    `id("com.chromaticnoise.multiplatform-swiftpackage") version "2.0.3"`
	    
	
	```kotlin
	plugins {
	    kotlin("multiplatform")
	    id("com.android.library")
	//This one 
	    id("com.chromaticnoise.multiplatform-swiftpackage") version "2.0.3"
	}
	
	@OptIn(org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi::class)
	kotlin {
	    targetHierarchy.default()
	
	    multiplatformSwiftPackage {
	//Name of the package 
	        packageName("fetchRockets")
	        swiftToolsVersion("5.3")
	        targetPlatforms {
	            iOS { v("13") }
	        }
	        outputDirectory(File(rootDir, "/"))
	    }
	...
	```
	
	- After that you can open terminal in the folder of the KMM module - so in my case - `mobile-assignment-kmm`.
	- Only thing that is left, is to run these commands:
	    
	    The first command also creates the framework, so only the first one is necessary.
	    
	    `./gradlew createSwiftPackage`
	    
	    - Creates the XCFramework, ZIP file and Package.swift.
	    
	    `./gradlew createXCFramework`
	    
	    - Creates only the XCFramework
	- **IMPORTANT: `./gradlew createSwiftPackage` needs to be re-run every time you make a change in the library**, it creates a **ZIP** file that you can use and it **doesn’t refresh by itself.**
	- After that you are free to use it in packages like this:
	
	```swift
	dependencies: [
		...
	//MARK: Local
	 .package(path: "../../mobile-assignment-kmm")
	//MARK: Remote 
	  .package(url: "https://github.com/Qase/mobile-assignment-kmm.git", branch: "master"),
	],
	
	targets: [
	  .target(
	    name: "RocketsClient",
	    dependencies: [
			...
	      .product(name: "fetchRockets", package: "mobile-assignment-kmm")
	    ]
	  ),
	```
	
	- This method does **not work** with newest version of `NativeCoroutines`.
### Summary
- The first version demonstrates how to import the module without using a package or with a local package approach that does not require any special commands. This is achieved through a script within the Xcode project.
- The second version is easier to implement. It eliminates the need for the script in the build phases and other settings mentioned in **Version 1**. Instead, it creates the package with the existing code and generates a **ZIP** file.**However, any changes made to the code require rerunning the `./gradlew createSwiftPackage` command**. This approach can be a bit troublesome, but it works well for simple packages and libraries like RocketApp.
- In the end both variants are solid, but the first one is more well-rounded, and works better with more external libraries. For example, the second variant may encounter issues with newer versions of `NativeCoroutines`.
- **For larger apps → [Version 1](#version-1---local-file-or-local-package)**
- **For very small projects and specific use cases → [Version 2](#version-2---remote-package)**

## Preview of code
In this section, we will demonstrate how the real implementation should look like.

Let's take a closer look at the code:
  ### Kotlin
```kotlin
@NativeCoroutines
    suspend fun fetchAllRockets(): RocketResult<List<RocketKMM>> {
        return try {
            RocketResult.Success(client.get("https://api.spacexdata.com/v4/rockets/").body())
        } catch (exception: Throwable) {
            RocketResult.Failure(
                when (exception) {
                    is ClientRequestException -> RocketException.HttpError(exception.response.status)
                    is IOException -> RocketException.NetworkError(
                        exception.message ?: "Network error occurred"
                    )
                    else -> RocketException.UnknownError(
                        exception.message ?: "Unknown error occurred"
                    )
                }
            )
        }
    }
```
*KMM function in class RocketApi, calling REST Api*

```kotlin
private val client = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
    }
```
*Small client used in calling the API - from library `Ktor`*

```kotlin
sealed class RocketResult<out T> {
    data class Success<out T>(val data: T) : RocketResult<T>()
    data class Failure(val error: RocketException) : RocketResult<Nothing>()
}
```
*Custom Result type*

```kotlin
sealed class RocketException(message: String) : Throwable(message) {
    data class HttpError(val statusCode: HttpStatusCode) : RocketException("HTTP error")
    data class NetworkError(val errorMessage: String) : RocketException("Network error")
    data class UnknownError(val errorMessage: String) : RocketException("Unknown error")
}
```
*Custom exception type*

```kotlin
@Serializable
data class RocketKMM(
    val id: String,
    val name: String,
    @SerialName("description")
    val overview: String,
    val height: LineMeasure,
    val diameter: LineMeasure,
    val mass: WeightScale,
    @SerialName("first_stage")
    val firstStage: Stage,
    @SerialName("second_stage")
    val secondStage: Stage,
    @SerialName("first_flight")
    val firstFlight: String,
    @SerialName("flickr_images")
    val photos: List<String>
)
```
*Class RocketKMM, that is Serializable ( Codable ) and supports Json serialization*

  ### Swift
```swift
//MARK: KMM Rocket library integration
let rocketApi = RocketApi()

do {
  let rockets = try await asyncFunction(for: rocketApi.fetchAllRockets())
  //MARK: Even though warning is saying "always fails" it in fact does not fail at all. Swift is confused about KMM. - Ignore this warrning
  switch rockets {
  case let success as RocketResultSuccess<AnyObject>:
    guard let result = rocketsKMMConverter.domainModel(fromExternal: success.data as! [RocketKMM]) else {
      throw RocketsClientAsyncError.modelConversionError
    }
    
    return result
    
  case let failure as RocketResult<RocketException>:
    guard let error = rocketExceptionConverter.domainModel(fromExternal: failure) else {
      throw RocketsClientAsyncError.modelConversionError
    }
    
    throw error
    
  default:
    throw RocketsClientAsyncError.undefinedError
  }

} catch {
  throw error
}
```
*Swift handling the KMM fetchAllRockets function*

- Note that in the Swift function there will be **warning** saying:
    
    `Cast from 'RocketResult<RocketKMM>' to unrelated type 'RocketResultSuccess<AnyObject>' always fails`
    
    But its only because Swift is confused and does not know what to do with the `Result`.
    This can be ignored, it does not cause any problems with the function of code.
    
- `RocketConverter` just converts the `RocketKMM` → `RocketDetail` ( which is domain model ).
- And `RocketExceptionConverter` converts the `RocketResult<RocketException>` → `RocketsClientAsyncError` ( which is domain error ).

```swift
public typealias RocketExceptionConverter = ModelConverter<RocketsClientAsyncError, RocketResult<RocketException>>

public extension RocketExceptionConverter {
  static var live = Self(
    domainModelConverter: { error in
      switch error {
      case is RocketResult<RocketException.HttpError>:
          return RocketsClientAsyncError.networkError(.serverError(statusCode: 404))
      case is RocketResult<RocketException.NetworkError>:
          return RocketsClientAsyncError.networkError(.noConnection)
      case is RocketResult<RocketException.UnknownError>:
          return RocketsClientAsyncError.undefinedError
      default:
          return RocketsClientAsyncError.networkError(.timeoutError)
      }
    }
  )
}
```
*Custom error converting from KMM to Domain*

## Troubleshooting
   ### Suspending function must only run on DispatchQueue.main
   
 A naive option is to use `@MainActor` to make sure, the function execution is performed on the main thread. However, there is a better solution.
And that is by adding new library - `KMP-NativeCoroutines`:
 [Native Coroutines](https://github.com/rickclephas/KMP-NativeCoroutines).

 - **Note** - This library needs to be added both into **KMM library** and in **Xcode project**.
 - First, we need to implement the library in our KMM project. To do that, we will use these two plugins:
        
      ```kotlin
        id("com.google.devtools.ksp") version "1.8.21-1.0.11"
        id("com.rickclephas.kmp.nativecoroutines") version "1.0.0-ALPHA-8"
      ```
   *Kotlin implementation inside KMM module `build.gradle.kts`*
        
- Next, we should add `kotlin.sourceSets.all` under the `sourceSets` section in `build.gradle.kts`.

	```kotlin
	sourceSets {
		val ktorVersion = "2.3.1"
	
		val commonMain by getting {
		    dependencies {
			implementation("io.ktor:ktor-client-json:$ktorVersion")
			implementation("io.ktor:ktor-client-core:$ktorVersion")
			implementation("io.ktor:ktor-client-cio:$ktorVersion")
			implementation("io.ktor:ktor-client-logging:$ktorVersion")
			implementation("io.ktor:ktor-client-content-negotiation:$ktorVersion")
			implementation("io.ktor:ktor-serialization-kotlinx-json:$ktorVersion")
			implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
		    }
		}
		val commonTest by getting {
		    dependencies {
			implementation(kotlin("test"))
		    }
		}
		val androidMain by getting {
		    dependencies {
			implementation("io.ktor:ktor-client-android:$ktorVersion")
		    }
		}
		val iosMain by getting {
		    dependencies {
			implementation("io.ktor:ktor-client-ios:$ktorVersion")
		    }
		}
	    }
	
	//HERE 
	    kotlin.sourceSets.all {
		languageSettings.optIn("kotlin.experimental.ExperimentalObjCName")
	    }
	```
	*Kotlin implementation inside KMM module build.gradle.kts*

- Simply add new dependency into whatever package you need.
   ```swift
	dependencies: [
	  ...
	    .package(url: "https://github.com/rickclephas/KMP-NativeCoroutines.git", branch: "master")
	  ],
	```
	*Xcode implementation inside package where is KMM library used*
	
	```swift
	targets: [
	    .target(
	      name: "RocketsClient",
	      dependencies: [
	       ...
		.product(name: "fetchRockets", package: "mobile-assignment-kmm"),
		.product(name: "KMPNativeCoroutinesCore", package: "KMP-NativeCoroutines"),
		.product(name: "KMPNativeCoroutinesAsync", package: "KMP-NativeCoroutines")
	      ]
	    ),
	```
	*Xcode implementation inside package where is KMM library used*

- Then, add `@NativeCoroutines` to your function, and it will automatically generate a new thread-safe use case.

	```kotlin
	@NativeCoroutines
	    suspend fun fetchRocketById(rocketId: String): RocketKMM {
		try {
		    return client.get("https://api.spacexdata.com/v4/rockets/$rocketId").body()
		} catch (exception: Throwable) {
		    throw when (exception) {
			is ClientRequestException -> RocketException.NetworkError("Network stopped working")
			else -> RocketException.UnknownError(exception.message ?: "Unknown error occurred")
		    }
		}
	    }
	```
	*Kotlin KMM function with NativeCoroutines*

- Finally, you need to use specific functions from the `KMPNativeCoroutines` library. For our purpose, I chose the `Async` version, which looks like this:

	`asyncFunction(for: “YourClass.yourFunction()”)`
	
	```swift
	let rockets = try await asyncFunction(for: rocketApi.fetchAllRockets())
	guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets) else {
		 throw RocketsClientAsyncError.modelConversionError
	}
	return result
	```

- And that solves the problems with main thread.
- **Its all in the README**.
### Problems with running the commands on creating package
 - There is a big possibility that the error has to do something with **command line tools** from Xcode.
        - First of all, install command line tools:
            
            `xcode-select --install`
            
    - You need to have the Xcode command line tools linked to your Xcode which could be solved by these easy steps:
            
            `sudo xcode-select -s /path/to/Xcode.app`
            
            `sudo xcode-select --switch /Library/Developer/CommandLineTools`
            
    - Also second problem could be by caused by new libraries that doesnt support this plugin. Try to read the error message and then use older versions of libraries.
  ### Error handling
    
There is problem with Swift handling thrown errors from Kotlin. There are few solutions:
    
 - One way is to add `@Throws` onto function and make it throw exceptions, but in most cases it receives **NSError** and thats hard to map into any domain-specific error type.
        
      ```kotlin
        @Throws(Throwable::class) suspend fun fetchAllrockets(): List<RocketKMM>
      ```
        
 - Other way is to use `Result` type in KMM module, but for that you need to **create custom** `Result` type, because KMM doesn’t share inbound classes.
        - It could look like this:
            
      ```kotlin
            sealed class RocketResult<out T> {
                data class Success<out T>(val data: T) : RocketResult<T>()
                data class Failure(val error: RocketException) : RocketResult<Nothing>()
            }
      ```
	*Simple Result type that has two options - Success and Failure*
            
    - Then its very similar to using normal `Result`, just use `try-catch` and then return either `Success` or `Failure`:
            
         ```kotlin
            suspend fun fetchAllRockets(): RocketResult<List<RocketKMM>> {
                    return try {
                        RocketResult.Success(client.get("https://api.spacexdata.com/v4/rockets/").body())
                    } catch (exception: Throwable) {
                        RocketResult.Failure(
                            when (exception) {
                		....
                   )
                 }
               }
            }
         ```
      *New function that returns the custom Result type*
            
     - After that only whats left is to map the values inside the Swift:
            
          ```swift
          do {
	          let rockets = try await asyncFunction(for: rocketApi.fetchAllRockets())
	          //MARK: Even though warning is saying "always fails" it in fact does not fail at all. Swift is confused about KMM. - Ignore this warrning
	          switch rockets {
	          case let success as RocketResultSuccess<AnyObject>:
	            //Custom mapping into domain model
	          case let failure as RocketResult<RocketException>:
	             //Custoom error mapping to domain error
	            }
	            
	            throw error
	            
	          default:
	            throw RocketsClientAsyncError.undefinedError // Domain Error
	          }
        } catch {
          throw error
        }
          ```
       *Real implementation in Swift handling custom Result type*
            
     - Just for showcase how does the `RocketException` look like:
            
          ```kotlin
            sealed class RocketException(message: String) : Throwable(message) {
                data class HttpError(val statusCode: HttpStatusCode) : RocketException("HTTP error")
                data class NetworkError(val errorMessage: String) : RocketException("Network error")
                data class UnknownError(val errorMessage: String) : RocketException("Unknown error")
            }
          ```
       *Custom exception type created for better error handling*

## Useful links

- [Share KMM module with iOS via SPM](https://www.notion.so/Share-KMM-module-with-iOS-via-SPM-8580006dce61414980216a10a647e9f4?pvs=21)

- [Native Coroutines](https://github.com/rickclephas/KMP-NativeCoroutines)

- [KMM package plugin](https://github.com/ge-org/multiplatform-swiftpackage)

- [Android/iOS Kotlin Multiplatform — Api and threading](https://medium.com/@carlosdmp/android-ios-kotlin-multiplatform-api-and-threading-17b17e84992f)

- [Get started with Kotlin Multiplatform for mobile | Kotlin](https://kotlinlang.org/docs/multiplatform-mobile-getting-started.html)

- [Fetch Rockets repository](https://github.com/yOoZZyOzzbourne/mobile-assignment-kmm)

- [r/SpaceX API Docs](https://docs.spacexdata.com/)

- [Ktor documentation](https://ktor.io/docs/welcome.html)
