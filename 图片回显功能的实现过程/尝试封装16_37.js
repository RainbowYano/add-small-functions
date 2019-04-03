/**
 * 显示数据库已经存在的照片
 * @Parma type 要显示的是什么照片，身份证复印件："idCard", 银行卡：bank, 风险评估：risk, 转账：pay
 * @Parma imgList 后台返回的图片列表
 * @Parma useOldBtn 控制是否使用旧照片的按钮,query对象，如$(#idImgBtn)
 * @Parma oldImgContainer 显示旧照片的div对象,query对象，如$(#idImgContainer)
 */

// bankCardFile   //银行卡
// riskTypeFile   //风险测评
// transferFile   //转账记录

// idImgFlag
// bankImgFlag
// riskImgFlag
// transferImgFlag

function addItemToArray(array, item) {
    array.push(item)
}

// 删除数组中值为item的那一项
function removeOneItemFormArray(array, item) {
    array.splice(array.indexOf(item), 1)

}
// 判断数组是否为空数组,非空为true,空为false
function isEemptyArray(array) {
    return array.length > 0
}

function reshowImg(type, usefulIdImg, useOldBtn, oldImgContainer) {
    // 默认的是显示旧的照片
    IdImgList.forEach(function (item, i) {
        // usefulIdImg.push(item.id) // 判断1
        switch (type) {
            case "idCard":
                addItemToArray(usefulIdImg, item.id)
                break;
            case "bank":
                addItemToArray(bankCardFile, item.id)
                break;
            case "risk":
                addItemToArray(riskTypeFile, item.id)
                break;
            case "pay":
                addItemToArray(transferFile, item.id)
                break;
        }
    })
    // 控制旧照片的显示与隐藏
    if (IdImgList && IdImgList.length > 0) { //如果数据库中有图片
        // 生成html
        var imgHtml = ""
        for (var i = 0; i < IdImgList.length; i++) {
            var src = IdImgList[i].src
            var id = IdImgList[i].id
            imgHtml += '<div class="img " data_id="' + id + '"> <button class="delButton">删除</button> <img src="' +
                src + '" alt="" class="pimg"> </div>'
        }
        oldImgContainer.html(imgHtml)

        // 删除图片按钮的点击事件
        oldImgContainer.on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            var id = Number($(e.target.parentNode).attr(
                "data_id"))
            var isNoImg
            switch (type) {
                case "idCard":
                    removeOneItemFormArray(usefulIdImg, id)
                    isNoImg = isEemptyArray(usefulIdImg)
                    break;
                case "bank":
                    removeOneItemFormArray(bankCardFile, id)
                    isNoImg = isEemptyArray(bankCardFile)
                    break;
                case "risk":
                    removeOneItemFormArray(riskTypeFile, id)
                    isNoImg = isEemptyArray(riskTypeFile)
                    break;
                case "pay":
                    removeOneItemFormArray(transferFile, id)
                    isNoImg = isEemptyArray(transferFile)
                    break;
            }
            // bankImgFlag
            // riskImgFlag
            // transferImgFlag

            // 当删除了最后一张图片时
            if (!isNoImg) {
                oldImgContainer.hide()
                useOldBtn.text('使用已上传的照片')
                // usefulIdImg = []
                // idImgFlag = true
                switch (type) {
                    case "idCard":
                        usefulIdImg = []
                        idImgFlag = true
                        break;
                    case "bank":
                        bankCardFile = []
                        bankImgFlag = true
                        break;
                    case "risk":
                        riskTypeFile = []
                        riskImgFlag = true
                        break;
                    case "pay":
                        transferFile = []
                        transferImgFlag = true
                        break;
                }
            }
        })

        // 控制旧照片的显示与隐藏

        useOldBtn.on('click', function () {
            var flag
            switch (type) {
                case "idCard":
                flag = idImgFlag
                    break;
                case "bank":
                    flag = bankImgFlag
                    break;
                case "risk":
                flag = riskImgFlag                    
                    break;
                case "pay":
                flag = transferImgFlag                    
                break;
            }

            if (flag) {
                oldImgContainer.show()
                useOldBtn.text('不使用已上传的照片')
                IdImgList.forEach(function (item, i) {
                    // usefulIdImg.push(item.id)
                    switch (type) {
                        case "idCard":
                            addItemToArray(usefulIdImg, item.id)
                            break;
                        case "bank":
                            addItemToArray(bankCardFile, item.id)
                            break;
                        case "risk":
                            addItemToArray(riskTypeFile, item.id)
                            break;
                        case "pay":
                            addItemToArray(transferFile, item.id)
                            break;
                    }
                })
                // idImgFlag = false
                switch (type) {
                    case "idCard":
                        idImgFlag = false
                        break;
                    case "bank":
                        bankImgFlag = false
                        break;
                    case "risk":
                        riskImgFlag = false
                        break;
                    case "pay":
                        transferImgFlag = false
                        break;
                }
                oldImgContainer.html(imgHtml)
            } else {
                oldImgContainer.hide()
                useOldBtn.text('使用已上传的照片')
                switch (type) {
                    case "idCard":
                        usefulIdImg = []
                        idImgFlag = true
                        break;
                    case "bank":
                        bankCardFile = []
                        bankImgFlag = true
                        break;
                    case "risk":
                        riskTypeFile = []
                        riskImgFlag = true
                        break;
                    case "pay":
                        transferFile = []
                        transferImgFlag = true
                        break;
                }
            }
        })

    } else { // 没有图片
        useOldBtn.hide()
    }

}