import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import "."

ToolBar {
    RowLayout {
        anchors.fill: parent
        Button {
            iconSource: "qrc:/images/add.svg"
            text: qsTranslate("RDM","Connect to Redis Server")
            objectName: "rdm_connect_to_redis_server_btn"
            Layout.preferredWidth: 230

            onClicked: {
                connectionSettingsDialog.settings = connectionsManager.createEmptyConfig()
                connectionSettingsDialog.open()
            }
        }

        ToolButton {
            iconSource: "qrc:/images/import.svg"
            text: qsTranslate("RDM","Import Connections")
            tooltip: text

            onClicked: importConnectionsDialog.open()

            FileDialog {
                id: importConnectionsDialog
                title: qsTranslate("RDM","Import Connections")
                nameFilters: ["RDM Connections (*.xml *.json)"]
                selectExisting: true
                onAccepted: connectionsManager.importConnections(qmlUtils.getPathFromUrl(fileUrl))
            }
        }

        ToolButton {
            iconSource: "qrc:/images/export.svg"
            text: qsTranslate("RDM","Export Connections")
            tooltip: text

            onClicked: exportConnectionsDialog.open()

            FileDialog {
                id: exportConnectionsDialog
                title: qsTranslate("RDM","Import Connections")
                nameFilters: ["RDM Connections (*.json)"]
                selectExisting: false
                onAccepted: connectionsManager.saveConnectionsConfigToFile(qmlUtils.getPathFromUrl(fileUrl))
            }
        }

        Rectangle { width: 1; color: "lightgrey"; Layout.fillHeight: true;}

        Item { Layout.fillWidth: true }

        ToolButton {
            iconSource: "qrc:/images/alert.svg"
            text: qsTranslate("RDM","Report issue")
            tooltip: qsTranslate("RDM","Report issue")
            onClicked: Qt.openUrlExternally("https://github.com/uglide/RedisDesktopManager/issues")
        }

        ToolButton {
            iconSource: "qrc:/images/help.svg"
            text: qsTranslate("RDM","Documentation")
            tooltip: qsTranslate("RDM","Documentation")
            onClicked: Qt.openUrlExternally("http://docs.redisdesktop.com/en/latest/")
        }

        ToolButton {
            iconSource: "qrc:/images/telegram.svg"
            text: qsTranslate("RDM","Join Telegram Chat")
            tooltip: qsTranslate("RDM","Join Telegram Chat")
            onClicked: Qt.openUrlExternally("https://t.me/RedisDesktopManager")
        }

        ToolButton {
            iconSource: "qrc:/images/twi.svg"
            text: qsTranslate("RDM","Follow")
            tooltip: qsTranslate("RDM","Follow")
            onClicked: Qt.openUrlExternally("https://twitter.com/RedisDesktop")
        }

        ToolButton {
            iconSource: "qrc:/images/github.svg"
            text: qsTranslate("RDM","Star on GitHub!")
            tooltip: qsTranslate("RDM","Star on GitHub!")
            onClicked: Qt.openUrlExternally("https://github.com/uglide/RedisDesktopManager")
        }

        Item { Layout.fillWidth: true }

        Button {
            iconSource: "qrc:/images/settings.svg"
            text: qsTranslate("RDM","Settings")

            onClicked: {
                settingsDialog.open()
            }
        }
    }
}

