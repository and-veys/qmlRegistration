import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Frame {
    Rectangle {
        id: rect
        width:  150
        height: 150
        anchors.centerIn: parent
        color: getColor()
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            Timer {
                id: timer
                interval: 200
                onTriggered: changeColor()
            }
            onClicked: mouseClick(mouse)
        }
        RotationAnimation {
            id: anim
            target:     rect
            duration: 1000
            from: 0
            to: 360
        }
    }
    function mouseClick(mouse) {
        if(mouse.button === Qt.LeftButton) {
            if(timer.running) {
                changeRect();
                timer.stop();
            }
            else
                timer.restart();
        }
        else
            rotationRect()
    }
    function changeRect() {
        if(rect.radius === 0)
            rect.radius = rect.width/2;
        else
            rect.radius = 0;
    }
    function changeColor() {
        rect.color = getColor();
    }
    function rotationRect() {
        if(rect.radius === 0)
            anim.start();
    }
    function getColor() {
        let col = Math.round(Math.random() * 10000) % colors.length;
        return colors[col];
    }
}
