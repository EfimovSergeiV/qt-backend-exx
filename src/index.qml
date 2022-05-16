import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "sensors/dialControl"

Item {
    width: 800
    Label {
        id: deviceNames
        x: 20
        y: 18
        width: 100
        height: 22
        text: qsTr("Device list")
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 14
    }

    Label {
        id: deviceTitle
        x: 20
        y: 59
        width: 80
        height: 18
        text: qsTr("Device 0")
    }

    Label {
        id: deviceTitle1
        x: 20
        y: 101
        width: 80
        height: 18
        text: qsTr("Device 1")
    }

    Label {
        id: deviceTitle2
        x: 20
        y: 142
        width: 80
        height: 18
        text: qsTr("Device 2")
    }

    Label {
        id: deviceTitle3
        x: 20
        y: 181
        width: 80
        height: 18
        text: qsTr("Device 3")
    }

    Label {
        id: deviceTitle4
        x: 20
        y: 221
        width: 80
        height: 18
        text: qsTr("Device 4")
    }

    Label {
        id: laterDataList
        x: 139
        y: 18
        width: 299
        height: 22
        text: qsTr("Later data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 14
    }

    Label {
        id: dataDevice0
        x: 139
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
        x: 139
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
        x: 139
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
        x: 139
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
        x: 139
        y: 221
        width: 299
        height: 18
        text: qsTr("no data")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    DialControl {
        id: dialControl
        width: 200
        height: 192
        anchors.verticalCenterOffset: -71
        anchors.horizontalCenterOffset: 249
        x: 0
        y: 0
        value: 0
    }

    Button {
        id: sendData0
        x: 59
        y: 356
        width: 283
        height: 26
        text: qsTr("01 01 77 19 00 00 00 00 00 6e ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 01 77 19 00 00 00 00 00 6e ff 0d 0a")
    }

    Button {
        id: sendData1
        x: 439
        y: 356
        width: 304
        height: 26
        text: qsTr("01 02 77 19 00 00 00 00 00 6d ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 02 77 19 00 00 00 00 00 6d ff 0d 0a")
    }

    Button {
        id: sendData2
        x: 59
        y: 398
        width: 283
        height: 26
        text: qsTr("01 04 77 19 00 00 00 00 00 6b ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 04 77 19 00 00 00 00 00 6b ff 0d 0a")
    }

    Button {
        id: sendData3
        x: 439
        y: 398
        width: 304
        height: 26
        text: qsTr("01 04 77 19 00 00 00 00 00 69 ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 04 77 19 00 00 00 00 00 69 ff 0d 0a")
    }

    Button {
        id: sendData4
        x: 59
        y: 437
        width: 283
        height: 26
        text: qsTr("01 07 01 19 00 00 00 00 00 1e ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 07 01 19 00 00 00 00 00 1e ff 0d 0a")
    }

    Button {
        id: sendData5
        x: 439
        y: 437
        width: 304
        height: 26
        text: qsTr("01 08 01 19 00 00 00 00 00 11 ff 0d 0a")
        font.pointSize: 9
        font.bold: true
        onClicked: controller.front_btn_handler("01 08 01 19 00 00 00 00 00 11 ff 0d 0a")
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
        x: 139
        y: 261
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
        x: 555
        y: 288
        width: 188
        height: 38
        text: qsTr("RUN EXAMPLE")
        font.bold: true
        onClicked: controller.run()
    }

    Label {
        id: label
        x: 549
        y: 261
        width: 200
        height: 18
        text: qsTr("This is device5")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    SpinBox {
        id: spinBox
        from: 0
        value: 0
        stepSize: 50
        to: 100 * 100
        x: 515
        y: 18
        width: 142
        height: 26
    }

    Button {
        id: button
        x: 669
        y: 18
        width: 123
        height: 26
        text: qsTr("SendToDev5")
        onClicked: controller.dial_handler(spinBox.value)
    }


    Connections {
        target: controller

        function onSignalData(value){
            allData.text = value
        }

        function onSignalDevice0(value){
            dataDevice0.text = value
        }

        function onSignalDevice1(value){
            dataDevice1.text = value
        }

        function onSignalDevice2(value){
            dataDevice2.text = value
        }

        function onSignalDevice3(value){
            dataDevice3.text = value
        }

        function onSignalDevice4(value){
            dataDevice4.text = value
        }

        function onSignalDevice5(value){
            dialControl.value = value
        }
    }

}


