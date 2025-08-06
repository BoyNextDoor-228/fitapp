# App

FitApp is a mobile application, which helps user to organize training process and nutrition.

## Screenshots

### Home screen - displays user current weight
<img src="app_image/1.png" alt="drawing" width="300"/>

### Application drawer

<img src="app_image/2.png" alt="drawing" width="300"/>

### Trainings list

<img src="app_image/3.png" alt="drawing" width="300"/>

### Training creation form.

<img src="app_image/4.png" alt="drawing" width="300"/>

### Adding an exercise with repetition in a training.

<img src="app_image/5.png" alt="drawing" width="300"/>

### Adding an exercise with timer in a training

<img src="app_image/6.png" alt="drawing" width="300"/>

### By tap on exercise card, training information shows up.
#### User can start a training with 'Start training button'

<img src="app_image/7.png" alt="drawing" width="300"/>

### To complete a training, mark each exercise as completed

<img src="app_image/8.png" alt="drawing" width="300"/>

### Run timer to observe remaining time of exercise execution.

<img src="app_image/9.png" alt="drawing" width="300"/>

### After all exercises are completed, finish the training.

<img src="app_image/10.png" alt="drawing" width="300"/>

### Watch statistics of exercises you did.
#### The more load you set for an exercise, the more progression statistics display.

<img src="app_image/11.png" alt="drawing" width="300"/>

### Each time you complete a training with increased load, statistics gets updated.

<img src="app_image/12.png" alt="drawing" width="300"/>

### Add products and mention their nutrition facts...

<img src="app_image/13.png" alt="drawing" width="300"/>

### ... using creating product form. Don't forget to mention, if current product should me measured either in grams or in mililiters  

<img src="app_image/14.png" alt="drawing" width="300"/>

### With those products you can create meals.

<img src="app_image/15.png" alt="drawing" width="300"/>

### By tap on meal, it's recipe and ingredients show up.

<img src="app_image/16.png" alt="drawing" width="300"/>

### Creating meal form.

<img src="app_image/17.png" alt="drawing" width="300"/>

### Adding an ingredient in a new meal.

<img src="app_image/18.png" alt="drawing" width="300"/>

### You can customize user interface and set interface language in settings.

<img src="app_image/19.png" alt="drawing" width="300"/>

### So application may look like this:

<img src="app_image/20.png" alt="drawing" width="300"/>

### Don't forget to update your current weight

<img src="app_image/21.png" alt="drawing" width='300'/>

## Features

With FitApp user can
- Create a training, which may include exercises, such as repetitions exercise, or exercise with timer,
- Complete a creating training exercise by exercise,
- Watch training progression with exercise statistics chart,
- Create meals with different products and watch it's nutrition facts.

## Getting Started

Before you start this application, make sure you have a JSON configuration file in root.
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

To start application in dev mode with using Hive, run 'main_dev' configuration.

If you want to run application in dev mode with mock data without Hive, you can use 'main_dev_mock' configuration.

To build APK file, run 'build apk' script.
