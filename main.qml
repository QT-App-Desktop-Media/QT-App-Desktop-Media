import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Media Player")
    Text {
        id: txt_Main
        color: "green"
        text: qsTr("Media Player")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 440
        font.bold: true
        font.family: "Times New Roman"
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 157
        anchors.top: parent.top
        anchors.topMargin: 15
        font.pixelSize: 20
    }



    Button {
        id: btn_exit
        x: 555
        y: 446
        width: 65
        height: 22
        text: qsTr("Exit")
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        onClicked: {
            if(text != "Exit"){
                image.visible = false
                frame.update()
                text = "Exit"
            } else {
                hide();
            }
        }
    }

    Frame {
        id: frame
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 157
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 46

        ListView {
            id: lv1
            visible: true
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            implicitWidth: 1000
            implicitHeight: 200
            clip: true
            model: DataModel
            delegate: RowLayout {
                width: parent.width
                Text {
                    id: text
                    text: model.namefile
                    Layout.fillWidth: true
                    font.pixelSize: 15
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            btn_exit.text = "Back"
                            image.visible = true
                            if(txt_Main.text == "Media Player" || txt_Main.text == "Photo For Game") {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Game/"+model.namefile
                            } else if(txt_Main.text == "Photo For Cooking") {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Cook/"+model.namefile
                            } else if(txt_Main.text == "Photo For Idol") {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Idol/"+model.namefile
                            } else {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Film/"+model.namefile
                            }
                        }
                    }
                }
            }
        }

     }
    Image {
        id: image
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 157
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 46
    }
    Button {
        id: btn_cook
        y: 65
        width: 90
        height: 40
        text: qsTr("Photo Cook")
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = "Photo For Cooking"
            lv1.model = DataModel2
            lv1.update()
            image.visible=false
        }
    }

    Button {
        id: btn_music
        y: 168
        width: 90
        height: 40
        text: qsTr("Photo Idol")
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = "Photo For Idol "
            lv1.model = DataModel3
            lv1.update()
            image.visible=false
        }
    }

    Button {
        id: btn_Film
        y: 272
        width: 90
        height: 40
        text: qsTr("Photo Film")
        transformOrigin: Item.Center
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = "Photo For Film"
            lv1.model = DataModel4
            lv1.update()
            image.visible=false
        }
    }

    Button {
        id: btn_Game
        y: 375
        width: 90
        height: 40
        text: qsTr("Photo Game")
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = "Photo For Game"
            lv1.model = DataModel
            lv1.update()
            image.visible=false
        }
    }
}
