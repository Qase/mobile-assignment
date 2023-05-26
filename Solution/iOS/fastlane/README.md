fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios clean

```sh
[bundle exec] fastlane ios clean
```

Cleans derived data

### ios clean_all

```sh
[bundle exec] fastlane ios clean_all
```

Clean All (clean derived data and reset simulators)

### ios register

```sh
[bundle exec] fastlane ios register
```

Register new development device to provisioning profile (prompts name and UUID)

### ios setup_git_hooks

```sh
[bundle exec] fastlane ios setup_git_hooks
```

Automaticcaly detects and ensures correct commit message format

### ios cancel_git_hooks

```sh
[bundle exec] fastlane ios cancel_git_hooks
```

Automaticcaly detects and ensures correct commit message format

### ios version_set

```sh
[bundle exec] fastlane ios version_set
```

Sets project build number based on commits and branch

### ios create_default_keychain

```sh
[bundle exec] fastlane ios create_default_keychain
```



### ios unlock_default_keychain

```sh
[bundle exec] fastlane ios unlock_default_keychain
```



### ios delete_default_keychain

```sh
[bundle exec] fastlane ios delete_default_keychain
```



### ios certificate

```sh
[bundle exec] fastlane ios certificate
```

Update single certificate (readonly): scheme:{development, appstore, adhoc}

### ios certificates

```sh
[bundle exec] fastlane ios certificates
```

Alias to refresh_profiles

### ios refresh_profiles

```sh
[bundle exec] fastlane ios refresh_profiles
```

Update certificates for all schemes (development, appstore, adhoc)

### ios info

```sh
[bundle exec] fastlane ios info
```

Prints information (like version ...) about project

### ios build

```sh
[bundle exec] fastlane ios build
```

Build aplication scheme:{development, appstore, adhoc}

### ios build_only

```sh
[bundle exec] fastlane ios build_only
```

Only build a project

### ios get_appstore_api_key

```sh
[bundle exec] fastlane ios get_appstore_api_key
```

Setup Apple Two-factor Auth

### ios setup_apple_login

```sh
[bundle exec] fastlane ios setup_apple_login
```

Setup Apple Two-factor Auth

### ios deploy_crashlytics

```sh
[bundle exec] fastlane ios deploy_crashlytics
```

Deploy application to crashlytics

### ios deploy_firebase

```sh
[bundle exec] fastlane ios deploy_firebase
```



### ios deploy_pilot

```sh
[bundle exec] fastlane ios deploy_pilot
```

Deploy application to testflight

### ios deploy_appstore

```sh
[bundle exec] fastlane ios deploy_appstore
```

Deploy application to appstore

### ios release

```sh
[bundle exec] fastlane ios release
```

Release app (runs deploy_appstore)

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Run swiftlint

### ios test

```sh
[bundle exec] fastlane ios test
```

Run all tests (scan command). UNIT and UI

### ios snapshots

```sh
[bundle exec] fastlane ios snapshots
```

Run UI test and create snapshots (saves images o google drive)

### ios post_deploy_to_slack

```sh
[bundle exec] fastlane ios post_deploy_to_slack
```

Post to 2N slack into app_monitoring channel

### ios ci_crashlytics

```sh
[bundle exec] fastlane ios ci_crashlytics
```

CI - Build and upload to crashlytics

### ios ci_firebase

```sh
[bundle exec] fastlane ios ci_firebase
```

CI - Build and upload to crashlytics

### ios ci_testflight

```sh
[bundle exec] fastlane ios ci_testflight
```

CI - Build and upload to testflight

### ios ci_appstore

```sh
[bundle exec] fastlane ios ci_appstore
```

CI - Build and upload to testflight

### ios ci_nightbuild

```sh
[bundle exec] fastlane ios ci_nightbuild
```

CI nightbuild

### ios setup_swiftgen

```sh
[bundle exec] fastlane ios setup_swiftgen
```

Download swiftgen folder wtih config file and templates

### ios update_swiftgen_templates

```sh
[bundle exec] fastlane ios update_swiftgen_templates
```

Download swiftgen folder wtih config file and templates

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
