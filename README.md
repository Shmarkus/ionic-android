# Usage
Mount your Ionic project under `/app` and build away (run the following while in your project root dir):
```bash
docker run --rm \
-v "${PWD}":/app \
markuskarileet/ionic-android:latest \
ionic cordova build android --prod --release
```

# Building

* Download and unpack Android command line tools into `./cmdline-tools`: https://developer.android.com/studio#command-tools
* Run `docker build . -t markuskarileet/ionic-android:latest`
* Install appropriate build tools: `docker run -it markuskarileet/ionic-android:latest /opt/android/cmdline-tools/latest/bin/sdkmanager "build-tools;32.0.0"`
* Commit changes to image `docker commit [container id] markuskarileet/ionic-android:latest`
* Push to Docker Hub `docker push markuskarileet/ionic-android:latest`

# Libraries and versions

| Tag   | Latest | Libraries                                                                                       |
|-------|:-------|-------------------------------------------------------------------------------------------------|
| 1.0.0 |        | Node v16.16.0<br/>Gradle 7.5<br/>Cordova 11.0.0<br/>Ionic 6.20.1<br/>Android build tools 32.0.0 |
| 1.0.1 | x      | Git 2.34.1                                                                                      |

# Docker Hub
https://hub.docker.com/r/markuskarileet/ionic-android
