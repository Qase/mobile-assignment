# Kotlin Multiplatform Mobile

## Table of contents

- [Introduction](#introduction)
- [Importing KMM library into Xcode project](#importing-kmm-library-into-xcode-project)
    - [Version 1 - Local file/Local Package:](#version-1---local-file-or-local-package)
    - [Version 2 - Remote Package](#version-2---remote-package)
    - [Summary](#summary)
- [Preview of code](#preview-of-code)
    - [Kotlin](#kotlin)
    - [Swift](#swift)
- [Trouple shooting](#trouple-shooting) 
    - [Suspending function must only run on DispatchQueue.main](#suspending-function-must-only-run-on-dispatchqueuemain)
    - [Problems with running the commands](#problems-with-running-the-commands-on-creating-package)
    - [Error hadling](#error-handling) 
- [Useful links](#useful-links)

## Introduction
- Download **Android Studio**, add **Kotlin Multiplatform Mobile** plugin
- **Create Kotlin Multiplatform Library**
- Implement necessary functionality. The code must be compatible with the iOS platform. Thus it must be implemented in Kotlin (no Java and its ecosystem of libraries)
    
   ![](./Docs/KMM/Images/kmmLibraries.png)
    
    *Supported libraries for KMM*
    
- What those libraries do?
    - **Ktor** - REST client
    - **Koin** - tool for managing dependencies
    - **kotlinx.serialization** - implementation of JSON (de)serialization
    - **SQLDelight**, **Firebase** - database abstractions
- Add all necessary dependencies to the `build.gradle.kts`.
- Synchronize the dependencies using `gradle`.
    
   ![](./Docs/KMM/Images/gradleSynchronization.png)
    
    *Gradle synchronization*
    
- Here is the directory representation of the KMM project (note that each package has its associated unit test package):
    
   ![](./Docs/KMM/Images/kmmStructure)
    
    *Root directory*
    
    - **androidMain** - code only used in Android apps
    - **iosMain** - code only used in iOS apps
    - **commonMain** - code that is being reused on both platforms
    
    Some functionalities are highly coupled with the specific platform and thus need to have separate implementations. Those implementations are available in the platform specific directories. Those functionalities are then unified by an extra layer of abstraction (interface) and exposed via the common package.
    
    e.g: The **commonMain** has `expect fun`, that means you need to provide specific function to both **androidMain** and **iosMain**.
    
    ```kotlin
    package com.example.fetchrockets
    
    interface Platform {
        val name: String
    }
    
    expect fun getPlatform(): Platform
    ```
    *commonMain*
    
    like so:
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
  ### Version 1 - Local file or Local Package
  ### Version 2 - Remote Package
  ### Summary

## Preview of code
  ### Kotlin:
  ### Swift:

## Trouple shooting
  ### Suspending function must only run on DispatchQueue.main
  ### Problems with running the commands on creating package
  ### Error handling

## Useful links
