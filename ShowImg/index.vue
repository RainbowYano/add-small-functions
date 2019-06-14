<template>
  <div class="show-history-img">
    <div class="btn">
        <el-button type="primary" @click="handleBtn" round>{{btnInfo.msg}}</el-button>
    </div>
    <!-- <button @click="handleBtn">{{btnInfo.msg}}</button> -->
    <ul class="el-upload-list el-upload-list--picture-card">
      <li tabindex="0" class="el-upload-list__item is-ready" v-for="item in historyImgList" :key="item.id" 
          v-show="item.show">
        <img
          :src="item.src"
          alt
          class="el-upload-list__item-thumbnail"
        >
        <!---->
        <span class="el-upload-list__item-actions">
          <span class="el-upload-list__item-preview">
            <i class="el-icon-zoom-in" @click="handleImgPreview(item.src)"> </i>
          </span>
          <span class="el-upload-list__item-delete" @click="handleDelete(item.id)">
            <i class="el-icon-delete" ></i>
          </span>
        </span>
      </li>
    </ul>

    <img-preview :previewImgSrc="previewImgSrc" :previewImgShow.sync="previewImgShow"></img-preview>

  </div>
</template>

<script>
import ImgPreview from '../../ImgPreview/index'

export default {
  data() {
    return {
        btnInfo: {
            msg: "不使用已经上传的照片",
            status: false
        },
        previewImgSrc: '',
        previewImgShow:false,
    };
  },

  props: {
    fileList: {
       type: Array,
      required: true
    }
  },

  methods: {
      handleDelete(id) {
          console.log(id)
         let tmp = this.historyImgList.map(val=>{
            let item = {}
            item.id = val.id;
            item.src = val.src;
            val.id == id ? item.show =false: item.show = val.show

            return item
        })
        console.log(tmp)
        let isAllHide = tmp.every(val=>{
            return !val.show

        })

        if(isAllHide) {
            // console.log('全部都隐藏了')
            this.btnInfo = {
                msg: "使用已经上传的照片",
                status: true
             }
        }
        this.historyImgList = tmp
      },

      handleBtn(){
          // 使用已经上传的照片
          if(this.btnInfo.status) {
             let tmp = this.historyImgList.map(val=>{
                 let item = {}
                 item.src = val.src
                 item.id = val.id
                 item.show = true
                 return item
             })
             this.historyImgList = tmp
             this.btnInfo = {
                msg: "不使用已经上传的照片",
                status: false
             }
          } else {  // 不使用已经上传的照片
            let tmp = this.historyImgList.map(val=>{
                 let item = {}
                 item.src = val.src
                 item.id = val.id
                 item.show = false
                 return item
             })
             this.historyImgList = tmp
             this.btnInfo = {
                msg: "使用已经上传的照片",
                status: true
             }
          }
      },

      handlePreview(src){
          console.log(11111111111111111111111111111111111)
        //   console.log(src)
        //   this.previewImgSrc = src
        //   this.previewImgVisible = true
      },

      handleImgPreview(src){
        //   console.log(11111111111111111111111111111111111)
        console.log(src)
                  this.previewImgSrc = src
          this.previewImgShow = true
      }
  },

  created() {},

  computed: {
      historyImgList: {
         get() {
             return this.fileList
         },
         set(val) {
             this.$emit('update:fileList', val)
         }
      }
  },

  components: {
      ImgPreview
  }
};
</script>

<style lang='less'>
.show-history-img {
    .btn {
        text-align: left;
        >button {
            padding: 6px;
        }
    }
}

</style>
<style lang='scss' scoped>

</style>
