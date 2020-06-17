# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2020-06-17

### Changed
- Rewrite module to use Terraform 0.12 syntax and produce more
  readable outputs. Applying new module will cause all the methods to
  be *recreated*.
- `methods[].type` variable is now mandatory. Passing in `null` will default to `AWS_PROXY`

### Removed
- `num_methods` variable. Number of methods is now computed automatically
  based on the number of items passed in `methods`.

## [1.3.0] - 2020-06-17
### Added
- Compatibility with Terraform 0.12 ([#1](https://github.com/mewa/terraform-aws-serverless-resource/pull/1))
