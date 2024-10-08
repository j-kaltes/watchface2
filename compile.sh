
TOOLPATH=/home/jka/Android/Sdk/build-tools/35.0.0
AAPT=$TOOLPATH/aapt2
VERBOSE=
UNALIGNED=unaligned.apk
ENDFILE=signed.apk

$AAPT compile  --dir src/res -o build $VERBOSE

$AAPT link build/* -o $UNALIGNED   -I /home/jkakeep/Android/Sdk/platforms/android-35/android.jar  --manifest src/AndroidManifest.xml  $VERBOSE

$TOOLPATH/zipalign -f -p 4 $UNALIGNED  $ENDFILE
$TOOLPATH/apksigner sign  $ENDFILE
