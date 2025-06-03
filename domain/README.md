# Features

Contains datatypes which the whole FitApp consumes.

All features are in `src/lib`.
For now, the following features are:
- nutrition (meal, ingredient, product, nutrition facts, etc.),
- training (exercise, statistics, etc.)
- user

## Adding new feature or expanding the existing one

1) Go to the desired feature directory, there you will see three files:
   - feature_name.dart (code written manually),
   - feature_name.g.dart (generated code),
   - feature_name.freezed.dart (generated code).
2) Make changes you wanted to make,
3) Run build_runner script to generate new code files with applied changes,
4) Don't forget to make sure all tests of the feature you changed are passed.
