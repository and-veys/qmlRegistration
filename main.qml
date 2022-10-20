import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("Домашняя работа #2")
    property variant genders: ["мужской", "женский"]
    property variant educations: ["начальное", "среднее", "высшее"]
    property variant hobbies: ["спорт", "рисование", "животные", "книги"]
    property variant colors: ["red", "black", "green", "blue", "silver", "purple"]
    MyInfo {
        id: my_info
        x:  10
        y: 10
    }
    PartnerInfo {
        id: partner_info
        anchors.leftMargin: 10
        anchors.top: my_info.top
        anchors.left: my_info.right
    }
    Button {
        anchors.bottom: my_info.bottom
        anchors.left: partner_info.left
        anchors.right: partner_info.right
        text: qsTr("OK")
        onClicked: printParam()
    }
    Square {
        height: 200
        anchors.topMargin: 10
        anchors.left: my_info.left
        anchors.right: partner_info.right
        anchors.top: my_info.bottom
    }
    function printParam() {
        console.log("----- Информация обо мне -----")
        let a = my_info.getParameters();
        let key;
        for(key in a)
            console.log(key + ":", a[key]);
        console.log("----- Информация о партнере -----")
        a = partner_info.getParameters();
        for(key in a)
            console.log(key + ":", a[key]);
    }
}

