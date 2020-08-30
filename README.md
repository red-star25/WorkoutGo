# WorkoutGo - A Workout/Fitness App

![](https://lh3.googleusercontent.com/WHNJREQwiD_oM3PtAfPwBEmRfb-hOyIuo4k0RgyU5KTyK8i34-c-bL4S99KJb8cvqks=s360)

### WorkoutGo app that provides you the best exercises.


### Information about the app:

```
Best Workout App to build body from Home/Gym.

Various Categories are available :

1] Exercise by Body Parts.
=> Abs, Arms, Back, Butt/Hips, Chest, Full Body, Legs,
Neck, Shoulder...

2] Exercise by Experience : Beginners, Intermediate and Advance
3] Yoga
4] Meditation

Showing Popular Exercises Liked by People Around the World and Updating it on Daily Basis.

Beautifully Designed User-Interface.

Awesome Exercise GIF.

You can set number of Exercise Sets you want to do.

Daily uploading Health / Body Building / Diets etc Articles which helps user to stay fit.
```

## Screenshot 📱
![](https://lh3.googleusercontent.com/e-UEjvkJpcQEJ-6wPajg9uOGxbdMJVM37QQZw9t3zGGzLVN9HZoaKAqPWttaM8g7jHbh=w200-h400)
![](https://lh3.googleusercontent.com/yGEhEmSk7LAbhv3zGrVLo88VHiD5Jq19f_Si9eAOCLsiYmrzIxerl54Dr6br3cI9Gg=w200-h400)
![](https://lh3.googleusercontent.com/vWLxLwyCA19vVz6T1SSK6eRCOqf0eMDcvc3ahsULj8tEyrTdvXaVHhFLY3Pnq1aH8A=w200-h400)
![](https://lh3.googleusercontent.com/RHdrsNyYKQSvc9cBzlxMwYka52pI5FCO7Q0lunho6Fzv60Ht-fj6Mz37uVpDeSTCaJTd=w200-h400)
![](https://lh3.googleusercontent.com/7xeTUfvmKeiIkHerRW60D0f_PXl4ftqZZnLx0ktgAxKbuDK73Jtn47-MUC8nLl1q6Ew=w200-h400)
![](https://lh3.googleusercontent.com/2TneSUcWzjhREnD4s-vIorMiVr-6etDTAs67VyLO-ho-SwA954d3QgyObPe0X7OiNch6=w200-h400)
![](https://lh3.googleusercontent.com/eGgxoq-yxltVlHh6MT5HKXRr-3x-boFoI7DU-VoHde8ZTcSyNO8ftLDpHTLmebvaeQ=w1440-h620)

### Show some ❤️ and star the repo to support the project
![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

# Building the project 📽

Missing Key.Properties file ❌❌

If you try to build the project straight away, you'll get an error complaining that a key.properties file is missing and Exit 🚪

You have to create your own key and run it (You can follow following steps😉).

1. Open \android\app\build.gradle file and paste following lines without comments.
```
//keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

signingConfigs {
// release {
// keyAlias keystoreProperties['keyAlias']
// keyPassword keystoreProperties['keyPassword']
// storeFile file(keystoreProperties['storeFile'])
// storePassword keystoreProperties['storePassword']
// }
}
buildTypes {
// release {
// signingConfig signingConfigs.release
// }
}
```

2.Open \android\local.properties and add -
```
flutter.versionName=1.0.0
flutter.versionCode=1
flutter.buildMode=release
```


Or you can follow from the Official Doc.https://flutter.dev/docs/deployment/android.


<p>
<a href="https://play.google.com/store/apps/details?id=com.nakumsdtech.workout"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" alt="Waller"></a>
</p>

❤ Found this project useful?
If you found this project useful, then please consider giving it a ⭐ on Github and sharing it with your friends via social media.

### LinkedIn Profile
<p>
<a href="https://www.linkedin.com/in/dhruv-nakum-4b1054176/"><img src="https://img.icons8.com/ios-filled/2x/linkedin.png" alt="LinkedIn"></a>
</p>
