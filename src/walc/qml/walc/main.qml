import QtQuick 1.0
import QtWebKit 1.0

Rectangle {
    id: back_board
    width: 1024
    height: 768
    color: "#f7f7f7"
    radius: 5

    MouseArea {
        id: main_mouse_area
        anchors.fill: parent
        property variant clickPos: "1,1"

        onPressed: {
            clickPos = Qt.point(mouseX, mouseY)
        }

        onPositionChanged: {
            var delta = Qt.point(mouseX - clickPos.x, mouseY - clickPos.y)
            mainwindow.pos = Qt.point(mainwindow.pos.x + delta.x, mainwindow.pos.y + delta.y)
        }
    }
    Rectangle {
        id: exit_button
        width: 25
        height: 25
        color: "#cccccc"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        MouseArea {
            id: exit_mouse_area
            anchors.fill: parent

            onClicked: {
                Qt.quit();
            }
        }
    }
    Rectangle {
        id: go_button
        width: 25
        height: 25
        color: "#0099ff"
        anchors.right: parent.right
        anchors.rightMargin: 45
        anchors.top: parent.top
        anchors.topMargin: 10

        MouseArea {
            id: go_mouse_area
            anchors.fill: parent

            onClicked: {
                progressbar1.visible = true
                progressbar1.value = main_web_view.progress * 100
                main_web_view.url = address_input.text
                main_web_view.reload
            }
        }
    }
    WebView {
        id: main_web_view
        width: 1014
        height: 701
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.topMargin: 45
        anchors.bottomMargin: 5
        anchors.fill: parent
        smooth: true
        url: "file:///Users/babaru/Documents/Projects/beaver/index.html"
    }
}
