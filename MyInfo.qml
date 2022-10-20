import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.1
Frame {
    padding:       10
    Column {
        spacing:    10
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text:      qsTr("Моя информация")
            font.pointSize:     16
        }
        Row {
            spacing:       10
            ColumnLayout {
                id: col_1
                spacing:       10
                width:         300
                TextField {
                   id: name
                   Layout.fillWidth: parent
                   placeholderText: qsTr("Имя")
                   validator: RegExpValidator {regExp: /[а-яёА-ЯЁ]+/}
                }
                ComboBox {
                   id:  gender
                   Layout.fillWidth: parent
                   displayText: "Пол: " + currentText
                   model: genders
                }
                TextField {
                   id: age
                   Layout.fillWidth: parent
                   placeholderText: qsTr("Возраст")
                   validator: IntValidator {bottom: 0; top: 99}
                }
                ComboBox {
                   id: education
                   Layout.fillWidth: parent
                   displayText: "Образование: " + currentText
                   model: educations
                }
                TextField {
                   id: city
                   Layout.fillWidth: parent
                   placeholderText: qsTr("Город")
                   validator: RegExpValidator {regExp: /[а-яёА-ЯЁ]+/}
                }
            }
            Frame {
                anchors.top: col_1.top
                anchors.bottom: col_1.bottom
                Column {
                    Text {
                        text:      qsTr("Хобби")
                        font.bold: true
                    }
                    Repeater {
                        id: hobby
                        model: hobbies
                        CheckBox {
                            text: modelData
                        }
                    }
                }
            }
        }
        TextField {
           id: extra
           anchors.left: parent.left
           anchors.right: parent.right
           placeholderText: qsTr("Дополнительно")
           validator: RegExpValidator {regExp: /[а-яёА-ЯЁ ]+/}
        }
    }
    function getHobbies() {
        let res = [];
        for(let i=0; i<hobby.count; ++i) {
            if(hobby.itemAt(i).checked)
                res.push(hobby.itemAt(i).text);
        }
        return res;
    }
    function getParameters() {
        return {
            "Имя": name.text,
            "Пол": gender.currentText,
            "Возраст": age.text,
            "Образование": education.currentText,
            "Город":  city.text,
            "Хобби": getHobbies().join(", "),
            "Дополнительно": extra.text
        };
    }
}

