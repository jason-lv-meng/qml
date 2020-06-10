import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ComboxC {
        id:selectType
        iRadius:0
        width:230
        height:40
        icomType:2

        textRole: "key"
        displayVisible: displayText.length>0
        placeholderText: qsTr("这是一个提示文案")
        model: ListModel {
            id: selectTypeItems
        }
        onFocusChanged: {
            if(focus){
              console.log("你选中了我，是要做些事情吗？")
            }
        }

        onSig_close: {
            displayText=currentText

        }
    }
    Component.onCompleted:
    {
        getModelData();
    }

    // 获取下拉框model数据
    function getModelData()
    {
        selectTypeItems.append({"key":qsTr("测试一"),"value": "test1"})
        selectTypeItems.append({"key":qsTr("测试二"),"value": "test2"})
        selectTypeItems.append({"key":qsTr("测试三"),"value": "test3"})
        selectTypeItems.append({"key":qsTr("测试四"),"value": "test4"})
        selectTypeItems.append({"key":qsTr("测试五"),"value": "test"})

    }
}
