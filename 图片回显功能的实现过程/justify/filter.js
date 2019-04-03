function rewriteImg(usefulPayImg, payImgFlag, payImgList, $('#payImgBtn'), $('#payImgContainer')) {
    if (payImgList && payImgList.length > 0) { //如果数据库中有图片
      // 生成html
      var imgHtml = ""
      for (var i = 0; i < payImgList.length; i++) {
        var src = payImgList[i].src
        var id = payImgList[i].id
        imgHtml += `<div class="img" data_id="${id}">
        <button class="delButton">删除</button>
          <img src="${src}" alt="">
      </div>`
      }
      $('#payImgContainer').html(imgHtml)

      // 删除图片按钮的点击事件
      $('#payImgContainer').on('click', '.delButton', function (e) {
        $(e.target.parentNode).hide()
        usefulPayImg.splice(usefulPayImg.indexOf(Number($(e.target.parentNode).attr("data_id"))), 1)
        if (usefulPayImg.length <= 0) {
          $('#payImgContainer').hide()
          $('#payImgBtn').text('使用已上传的照片')
          usefulPayImg = []
          payImgFlag = true
        }
        console.log(usefulPayImg)
      })

      // 控制旧照片的显示与隐藏

      $('#payImgBtn').on('click', function () {
        if (payImgFlag) {
          $('#payImgContainer').show()
          $('#payImgBtn').text('不使用已上传的照片')
          payImgList.forEach(function (item, i) {
            usefulPayImg.push(item.id)
          })
          payImgFlag = false
          $('#payImgContainer').html(imgHtml)
          console.log(usefulPayImg)
        } else {
          $('#payImgContainer').hide()
          $('#payImgBtn').text('使用已上传的身份证照片')
          usefulPayImg = []
          payImgFlag = true
          console.log(usefulPayImg)
        }
      })

    } else { // 没有图片
      $('#payImgBtn').hide()
    }

  }