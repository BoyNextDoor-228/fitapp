# App

FitApp is a mobile application, which helps user to organize training process and nutrition.

## Features

With FitApp user can
- Create a training, which may include exercises, such as repetitions exercise, or exercise with timer,
- Complete a creating training exercise by exercise,
- Watch training progression with exercise statistics chart,
- Create a meals with different products and watch it's nutrition facts.

## Getting Started

Before you start this application, make sure you have a JSON configuration file in app level path.
It's structure is presented below:
```json
{
  "fitapp_environmentName": "dev",
  "fitapp_applicationName": "FitApp",

  "fitapp_user_box_name": "dev_user_box",
  "fitapp_user_key_name": "dev_user_key",

  "fitapp_settings_box_name": "dev_settings_box",
  "fitapp_settings_key_name": "dev_settings_key"
}
```

Also don't forget to mention this file in run script with flag `--dart-define-from-file=fitapp_dev.env.json`
