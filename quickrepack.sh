#!/bin/bash

rm app-repacked*
apktool b -o app-repacked.apk app.apktooled/ --use-aapt2
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore app-repacked.apk alias_name
jarsigner -verify app-repacked.apk
zipalign 4 app-repacked.apk app-repacked_final.apk
adb install app-repacked_final.apk
