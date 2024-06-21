import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    visible: true
    width: 350
    height: 600
    minimumWidth: width  // Ensure minimum width matches fixed width
       minimumHeight: height // Ensure minimum height matches fixed height
       maximumWidth: width  // Ensure maximum width matches fixed width
       maximumHeight: height // Ensure maximum height matches fixed height
       flags: Qt.Window | Qt.WindowSystemMenuHint | Qt.WindowMinMaxButtonsHint

       Component.onCompleted: {
           var icon = Qt.icon("qrc:/moon/moon/app.jpeg");
           Qt.winWindowHandle.setWindowIcon(icon);
       }
       Button {
           text: "Quit"
           anchors.top: parent.top
           anchors.right: parent.right
           z: 1
           width: 33
           height: 30
           visible: true
             hoverEnabled: false
           background: Rectangle {
               color: "transparent"
           }
           contentItem: Text {
               text: "Quit"
               color: "red" // Change text color to black
           }
           onClicked: Qt.quit()
       }

    property string weatherState: "Clear"

    Rectangle {
        id: container
        width: parent.width
        height: parent.height
        radius: 10
        color: "transparent"

        Rectangle {
            id: background
            anchors.fill: parent

            gradient: Gradient {
                GradientStop { position: 0.0; color: weatherState === "Clear" ? "#0F2129" : (weatherState === "Frosty" ? "#29386f" : "#ffbd3f") }
                GradientStop { position: 1.0; color: weatherState === "Clear" ? "#47334A" : (weatherState === "Frosty" ? "#b8f5ff" : "#fff097") }
            }
        }

        Column {
            id: textContainer
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50
            spacing: 10

            Text {
                id: degrees
                font.pixelSize: 100
                font.bold: true
                color: weatherState === "Clear" ? "#4F787D" : (weatherState === "Frosty" ? "#a8ddff" : "#fff5b8")
                text: weatherState === "Clear" ? "+24°" : (weatherState === "Frosty" ? "-13°" : "+32°")
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: place
                    font.pixelSize: 20
                    font.bold: true
                    color: weatherState === "Clear" ? "#694c6d" : (weatherState === "Frosty" ? "#4497bf" : "#f7a526")
                    text: weatherState === "Clear" ? "Madrid" : (weatherState === "Frosty" ? "Moscow" : "Ankara")
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                id: weather
                font.pixelSize: 20
                font.bold: true
                color: "white"
                text: weatherState
            }
        }

        Rectangle {
            id: mountain1
            width: 270
            height: 150
            radius: 100
            color: weatherState === "Clear" ? "#2f2b3c" : (weatherState === "Frosty" ? "#334579" : "#e1d59e")
            opacity: weatherState === "Clear" ? 1 : 0
            rotation: 20
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -50
            anchors.leftMargin: -20

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            id: mountain2
            width: 500
            height: 150
            radius: 100
            color: weatherState === "Clear" ? "#2f2b3c" : (weatherState === "Frosty" ? "#334579" : "#e1d59e")
            opacity: weatherState === "Clear" ? 1 : 0
            rotation: -10
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: -70
            anchors.rightMargin: -80

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            id: sunnyMountain1
            width: 270
            height: 150
            radius: 100
            color: "#FFA300"
            opacity: weatherState === "Hot" ? 1 : 0
            rotation: 20
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -50
            anchors.leftMargin: -20

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            id: sunnyMountain2
            width: 500
            height: 150
            radius: 100
            color: "#FFA300"
            opacity: weatherState === "Hot" ? 1 : 0
            rotation: -10
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: -70
            anchors.rightMargin: -80

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            id: frostyMountain1
            width: 270
            height: 150
            radius: 100
            color: "#b6efef"
            opacity: weatherState === "Frosty" ? 1 : 0
            rotation: 20
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -50
            anchors.leftMargin: -20

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            id: frostyMountain2
            width: 500
            height: 150
            radius: 100
            color: "#b6efef"
            opacity: weatherState === "Frosty" ? 1 : 0
            rotation: -10
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: -70
            anchors.rightMargin: -80

            SequentialAnimation on opacity {
                NumberAnimation { from: 0; to: 1; duration: 800; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1; to: 0; duration: 800; easing.type: Easing.InOutQuad }
            }
        }

        Item {
            id: moon
            width: 60
            height: 60
            visible: weatherState === "Clear"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20

            Rectangle {
                width: parent.width
                height: parent.height
                radius: parent.width / 2
                color: "#bcae76"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#bcae76" }
                    GradientStop { position: 1.0; color: "#bcae76" }
                }
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Rectangle {
            id: sun
            width: 60
            height: 60
            radius: 30
            color: weatherState === "Frosty" ? "#feffdf" : "#ffdb50"
            visible: weatherState !== "Clear"

            x: calculateSunX()
            y: calculateSunY()

            function calculateSunX() {
                if (weatherState === "Hot") {
                    return degrees.x + degrees.width + 40;
                } else if (weatherState === "Frosty") {
                    return container.width - 100;
                }
                return 0;
            }

            function calculateSunY() {
                if (weatherState === "Hot") {
                    return degrees.y + degrees.height + 70;
                } else if (weatherState === "Frosty") {
                    return container.height / 2 - height / 2;
                }
                return 0;
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (weatherState === "Clear") weatherState = "Frosty";
                    else if (weatherState === "Frosty") weatherState = "Hot";
                    else weatherState = "Clear";
                }
            }

            ShaderEffect {
                width: parent.width
                height: parent.height
                property variant source: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: parent.width / 2
                    color: weatherState === "Frosty" ? "#feffdf" : "#ffdb50"
                }
                fragmentShader: "
                    uniform lowp float qt_Opacity;

                    varying highp vec2 qt_TexCoord0;
                    uniform sampler2D source;
                    void main() {
                        gl_FragColor = texture2D(source, qt_TexCoord0) * qt_Opacity;
                    }
                "
            }
        }

        Text {
            id: dateTime
            font.pixelSize: 16
            color: "white"
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            text: {
                var date = new Date();
                return date.toLocaleTimeString() + " " + date.toDateString();
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    dateTime.text = new Date().toLocaleTimeString() + " " + new Date().toDateString();
                }
            }

            Timer {
                interval: 5000
                running: true
                repeat: true
                onTriggered: {
                    if (weatherState === "Clear") weatherState = "Frosty";
                    else if (weatherState === "Frosty") weatherState = "Hot";
                    else weatherState = "Clear";
                }
            }
        }

        states: [
            State {
                name: "Clear"
                when: weatherState === "Clear"
                PropertyChanges { target: sun; visible: false }
                PropertyChanges { target: moon; visible: true }
                PropertyChanges { target: mountain1; opacity: 1 }
                PropertyChanges { target: mountain2; opacity: 1 }
                PropertyChanges { target: sunnyMountain1; opacity: 0 }
                PropertyChanges { target: sunnyMountain2; opacity: 0 }
                PropertyChanges { target: frostyMountain1; opacity: 0 }
                PropertyChanges { target: frostyMountain2; opacity: 0 }
            },
            State {
                name: "Frosty"
                when: weatherState === "Frosty"
                PropertyChanges { target: sun; visible: true; x: container.width - 100; y: container.height / 2 - sun.height / 2; color: "#feffdf" }
                PropertyChanges { target: moon; visible: false }
                PropertyChanges { target: mountain1; opacity: 0 }
                PropertyChanges { target: mountain2; opacity: 0 }
                PropertyChanges { target: sunnyMountain1; opacity: 0 }
                PropertyChanges { target: sunnyMountain2; opacity: 0 }
                PropertyChanges { target: frostyMountain1; opacity: 1 }
                PropertyChanges { target: frostyMountain2; opacity: 1 }
            },
            State {
                name: "Hot"
                when: weatherState === "Hot"
                PropertyChanges { target: sun; visible: true; x: degrees.x + degrees.width + 40; y: degrees.y + degrees.height + 70; color: "#ffdb50" }
                PropertyChanges { target: moon; visible: false }
                PropertyChanges { target: mountain1; opacity: 0 }
                PropertyChanges { target: mountain2; opacity: 0 }
                PropertyChanges { target: sunnyMountain1; opacity: 1 }
                PropertyChanges { target: sunnyMountain2; opacity: 1 }
                PropertyChanges { target: frostyMountain1; opacity: 0 }
                PropertyChanges { target: frostyMountain2; opacity: 0 }
            }
        ]

        transitions: [
            Transition {
                ParallelAnimation {
                    NumberAnimation { properties: "x,y"; duration: 1200; easing.type: Easing.OutElastic }
                    ColorAnimation { target: sun; duration: 1200; property: "color"; easing.type: Easing.InOutCubic }
                    NumberAnimation { target: mountain1; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: mountain2; property: "opacity"; duration: 800; easing.type: Easing.InOutQuad }
                }
            }
        ]
    }
}
