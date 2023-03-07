# ATOA FLUTTER PACKAGES

### Getting Started

To get started, as this packages are contained in private repo, so we need to connect using SSH in our project

Make sure to set up SSH with a common host **atoa.github.com**, so to avoid conflicts while using dependencies in project

- Example(SSH Config):-

```
# Work - Work
Host atoa.github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_work
```

## List of Packages

### 1. Regal - Atoa Design System

#### Usage

- Add dependecies

```yaml
dependencies:
  regal:
    git:
      url: git@atoa.github.com:ATOAPaymentsLimited/atoa-flutter-packages.git
      ref: main
      path: packages/regal
```

Need to include the import the package to the dart file where it will be used, use the below command,

```dart
import 'package:regal/regal.dart';;
```

### 2. Custom Semantics Lint - Custom lint to add semanticsLabel or Wrap with Semantics widget for improving accessibility

### Usage

- Add below lines to analysis_options.yaml
```yaml
analyzer:
  plugins:
    - custom_lint
```

- Add below lines to pubspec.yaml under `dev_dependencies`
```yaml
custom_semantics_lint:
    git:
      url: git@atoa.github.com:ATOAPaymentsLimited/atoa-flutter-packages.git
      ref: main
      path: packages/custom_semantics_lint
```
```yaml
flutter_lints: ^2.0.0
```
