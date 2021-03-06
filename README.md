# Infer iOS Step for Bitrise

This step will use [FbInfer App](http://fbinfer.com) in order to check your code

# How to use it

Modify your `bitrise.yml` in order to test it.

For an app that works with a scheme :

```yaml
    - git::https://github.com/PagesjaunesMobile/fbinfer-ios-bitrise@master:
        inputs:
        - infer_scheme: $BITRISE_SCHEME
        - infer_workspace: pathToYour.xcworkspace
        - infer_source_dir: $BITRISE_SOURCE_DIR
        - infer_configuration: configurationName
        - infer_sdk: sdkName
        - infer_custom_config_path: If you want to append some custom param to Infer
        - infer_debug_mode: Set it to true if you want to see what command are send to the system
```

For an app that works with a target :

```yaml
    - git::https://github.com/PagesjaunesMobile/fbinfer-ios-bitrise.git@master:
        inputs:
        - infer_target: targetName
        - infer_source_dir: $BITRISE_SOURCE_DIR
        - infer_configuration: configurationName
        - infer_sdk: sdkName
        - infer_custom_config_path: If you want to append some custom param to Infer
        - infer_debug_mode: Set it to true if you want to see what command are send to the system
```

# Milestone

* 0.1.0

  * Support for target / scheme
  * Documentation
  * Share with the community
