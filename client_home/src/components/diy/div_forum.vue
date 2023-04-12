<template>
  <div class="div_forum">
    <div class="title">{{ obj[vm.title] }}</div>
    <div class="title_nav">
      <span><b-icon icon="person-fill"></b-icon>{{ obj[vm.nickname] }}</span>
      <span style="margin-left: 10px">{{ $toTime(obj[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}</span>
    </div>
    <div v-html="obj[vm.content]" class="content"></div>
    <div class="aside list">
      <div class="aside_1 col-12">
        <span class="tag ellipsis_1 mr-1" v-for="o in obj[vm.tag]">{{ o }}</span>
        <!--<router-link to="obj[vm.url]" v-if="obj[vm.source]">-->
        <!--<span class="source">{{ obj[vm.source] }}</span>-->
        <!--</router-link>-->
        <!--<span class="time">{{ obj[vm.create_time] }}</span>-->
      </div>
      <div class="btns_add col-12 col-sm-6">
        <!-- 点赞按钮 -->
        <div
                v-if="check_praised"
                class="praise_btn praise_change"
                @click="add_praise()"
        >
          <b-icon icon="hand-thumbs-up" class="icon icon_change"></b-icon
          ><span class="word_change">点赞</span>
        </div>
        <div v-else class="praise_btn" @click="add_praise()">
          <b-icon icon="hand-thumbs-up" class="icon"></b-icon>
          <span>点赞</span>
        </div>
        <!-- 收藏按钮 -->
        <div
                v-if="check_collected"
                class="collect_btn collect_change"
                @click="add_collect()"
        >
          <b-icon icon="heart-fill" class="icon icon_change"></b-icon>
          <span class="word_change">收藏</span>
        </div>
        <div v-else class="collect_btn" @click="add_collect()">
          <b-icon icon="heart" class="icon"></b-icon>
          <span>收藏</span>
        </div>
      </div>
      <div class="aside_2 col-12 col-sm-6">
        <div class="praise">
          <span>点赞数：{{ obj[vm.praise_len] }}</span>
        </div>
        <div class="see">
          <span>点击数：{{ obj[vm.hits] }}</span>
        </div>
      </div>
    </div>
    <!--<div class="description">{{ obj[vm.description] }}</div>-->
  </div>
</template>

<script>
  export default {
    props: {
      obj: {
        type: Object,
        default: function () {
          return {};
        },
      },
      vm: {
        type: Object,
        default: function () {
          return {
            img: "img",
            tag: "tag",
            url: "url",
            title: "title",
            source: "source",
            description: "description",
            content: "content",
            create_time: "create_time",
            hits: "hits",
            praise_len: "praise_len",
            nickname:"nickname"
          };
        },
      },
    },
    data() {
      return {
        // 是否已点赞
        check_praised: false,
        // 是否已收藏
        check_collected: false,
      };
    },
    methods: {

      /**
       * 获取点赞
       * @param {Object} obj
       */
      get_praise() {
        let user_id = this.$store.state.user.user_id;

        // this.$get("~/api/praise/count?", {
        //   source_table: "forum",
        //   source_field: "forum_id",
        //   source_id: obj["custom_goods_id"]
        // }, (res) => {
        //   if (res.result || res.result === 0) {
        //     this.praise = res.result;
        //     console.log("点赞数：" ,res.result);
        //   }
        //   else if (res.error){
        //     this.$toast(res.error.message);
        //     console.error(res.error);
        //   }
        // });
        this.$get("~/api/praise/count?", {
          source_table: "forum",
          source_field: "forum_id",
          source_id: this.obj.forum_id,
          user_id
        }, (res) => {
          if (res.result || res.result === 0) {
            this.check_praised = res.result ? true : false;
            console.log("点赞状态：" ,res.result);
          }
          else if (res.error){
            this.$toast(res.error.message);
            console.error(res.error);
          }
        })
      },
      /**
       *  添加点赞
       */
      add_praise() {
        var body = {
          source_table: "forum",
          source_field: "forum_id",
          source_id: this.obj.forum_id,
          user_id: this.$store.state.user.user_id,
        };
        let _this = this;
        if (!_this.check_praised) {
          _this.check_praised = true;
          this.$post("~/api/praise/add?", body, (res) => {
            _this.obj.praise_len += 1;
            console.log(res);
            this.$post('~/api/forum/set?forum_id=' + _this.obj.forum_id, {
              "praise_len":_this.obj.praise_len
            }, (res) => {
              if(res.result){
                console.log("添加点赞数状态：" ,res.result);
              }
              else if(res.error){
                console.error(res.error);
              }
            });
          });
        } else {
          _this.check_praised = false;
          this.$get("~/api/praise/del", body, (res) => {
            _this.obj.praise_len -= 1;
            console.log(res);
            this.$post('~/api/forum/set?forum_id=' + _this.obj.forum_id, {
              "praise_len":_this.obj.praise_len
            }, (res) => {
              if(res.result){
                console.log("添加点赞数状态：" ,res.result);
              }
              else if(res.error){
                console.error(res.error);
              }
            });
          });
        }
      },
      /**
       * 初始化收藏状态
       * @param {Object} obj
       */
      get_collect() {
        let user_id = this.$store.state.user.user_id;

        var query = {
          source_table: "forum",
          source_field: "forum_id",
          source_id: this.obj.forum_id,
          user_id
        };

        this.$get('~/api/collect/count?', query, (res) => {
          if (res.result || res.result === 0) {
            var bl = res.result ? true : false;
            this.check_collected = bl;
            console.log("收藏状态：" + bl);
          }
          else if(res.error) {
            console.error(res.error);
          }
        });
      },
      /**
       * 添加收藏
       */
      add_collect() {
        var { title, img, forum_id } = this.obj;
        var body = {
          title,
          img,
          source_table: "forum",
          source_field: "forum_id",
          source_id: forum_id,
          user_id: this.$store.state.user.user_id,
        };
        if (!this.check_collected) {
          this.check_collected = true;
          this.$post("~/api/collect/add?", body, (res) => {
            this.$toast("收藏成功");
            console.log(res);
          });
        } else {
          this.check_collected = false;
          this.$get("~/api/collect/del", body, (res) => {
            this.$toast("取消收藏");
          });
        }
      },
      init_tag(){
        console.log(this.obj.tag)
        this.obj.tag = this.obj.tag.split("|");
        console.log(this.obj.tag)
      }
    },
    created(){
      setTimeout(() => {
        this.init_tag();
        this.get_praise();
        this.get_collect();
      }, 300)
    }
  };
</script>

<style scoped>
  .ellipsis_1 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
  }
  div {
    user-select: none;
  }

  .div_forum {
    padding: 1.5rem 1rem;
  }

  .aside {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    margin: 0 0.625rem 0.625rem 0;
    font-size: 0.875rem;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: rgba(0, 0, 0, 0.3);
  }

  .aside > * {
    display: flex;
    align-items: center;
    height: 2rem;
  }

  .source {
    color: #576b95;
  }

  .tag {
    display: flex;
    align-items: center;
    padding: 0 0.25rem;
    font-size: 0.75rem;
    border-radius: 0.125rem;
    background: rgba(0, 0, 0, 0.05);
    color: rgba(0, 0, 0, 0.3);
  }

  .collect_btn,
  .praise_btn {
    margin-right: 0.5rem;
    display: flex;
    white-space: nowrap;
    padding: 0.125rem 0.5rem;
    border-radius: 0.25rem;
    color: var(--color_base);
    border: 1px solid var(--color_default);
    cursor: pointer;
  }

  .icon_change {
    color: var(--color_primary);
  }

  .collect_btn:hover {
    border: 1px solid var(--color_primary);
    color: var(--color_primary);
  }

  .praise_btn:hover {
    border: 1px solid var(--color_primary);
    color: var(--color_primary);
  }

  .icon {
    font-size: 15px;
    margin: 3px;
  }

  .word_change {
    color: var(--color_primary);
    font-weight: bold;
  }

  .title {
    font-size: 1.35rem;
    line-height: 1.4;
    margin-bottom: 20px;
    font-weight: 400;
  }
  .title_nav{
    font-size: 1rem;
    color: #666;
    margin-bottom: 20px;
  }

  .time {
    position: relative;
    top: 0.125rem;
  }

  .description {
    margin-bottom: 1rem;
    color: #292828;
  }

  .div_forum .see {
    margin-left: 1rem;
  }

  .div_forum .time {
    color: #999;
  }
  .content{
    margin-bottom: 20px;
  }
</style>
