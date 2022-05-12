import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    Label {
        id: deviceNames
        x: 20
        y: 18
        width: 283
        height: 41
        text: qsTr("Device list")
        font.pointSize: 14
    }

    Label {
        id: deviceTitle
        x: 20
        y: 59
        width: 161
        height: 18
        text: qsTr("Device 0")
    }

    Label {
        id: deviceTitle1
        x: 20
        y: 101
        width: 161
        height: 18
        text: qsTr("Device 1")
    }

    Label {
        id: deviceTitle2
        x: 20
        y: 142
        width: 161
        height: 18
        text: qsTr("Device 2")
    }

    Label {
        id: deviceTitle3
        x: 20
        y: 181
        width: 161
        height: 18
        text: qsTr("Device 3")
    }

    Label {
        id: deviceTitle4
        x: 20
        y: 221
        width: 161
        height: 18
        text: qsTr("Device 4")
    }

    Label {
        id: laterDataList
        x: 321
        y: 21
        width: 299
        height: 38
        text: qsTr("Later data")
        font.pointSize: 14
    }

    Label {
        id: dataDevice0
        x: 321
        y: 59
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        id: dataDevice1
        x: 321
        y: 101
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        id: dataDevice2
        x: 321
        y: 142
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        id: dataDevice3
        x: 321
        y: 181
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        id: dataDevice4
        x: 321
        y: 221
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Button {
        id: sendData0
        x: 20
        y: 356
        width: 283
        height: 26
        text: qsTr("01 01 77 19 00 00 00 00 00 6e ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Button {
        id: sendData1
        x: 321
        y: 356
        width: 299
        height: 26
        text: qsTr("01 02 77 19 00 00 00 00 00 6d ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Button {
        id: sendData2
        x: 20
        y: 398
        width: 283
        height: 26
        text: qsTr("01 04 77 19 00 00 00 00 00 6b ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Button {
        id: sendData3
        x: 321
        y: 398
        width: 299
        height: 26
        text: qsTr("01 04 77 19 00 00 00 00 00 69 ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Button {
        id: sendData4
        x: 20
        y: 437
        width: 283
        height: 26
        text: qsTr("01 07 01 19 00 00 00 00 00 1e ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Button {
        id: sendData5
        x: 321
        y: 437
        width: 299
        height: 26
        text: qsTr("01 08 01 19 00 00 00 00 00 11 ff 0d 0a")
        font.pointSize: 9
        font.bold: true
    }

    Label {
        id: label10
        x: 20
        y: 332
        width: 600
        height: 18
        text: qsTr("SEND DATA")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        id: allData
        x: 321
        y: 259
        width: 299
        height: 29
        text: qsTr("allData")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        font.bold: true
    }

    Button {
        id: runExample
        x: 321
        y: 294
        width: 299
        height: 47
        text: qsTr("RUN EXAMPLE")
        font.bold: true
        onClicked: controller.run()
    }

    Connections {
        target: controller

        function onAllData(value){
            allData.text = value
        }

        function onDataDevice0(value){
            dataDevice0.text = value
        }

        function onDataDevice1(value){
            dataDevice1.text = value
        }

        function onDataDevice2(value){
            dataDevice2.text = value
        }

        function onDataDevice3(value){
            dataDevice3.text = value
        }

        function onDataDevice4(value){
            dataDevice4.text = value
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
