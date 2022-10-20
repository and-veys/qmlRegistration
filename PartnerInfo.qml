import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.1
Frame {
    padding:       10
    width:         300
    ColumnLayout {
        spacing:    10
        width:      parent.width
        Text {
            Layout.alignment: Qt.AlignHCenter
            text:      qsTr("Партнёр")
            font.pointSize:     16
        }
        Text {
            text:      qsTr("Возраст: ") + getAges()
            font.bold: true
        }
        RangeSlider {
            id: partner_age
            Layout.fillWidth: parent
            from:   18
            to:     70
            first.value: 25
            second.value: 35
            stepSize: 1
            snapMode:   RangeSlider.SnapAlways
        }
        ComboBox {
           id: gender
           Layout.fillWidth: parent
           displayText: "Пол: " + currentText
           model: genders
        }
        ComboBox {
           id: education
           Layout.fillWidth: parent
           displayText: "Образование: " + currentText
           model: educations
        }
    }
    function getAges() {
        return Math.round(partner_age.first.value) + "..." + Math.round(partner_age.second.value);
    }

    function getParameters() {

        return {
            "Пол": gender.currentText,
            "Возраст": getAges(),
            "Образование": education.currentText,
         };
    }


}
