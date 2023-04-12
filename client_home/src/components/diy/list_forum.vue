<template>
  <div class="list_forum">
    <router-link
            class="item_forum"
            v-for="(o, i) in list"
            :key="i"
            :to="'/forum/details?' + vm.forum_id + '=' + o[vm.forum_id]"
    >
      <div class="left">
        <img class="img_block" :src="$fullUrl(o[vm.img])" />
      </div>
      <div class="right_block">
        <div class="top ellipsis_2">
          {{ o[vm.title] }}
        </div>
        <div class="forum_center ellipsis_2">
          {{ $toTime(o[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}
        </div>
        <!--<div class="forum_center ellipsis_2">-->
        <!--{{ o[vm.keywords] }}-->
        <!--</div>-->
        <div class="bottom">
          <div>
            <div class="time"><b-icon icon="person-fill"></b-icon>{{ o[vm.nickname] }}</div>
          </div>
          <div>
            <span class="praise">点赞&nbsp;{{ o[vm.praise_len] }}</span>
            <span class="see"> 点击&nbsp;{{ o[vm.hits] }} </span>
          </div>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
  export default {
    props: {
      list: {
        type: Array,
        default: function () {
          return [];
        },
      },
      vm: {
        type: Object,
        default: function () {
          return {
            img: "img",
            forum_id: "forum_id",
            title: "title",
            description: "description",
            create_time: "create_time",
            content: "content",
            praise_len: "praise_len",
            hits: "hits",
            tag: "tag",
            keywords: "keywords",
            nickname:"nickname"
          };
        },
      },
    },
    methods: {},
  };
</script>

<style scoped>
  .ellipsis_2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-break: break-all;
  }
  .list_forum .item_forum {
    display: flex;
    justify-content: space-between;
    align-items: stretch;
    padding: 0.5rem;
    height: 120px;
    margin: 10px 0px;
  }
  .list_forum .item_forum + .item_forum {
    border-top: 1px solid #dbdbdb;
  }
  .list_forum .item_forum .left {
    width: 6rem;
    height: 6rem;
  }
  .list_forum .item_forum .left > img {
    height: 100% !important;
    width: 100% !important;
    position: relative;
    top: 50%;
    transform: translate(0, -50%);
    border-radius: 0.5rem;
  }

  .list_forum .item_forum .right_block {
    width: calc(100% - 5rem);
    display: flex;
    flex-direction: column;
    /*justify-content: space-between;*/
    margin: 5px 10px;
  }

  .list_forum .top {
    font-size: 0.9rem;
    font-size: 18px;
    font-weight: bold;
  }

  .list_forum .forum_center {
    font-size: 12px;
    margin-top: 10px;
    color: var(--color_grey);
  }

  .list_forum .bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    font-size: 0.5rem;
    color: var(--color_grey);
    margin-top: 20px;
  }
  .list_forum .bottom>* {
    font-size: 0.6rem;
    flex: 0 0 50%;
    color: var(--color_grey);
  }
</style>
