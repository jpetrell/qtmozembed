import QtQuick 1.0
import QtMozilla 1.0

QmlMozView {
    id: webViewport
    parentid: appWindow.createParentID
    visible: true
    focus: true
    anchors.fill: parent
    Connections {
        target: webViewport.child
        onViewInitialized: {
            appWindow.mozViewInitialized = true
        }
    }
}
