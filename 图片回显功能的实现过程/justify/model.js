      /**
       * 显示数据库已经存在的照片
       * @Parma usefulImg 最终返回的照片
       * @Parma imgflag 控制旧照片显示与隐藏的flag
       * 
       * @Parma imgList 后台返回的图片列表
       * @Parma useOldBtn 控制是否使用旧照片的按钮,query对象，如$(#idImgBtn)
       * @Parma oldImgContainer 显示旧照片的div对象,query对象，如$(#idImgContainer)
       */
      function rewriteImg(usefulImg, imgflag, imgList, useOldBtn, oldImgContainer) {
        if (imgList && imgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < imgList.length; i++) {
            var src = imgList[i].src
            var id = imgList[i].id
            imgHtml += `<div class="img" data_id="${id}">
            <button class="delButton">删除</button>
              <img src="${src}" alt="">
          </div>`
          }
          oldImgContainer.html(imgHtml)

          // 删除图片按钮的点击事件
          oldImgContainer.on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulImg.splice(usefulImg.indexOf(Number($(e.target.parentNode).attr("data_id"))), 1)
            if (usefulImg.length <= 0) {
              oldImgContainer.hide()
              useOldBtn.text('使用已上传的照片')
              usefulImg = []
              imgflag = true
            }
            console.log(usefulImg)
          })

          // 控制旧照片的显示与隐藏

          useOldBtn.on('click', function () {
            if (imgflag) {
              oldImgContainer.show()
              useOldBtn.text('不使用已上传的照片')
              imgList.forEach(function (item, i) {
                usefulImg.push(item.id)
              })
              imgflag = false
              oldImgContainer.html(imgHtml)
              console.log(usefulImg)
            } else {
              oldImgContainer.hide()
              useOldBtn.text('使用已上传的身份证照片')
              usefulImg = []
              imgflag = true
              console.log(usefulImg)
            }
          })

        } else { // 没有图片
          useOldBtn.hide()
        }

      }
      // 向后台传参 later
      // $('#idImg').val(usefulImg.join(','))

      var usefulIdImg = []
      var idImgFlag = true
      rewriteImg(usefulIdImg,idImgFlag, imgListId, $('#idImgBtn'),$('#idImgContainer'))