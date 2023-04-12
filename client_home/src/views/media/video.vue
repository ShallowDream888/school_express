<template>
  <div class="page_media" id="media_video">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="video_show">
            <video
                    id="myVideo"
                    :src="url"
                    controls
            >
              您的浏览器不支持Video标签。
            </video>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import host_config from "@/plugins/port_config.js";
  export default {
    data() {
      return {
        url: host_config+"static/upload/movie.mp4",
      };
    },
    methods: {},
    created(){
      let filename = this.$route.query.filename
      if (filename){
        this.url = filename
      }
    }
  };
</script>

<style scoped>
  .container{
    min-height: 750px;
  }
  #myVideo {
    width: 100%;
  }
  #media_video {
    display: flex;
    justify-content: space-between;
    margin-top: 50px;
  }
  #media_video .video_show {
    width: 100%;
  }
</style>
