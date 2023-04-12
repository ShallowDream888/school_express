<template>
	<div class="diy_home diy_list diy_collecting_tasks_on_behalf" id="diy_collecting_tasks_on_behalf_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/collecting_tasks_on_behalf/details?collecting_tasks_on_behalf_id=' + o['collecting_tasks_on_behalf_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/collecting_tasks_on_behalf/details') && +item.is_img_list">
						<div class="diy_title diy_list_img_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="diy_field diy_img">
							<img :src="$fullUrl(o[item.name])" style="width:100%;height:100%" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="diy_list_item_box">
					<div class="diy_list_item_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/collecting_tasks_on_behalf/details') && +item.is_img_list">
							<div class="diy_title">
								<span>{{item.title}}:</span>
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
		<div class="diy_view_table" v-else>
			<table class="diy_table">
				<tr class="diy_row">
						<th class="diy_title" v-if="$check_field('get','task_number')">
						任务编号
					</th>
							<th class="diy_title" v-if="$check_field('get','task_name')">
						任务名称
					</th>
							<th class="diy_title" v-if="$check_field('get','publishing_users')">
						发布用户
					</th>
							<th class="diy_title" v-if="$check_field('get','item_picture')">
						物品图片
					</th>
							<th class="diy_title" v-if="$check_field('get','item_weight')">
						物品重量
					</th>
							<th class="diy_title" v-if="$check_field('get','item_type')">
						物品类型
					</th>
							<th class="diy_title" v-if="$check_field('get','order_quantity')">
						订单数量
					</th>
							<th class="diy_title" v-if="$check_field('get','pickup_address')">
						取货地址
					</th>
							<th class="diy_title" v-if="$check_field('get','shipping_address')">
						送货地址
					</th>
							<th class="diy_title" v-if="$check_field('get','task_commission')">
						任务佣金
					</th>
					</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
						<td class="diy_field diy_text" v-if="$check_field('get','task_number')">
						<span>
							{{ o["task_number"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','task_name')">
						<span>
							{{ o["task_name"] }}
						</span>
					</td>
							<td class="diy_field diy_uid" v-if="$check_field('get','publishing_users')">
						<span>
							{{ get_user_name('publishing_users',o['publishing_users']) }}
						</span>
					</td>
							<td class="diy_field" v-if="$check_field('get','item_picture')">
						<img class="diy_img" :src="o['item_picture']" />
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','item_weight')">
						<span>
							{{ o["item_weight"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','item_type')">
						<span>
							{{ o["item_type"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','order_quantity')">
						<span>
							{{ o["order_quantity"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','pickup_address')">
						<span>
							{{ o["pickup_address"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','shipping_address')">
						<span>
							{{ o["shipping_address"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','task_commission')">
						<span>
							{{ o["task_commission"] }}
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
				default: function() {
					return [];
				},
			},
			show: {
				type: Boolean,
				default: function(){
					return true;
				}
			}
		},
		data() {
			return {
						imgList: [
						{
							title: "物品图片",
							name: "item_picture",
							type: "图片",
							is_img_list: "1"
						},
						],
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
									is_img_list: "1"
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
									is_img_list: "1"
								},
								{
									title: "物品类型",
									name: "item_type",
									type: "文本",
									is_img_list: "1"
								},
								{
									title: "订单数量",
									name: "order_quantity",
									type: "下拉",
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
						],
						richList: [
						],
							// 用户列表
				list_user_publishing_users: [],
											};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
							if (name == 'publishing_users'){
					obj = this.list_user_publishing_users.getObj({"user_id":id});
				}
												var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
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
				if(json.result && json.result.list){
					this.list_user_publishing_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
										},
		created() {
						this.get_list_user_publishing_users();
										},
		computed:{
			showItemList(){
				let arr = [];
				let _type = ["视频","音频","文件"];
				this.itemList.forEach(item => {
					if(_type.indexOf(item.type) === -1 && !!+item.is_img_list){
						arr.push(item)
					}
				})
				return arr.slice(0,4);
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
			width: calc(33% - 1rem);
			;
		}

	}

	@media (max-width: 768px) {

		.goods {
			width: calc(50% - 1rem);
			;
		}

	}
</style>

