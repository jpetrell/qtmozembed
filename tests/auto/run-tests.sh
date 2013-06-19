#!/bin/sh

# Create a temporary DBus session to isolate us from the normal environment.
export `dbus-launch`
if [ "$QTMOZEMBEDOBJDIR" != "" ]; then
  QMLMOZTESTRUNNER=$QTMOZEMBEDOBJDIR/tests/qmlmoztestrunner/qmlmoztestrunner
  export QML_IMPORT_PATH=$QTMOZEMBEDOBJDIR/qmlplugin4
  export QML2_IMPORT_PATH=$QTMOZEMBEDOBJDIR/qmlplugin5
else
  QMLMOZTESTRUNNER=/usr/lib/qt4/bin/qmlmoztestrunner
  export QML_IMPORT_PATH=/opt/tests/qtmozembed/imports
fi
CURDIR=$PWD
if [ "$QTTESTSLOCATION" != "" ]; then
  cd $QTTESTSLOCATION
fi

#export NSPR_LOG_MODULES=EmbedLiteTrace:5,EmbedNonImpl:5,EmbedLiteApp:5,EmbedLiteView:5,EmbedLiteViewThreadParent:5

$QMLMOZTESTRUNNER -opengl $@

cd $CURDIR

exit_code=$?

kill $DBUS_SESSION_BUS_PID

exit $exit_code
