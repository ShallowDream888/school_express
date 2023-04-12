<template>
  <div id="diy_picking_order_list" class="diy_home diy_list diy_picking_order">
    <!-- 列表 -->
    <div v-if="show" class="diy_view_list list list-x">
      <router-link v-for="(o, i) in list" :key="i" :to="'/picking_order/details?picking_order_id=' + o['picking_order_id']"
                   class="diy_card goods diy_list_box_wrap">
        <!-- 图片 -->
        <div v-if="imgList.length" class="diy_list_img_box">
          <div v-for="(item,index) in imgList" v-show="$check_field('get',item.name,'/picking_order/details') && +item.is_img_list" :key="item+index"
               class="diy_row">
            <div class="diy_title diy_list_img_title">
              <span>{{ item.title }}:</span>
            </div>
            <div class="diy_field diy_img">
              <img :src="$fullUrl(o[item.name])" style="width:100%;height:100%"/>
            </div>
          </div>
        </div>
        <!-- 内容 -->
        <div class="diy_list_item_box">
          <div v-for="(item,index) in showItemList" :key="item+index" class="diy_list_item_content">
            <div v-if="$check_field('get',item.name,'/picking_order/details') && +item.is_img_list" :class="{[item.name]:true}"
                 class="diy_row">
              <div class="diy_title">
                <span>{{ item.title }}:</span>
              </div>
              <div class="diy_field diy_text">
                <span v-if="item.type == 'UID'" v-text="get_user_name(item.name,o[item.name])"></span>
                <span v-else-if="item.type == '日期'" v-text="$toTime(o[item.name],'yyyy-MM-dd')"></span>
                <span v-else-if="item.type == '时间'" v-text="$toTime(o[item.name],'hh:mm:ss')"></span>
                <span v-else-if="item.type == '日长'" v-text="$toTime(o[item.name],'yyyy-MM-dd hh:mm:ss')"></span>
                <span v-else v-text="o[item.name]"></span>
              </div>
            </div>
          </div>
        </div>
      </router-link>
    </div>
    <!-- 表格 -->
    <div v-else class="diy_view_table">
      <table class="diy_table">
        <tr class="diy_row">
          <th v-if="$check_field('get','task_number')" class="diy_title">
            任务编号
          </th>
          <th v-if="$check_field('get','task_name')" class="diy_title">
            任务名称
          </th>
          <th v-if="$check_field('get','publishing_users')" class="diy_title">
            发布用户
          </th>
          <th v-if="$check_field('get','item_weight')" class="diy_title">
            物品重量
          </th>
          <th v-if="$check_field('get','item_type')" class="diy_title">
            物品类型
          </th>
          <th v-if="$check_field('get','pickup_address')" class="diy_title">
            取货地址
          </th>
          <th v-if="$check_field('get','shipping_address')" class="diy_title">
            送货地址
          </th>
          <th v-if="$check_field('get','task_commission')" class="diy_title">
            任务佣金
          </th>
          <th v-if="$check_field('get','quantity_received')" class="diy_title">
            领取数量
          </th>
          <th v-if="$check_field('get','pickup_code')" class="diy_title">
            取货码
          </th>
          <th v-if="$check_field('get','runner')" class="diy_title">
            跑腿用户
          </th>
          <th v-if="$check_field('get','full_name')" class="diy_title">
            姓名
          </th>
          <th v-if="$check_field('get','order_status')" class="diy_title">
            订单状态
          </th>
        </tr>
        <tr v-for="(o,i) in list" :key="o+i" class="diy_row">
          <td v-if="$check_field('get','task_number')" class="diy_field diy_text">
						<span>
							{{ o["task_number"] }}
						</span>
          </td>
          <td v-if="$check_field('get','task_name')" class="diy_field diy_text">
						<span>
							{{ o["task_name"] }}
						</span>
          </td>
          <td v-if="$check_field('get','publishing_users')" class="diy_field diy_uid">
						<span>
							{{ get_user_name('publishing_users', o['publishing_users']) }}
						</span>
          </td>
          <td v-if="$check_field('get','item_weight')" class="diy_field diy_text">
						<span>
							{{ o["item_weight"] }}
						</span>
          </td>
          <td v-if="$check_field('get','item_type')" class="diy_field diy_text">
						<span>
							{{ o["item_type"] }}
						</span>
          </td>
          <td v-if="$check_field('get','pickup_address')" class="diy_field diy_text">
						<span>
							{{ o["pickup_address"] }}
						</span>
          </td>
          <td v-if="$check_field('get','shipping_address')" class="diy_field diy_text">
						<span>
							{{ o["shipping_address"] }}
						</span>
          </td>
          <td v-if="$check_field('get','task_commission')" class="diy_field diy_text">
						<span>
							{{ o["task_commission"] }}
						</span>
          </td>
          <td v-if="$check_field('get','quantity_received')" class="diy_field diy_text">
						<span>
							{{ o["quantity_received"] }}
						</span>
          </td>
          <td v-if="$check_field('get','pickup_code')" class="diy_field diy_text">
						<span>
							{{ o["pickup_code"] }}
						</span>
          </td>
          <td v-if="$check_field('get','runner')" class="diy_field diy_uid">
						<span>
							{{ get_user_name('runner', o['runner']) }}
						</span>
          </td>
          <td v-if="$check_field('get','full_name')" class="diy_field diy_text">
						<span>
							{{ o["full_name"] }}
						</span>
          </td>
          <td v-if="$check_field('get','order_status')" class="diy_field diy_text">
						<span>
							{{ o["order_status"] }}
						</span>
          </td>
        </tr>
      </table>
    </div>
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
    show: {
      type: Boolean,
      default: function () {
        return true;
      }
    }
  },
  data() {
    return {
      imgList: [],
      itemList: [
        {
          title: "任务编号",
          name: "task_number",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "任务名称",
          name: "task_name",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "发布用户",
          name: "publishing_users",
          type: "UID",
          is_img_list: "0"
        },
        {
          title: "物品重量",
          name: "item_weight",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "物品类型",
          name: "item_type",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "取货地址",
          name: "pickup_address",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "送货地址",
          name: "shipping_address",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "任务佣金",
          name: "task_commission",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "领取数量",
          name: "quantity_received",
          type: "下拉",
          is_img_list: "0"
        },
        {
          title: "取货码",
          name: "pickup_code",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "跑腿用户",
          name: "runner",
          type: "UID",
          is_img_list: "0"
        },
        {
          title: "姓名",
          name: "full_name",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "订单状态",
          name: "order_status",
          type: "下拉",
          is_img_list: "0"
        },
      ],
      richList: [],
      // 用户列表
      list_user_publishing_users: [],
      // 用户列表
      list_user_runner: [],
    };
  },
  methods: {
    get_user_name(name, id) {
      var obj = null;
      if (name == 'publishing_users') {
        obj = this.list_user_publishing_users.getObj({"user_id": id});
      }
      if (name == 'runner') {
        obj = this.list_user_runner.getObj({"user_id": id});
      }
      var ret = "";
      if (obj) {
        ret = obj.nickname + "-" + obj.username;
        // if(obj.nickname){
        // 	ret = obj.nickname;
        // }
        // else{
        // 	ret = obj.username;
        // }
      }
      return ret;
    },
    /**
     * 获取雇主用户用户列表
     */
    async get_list_user_publishing_users() {
      var json = await this.$get("~/api/user/get_list?user_group=雇主用户");
      if (json.result && json.result.list) {
        this.list_user_publishing_users = json.result.list;
      } else if (json.error) {
        console.error(json.error);
      }
    },
    /**
     * 获取跑腿用户用户列表
     */
    async get_list_user_runner() {
      var json = await this.$get("~/api/user/get_list?user_group=跑腿用户");
      if (json.result && json.result.list) {
        this.list_user_runner = json.result.list;
      } else if (json.error) {
        console.error(json.error);
      }
    },
  },
  created() {
    this.get_list_user_publishing_users();
    this.get_list_user_runner();
  },
  computed: {
    showItemList() {
      let arr = [];
      let _type = ["视频", "音频", "文件"];
      this.itemList.forEach(item => {
        if (_type.indexOf(item.type) === -1 && !!+item.is_img_list) {
          arr.push(item)
        }
      })
      return arr.slice(0, 4);
    }
  }
};
</script>

<style scoped>
.media {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  flex-basis: 75%;
  min-height: 10rem;
}

.goods {
  display: flex;
  width: calc(25% - 1rem);
  margin: 0.5rem;
  padding: 0.5rem;
  flex-direction: column;
  justify-content: space-between;
  background-color: white;
  border-radius: 0.5rem;
}

.goods:hover {
  border: 0.2rem solid #909399;
  box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.15);
}

.goods:hover img {
  filter: blur(1px);
}

.price {
  font-size: 1rem;
  margin-right: 3px;
}

.price_ago {
  text-decoration: line-through;
  font-size: 0.5rem;
  color: #999;

}

.title {
  word-break: break-all;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-weight: 700;
  padding: .25rem;
}

.icon_cart {
  color: #FF5722;
  float: right;
}

@media (max-width: 992px) {

  .goods {
    width: calc(33% - 1rem);;
  }

}

@media (max-width: 768px) {

  .goods {
    width: calc(50% - 1rem);;
  }

}
</style>

