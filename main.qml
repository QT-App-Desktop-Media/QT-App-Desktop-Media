import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
ApplicationWindow  {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Photo Library") + language.emptyString
    menuBar:MenuBar {
    Menu {
        visible: true
        title: qsTr("Language") + language.emptyString
        MenuItem {
            text: "English"
            onTriggered: language.selectLanguage("en")
        }
        MenuItem {
            text: "Français"
            onTriggered: language.selectLanguage("fr")
        }
        MenuItem {
            text: "Tiếng Việt"
            onTriggered: language.selectLanguage("vi")
        }
     }
    }
    Text {
        id: txt_Main
        color: "green"
        text: qsTr("Photo Library") + language.emptyString
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
        visible: true
        x: 555
        y: 446
        width: 65
        height: 22
        text: qsTr("Exit") +language.emptyString
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        onClicked: {
            hide();
        }
    }
    Button {
        id: btn_back
        visible: false
        x: 555
        y: 446
        width: 65
        height: 22
        text: qsTr("Back") +language.emptyString
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        onClicked: {
            btn_back.visible = false
            image.visible = false
            btn_exit.visible = true
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
            id: list_view
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
                            btn_exit.visible=false
                            btn_back.visible=true
                            image.visible = true
                            if(txt_Main.text == btn_film.text){
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Film/"+model.namefile
                            } else if(txt_Main.text == btn_food.text) {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Cook/"+model.namefile
                            } else if(txt_Main.text == btn_idol.text){
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Idol/"+model.namefile
                            } else {
                                image.source = "file:///C:/Users/phamthinga/Pictures/QT/Game/"+model.namefile
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
        id: btn_food
        y: 65
        width: 90
        height: 40
        text: qsTr("Foods") + language.emptyString
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = btn_food.text
            list_view.model = DataModel2
            list_view.update()
            image.visible=false
        }
    }

    Button {
        id: btn_idol
        y: 168
        width: 90
        height: 40
        text: qsTr("Idol") + language.emptyString
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = btn_idol.text
            list_view.model = DataModel3
            list_view.update()
            image.visible=false
        }
    }

    Button {
        id: btn_film
        y: 272
        width: 90
        height: 40
        text: qsTr("Film") + language.emptyString
        transformOrigin: Item.Center
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text = btn_film.text
            list_view.model = DataModel4
            list_view.update()
            image.visible=false
        }
    }

    Button {
        id: btn_game
        y: 375
        width: 90
        height: 40
        text: qsTr("Game") + language.emptyString
        anchors.left: parent.left
        anchors.leftMargin: 38
        onClicked: {
            txt_Main.text =btn_game.text
            list_view.model = DataModel
            list_view.update()
            image.visible=false
        }
    }
}
