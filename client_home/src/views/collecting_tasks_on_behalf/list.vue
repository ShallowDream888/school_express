<template>
  <div id="collecting_tasks_on_behalf_list" class="diy_list page_collecting_tasks_on_behalf">
    <div class="warp">
      <div class="container diy_list_container">
        <div class="diy_list_title">
          <div class="col">
            <span class="title">代领任务列表</span>
          </div>
        </div>
        <div class="row diy_list_search">
          <div class="col">
            <!-- 搜索栏 -->
            <div class="view">
              <span class="diy_list_search_title">关键字搜索：</span>
              <b-form-input v-model="query['task_name']" class="mr-sm-2" placeholder="任务名称搜索" size="sm"/>
              <b-form-input v-model="query['item_type']" class="mr-sm-2" placeholder="物品类型搜索" size="sm"/>
              <b-button size="sm" @click="search()">
                <b-icon icon="search"/>
              </b-button>
            </div>
            <!-- /搜索栏 -->
          </div>
        </div>
        <div class="diy_list_select_box">
          <span class="diy_list_select_title">下拉搜索：</span>
          <div class="diy_list_dropdown_box">
            <div class="col">
              <!-- 筛选 -->
              <div class="view">
              </div>
              <!-- /筛选 -->
            </div>
          </div>
          <div class="diy_list_sort_box">
            <div class="col">
              <!-- 排序 -->
              <div class="view">
                <b-dropdown left text="排序" variant="outline-dark">
                  <b-dropdown-item v-for="(o, i) in list_sort" :key="i" @click="set_sort(o)">
                    {{ o.name }}
                  </b-dropdown-item>
                </b-dropdown>
              </div>
              <!--/排序 -->
            </div>
          </div>
        </div>

        <div class="row diy_list_box">
          <div class="col">
            <!-- 列表 -->
            <list_collecting_tasks_on_behalf :list="list"/>
            <!-- /列表 -->
          </div>
        </div>
        <div class="row diy_list_page_box">
          <div class="col overflow-auto flex_cc">
            <!-- 分页器 -->
            <!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :per-page="query.size"
                :total-rows="count"
                @change="goToPage"
            />
            <!-- /分页器 -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import list_collecting_tasks_on_behalf from "@/components/diy/list_collecting_tasks_on_behalf.vue";
import diy_pager from "@/components/diy/diy_pager";
import mixin from "@/mixins/page.js";

export default {
  mixins: [mixin],
  components: {
    diy_pager,
    list_collecting_tasks_on_behalf
  },
  data() {
    return {
      url_get_list: "~/api/collecting_tasks_on_behalf/get_list?like=0",

      // 查询条件
      query: {
        keyword: "",
        page: 1,
        size: 10,
        "task_name": "", // 任务名称
        "item_type": "", // 物品类型
      },

      // 排序内容
      list_sort: [{
        name: "创建时间从高到低",
        value: "create_time desc",
      },
        {
          name: "创建时间从低到高",
          value: "create_time asc",
        },
        {
          name: "更新时间从高到低",
          value: "update_time desc",
        },
        {
          name: "更新时间从低到高",
          value: "update_time asc",
        },
        {
          name: "任务名称正序",
          value: "task_name asc",
        },
        {
          name: "任务名称倒序",
          value: "task_name desc",
        },
        {
          name: "物品类型正序",
          value: "item_type asc",
        },
        {
          name: "物品类型倒序",
          value: "item_type desc",
        },
      ],

      // 订单数量列表
      "list_order_quantity": ['1'],

    }
  },
  methods: {
    get_list_before(param) {
    },
    /**
     * 筛选选择
     */
    filter_set(o, key) {
      if (o == "全部") {
        this.query[key] = "";
      } else {
        this.query[key] = o;
      }
      this.search();
    },

    /**
     * 排序
     */
    set_sort(o) {
      this.query.orderby = o.value;
      this.search();
    },


    /**
     * 筛选
     */
    /**
     * 重置
     */
    reset() {
      this.query.task_name = ""
      this.query.item_type = ""
      this.search();
    },

    // 返回条数
    toSize(i) {
      this.query.size = i;
      this.first();
    },

    // 返回页数
    toPage(i) {
      this.query.page = i;
      this.first();
    },

    goToPage(v) {
      this.query.page = v;
      this.goToNew(v)
    },

  },
  computed: {},
  created() {
  }
}
</script>

<style>
</style>
