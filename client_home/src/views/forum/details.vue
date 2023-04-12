<template>
  <div class="page_forum" id="forum_details">
    <div class="warp" v-if="$check_action('/forum/details', 'get')">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-12">
            <div class="card">
              <div class="forum_detail">
                <!--<h4>论坛详情</h4>-->
                <div_forum :obj="obj"></div_forum>
              </div>
            </div>
          </div>

          <!--<div class="col-12 col-md-3">-->
          <!--<div class="card">-->
          <!--<div class="list_hot">-->
          <!--<h4>热门论坛推荐</h4>-->
          <!--<list_forum_hot :list="list_hot"></list_forum_hot>-->
          <!--</div>-->
          <!--</div>-->
          <!--</div>-->
        </div>
      </div>
    </div>

    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col forum-detail-comment">
            <bar_title class="mt" title="评论区"></bar_title>
            <div class="comment_box">
              <list_comment
                      class="w-100"
                      :list="list_comment"
                      :obj="form_comment"
              ></list_comment>
              <!-- 分页器 -->
              <b-pagination-nav
                      :base-url="$route.path"
                      :number-of-pages="count_pages"
                      :link-gen="link_gen"
                      @change="change_page"
                      first-number
                      last-number
              ></b-pagination-nav>
            </div>

            <div class="form_editor">
              <div class="fl ml-3" v-show="form_comment.reply_to_id">
                对 <i>{{ respondent }}</i> 回复
              </div>
              <div class="fr mr-3" v-show="form_comment.reply_to_id">
                <b-button
                        variant="outline-primary"
                        size="sm"
                        @click="form_comment.reply_to_id = 0"
                >重置回复人</b-button
                >
              </div>
              <form_editor
                      class="fn"
                      :form="form_comment"
                      @update_comment="update_comment"
              ></form_editor>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import bar_title from "@/components/diy/bar_title.vue";
  import div_forum from "@/components/diy/div_forum.vue";
  import list_comment from "@/components/diy/list_comment.vue";
  import list_forum_hot from "@/components/diy/list_forum_hot.vue";
  import form_editor from "@/components/diy/form_editor.vue";

  import mixin from "@/mixins/page.js";
  export default {
    mixins: [mixin],
    components: {
      bar_title,
      div_forum,
      list_comment,
      list_forum_hot,
      form_editor,
    },
    data() {
      return {
        url_get_obj: "~/api/forum/get_obj?",
        field: "forum_id",
        query: {
          forum_id: 0,
        },
        obj: {},
        list_comment: [],
        list_hot: [],
        form_comment: {
          source_table: "forum",
          source_field: "forum_id",
          source_id: 0,
          reply_to_id: "0",
        },
        // 页面数
        count_pages: 1,
        // 是否设置过
        seted_count_pages: true,
      };
    },
    methods: {
      /**
       * 获取论坛后
       * @param { Object } json 响应对象
       */
      get_obj_after(json) {
        var obj = json.result.obj;
        this.get_comment(obj);
        this.add_hits(json.result.obj);
        this.get_hot_forum();
        this.form_comment.source_id = this.query.forum_id;
      },
      /**
       * 获取评论
       * @param { Object } obj 文章对象
       * @param { Number } page 分页数
       * @param { Number } size 评论显示条数
       */
      get_comment(obj, page = 1, size = 5) {
        var query = {
          source_table: "forum",
          source_field: "forum_id",
          source_id: obj.forum_id,
          page,
          size,
          reply_to_id: "0",
          orderby: "create_time desc",
        };
        this.$get("~/api/comment/get_list?", query, (json) => {
          if (json.result) {
            var list_comment = json.result.list;
            list_comment.map((o) => {
              o.list_reply = [];
            });
            this.add_reply(list_comment).then((list) => {
              this.list_comment = list;
            });
            // 分页器
            if (this.seted_count_pages) {
              this.seted_count_pages = false;
              this.count_pages = Math.ceil(json.result.count / size);
            }
          }
        });
      },

      /**
       * @param { Array } list 评论列表
       * 添加回复到评论列表
       */
      add_reply(list) {
        return new Promise((resolve) => {
          for (let idx = 0; idx < list.length; idx++) {
            const obj = list[idx];
            this.$get(
                    "~/api/comment/get_list?",
                    {
                      source_table: "forum",
                      source_field: "forum_id",
                      source_id: obj.forum_id,
                      orderby: "create_time desc",
                      reply_to_id: obj.comment_id,
                    },
                    (res) => {
                      if (res.result) {
                        obj.list_reply = res.result.list;
                      }
                    }
            );
          }
          resolve(list);
        });
      },

      /**
       * 获取热门论坛
       */
      get_hot_forum() {
        this.$get(
                "~/api/forum/get_list",
                {
                  page: 1,
                  size: 10,
                  orderby: "hits",
                },
                (res) => {
                  if (res.result) {
                    this.list_hot = res.result.list;
                  }
                }
        );
      },
      /**
       * 添加访问量
       * @param { Object } obj 点击对象
       */
      add_hits(obj) {
        this.$post(
                "~/api/forum/set?forum_id=" + obj.forum_id,
                {
                  hits: obj.hits + 1,
                },
                (res) => {
                  obj.hits += 1;
                  console.log(res);
                }
        );
      },
      /**
       * 更新评论
       */
      update_comment() {
        this.get_comment(this.obj);
      },
      /**
       * 分页器
       * @param { Number } page_num 分页数
       * @return { Object } 查询对象
       */
      link_gen(page_num) {
        return {
          query: this.query,
        };
      },
      /**
       * 加载下一页
       */
      change_page(page_num) {
        this.get_comment(this.obj, page_num);
        this.form_comment.reply_to_id = 0;
      },
    },
    computed: {
      respondent() {
        var reply_to_id = this.form_comment.reply_to_id;
        var respondent = "";
        this.list_comment.map((o) => {
          if (o.comment_id === reply_to_id) {
            respondent = o.nickname;
          }
        });
        return respondent;
      },
    },
  };
</script>

<style scoped>
  .page_forum {
    background: #f7f7f7;
    padding-bottom: 1rem;
  }

  .bar_title {
    background: none;
  }

  .recommend {
    margin: 0.5rem;
    background: #fff;
    border-radius: 0.5rem;
    overflow: hidden;
  }

  .link {
    text-align: center;
    padding: 0.5rem 0;
    border: 1px solid #dbdbdb;
    border-radius: 0.5rem;
  }
  .form_editor {
    padding: 10px;
  }

  .comment_box {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
</style>
