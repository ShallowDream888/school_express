<template>
  <div id="diy_employer_user_list" class="diy_home diy_list diy_employer_user">
    <!-- 列表 -->
    <div v-if="show" class="diy_view_list list list-x">
      <router-link v-for="(o, i) in list" :key="i" :to="'/employer_user/details?employer_user_id=' + o['employer_user_id']"
                   class="diy_card goods diy_list_box_wrap">
        <!-- 图片 -->
        <div v-if="imgList.length" class="diy_list_img_box">
          <div v-for="(item,index) in imgList" v-show="$check_field('get',item.name,'/employer_user/details') && +item.is_img_list" :key="item+index"
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
            <div v-if="$check_field('get',item.name,'/employer_user/details') && +item.is_img_list" :class="{[item.name]:true}"
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
          <th v-if="$check_field('get','student_number')" class="diy_title">
            学号
          </th>
          <th v-if="$check_field('get','full_name')" class="diy_title">
            姓名
          </th>
          <th v-if="$check_field('get','gender')" class="diy_title">
            性别
          </th>
          <th v-if="$check_field('get','major')" class="diy_title">
            专业
          </th>
          <th v-if="$check_field('get','department')" class="diy_title">
            院系
          </th>
          <th v-if="$check_field('get','dormitory')" class="diy_title">
            宿舍
          </th>
        </tr>
        <tr v-for="(o,i) in list" :key="o+i" class="diy_row">
          <td v-if="$check_field('get','student_number')" class="diy_field diy_text">
						<span>
							{{ o["student_number"] }}
						</span>
          </td>
          <td v-if="$check_field('get','full_name')" class="diy_field diy_text">
						<span>
							{{ o["full_name"] }}
						</span>
          </td>
          <td v-if="$check_field('get','gender')" class="diy_field diy_text">
						<span>
							{{ o["gender"] }}
						</span>
          </td>
          <td v-if="$check_field('get','major')" class="diy_field diy_text">
						<span>
							{{ o["major"] }}
						</span>
          </td>
          <td v-if="$check_field('get','department')" class="diy_field diy_text">
						<span>
							{{ o["department"] }}
						</span>
          </td>
          <td v-if="$check_field('get','dormitory')" class="diy_field diy_text">
						<span>
							{{ o["dormitory"] }}
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
          title: "学号",
          name: "student_number",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "姓名",
          name: "full_name",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "性别",
          name: "gender",
          type: "下拉",
          is_img_list: "0"
        },
        {
          title: "专业",
          name: "major",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "院系",
          name: "department",
          type: "文本",
          is_img_list: "0"
        },
        {
          title: "宿舍",
          name: "dormitory",
          type: "文本",
          is_img_list: "0"
        },
      ],
      richList: [],
    };
  },
  methods: {
    get_user_name(name, id) {
      var obj = null;
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
  },
  created() {
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

