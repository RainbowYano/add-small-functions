// <!-- 以前上传的身份证照片 -->
// <div class="form-group">
//   <label class="col-md-2 control-label">上传身份证复印件：</label>
//   <br>
//   <button class="useOldBtn" id="idImgBtn">不使用已上传的照片</button>
//   <div class="col-md-9 oldImgContainer" id="idImgContainer">
//   </div>
// </div>




      function reshowIdImg() {
        // 默认的是显示旧的照片
        IdImgList.forEach(function (item, i) {
          usefulIdImg.push(item.id)
        })
        // 控制旧照片的显示与隐藏
        if (IdImgList && IdImgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < IdImgList.length; i++) {
            var src = IdImgList[i].src
            var id = IdImgList[i].id
            // imgHtml += `<div class="img" data_id="${id}">
            //             <button class="delButton">删除</button>
            //             <img src="${src}" alt="" class="pimg">
            //         </div>`
            imgHtml += '<div class="img " data_id="' + id + '"> <button class="delButton">删除</button> <img src="' +
              src + '" alt="" class="pimg"> </div>'
          }
          $('#idImgContainer').html(imgHtml)

          // 删除图片按钮的点击事件
          $('#idImgContainer').on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulIdImg.splice(usefulIdImg.indexOf(Number($(e.target.parentNode).attr(
              "data_id"))), 1)
            if (usefulIdImg.length <= 0) {
              $('#idImgContainer').hide()
              $('#idImgBtn').text('使用已上传的照片')
              usefulIdImg = []
              idImgFlag = true
            }
            console.log(usefulIdImg)
          })

          // 控制旧照片的显示与隐藏

          $('#idImgBtn').on('click', function () {
            if (idImgFlag) {
              $('#idImgContainer').show()
              $('#idImgBtn').text('不使用已上传的照片')
              IdImgList.forEach(function (item, i) {
                usefulIdImg.push(item.id)
              })
              idImgFlag = false
              $('#idImgContainer').html(imgHtml)
              console.log(usefulIdImg)
            } else {
              $('#idImgContainer').hide()
              $('#idImgBtn').text('使用已上传的照片')
              usefulIdImg = []
              idImgFlag = true
              console.log(usefulIdImg)
            }
          })

        } else { // 没有图片
          $('#idImgBtn').hide()
        }

        console.log(usefulIdImg)
      }
