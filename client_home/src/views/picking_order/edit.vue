<template>
	<div class="diy_edit page_picking_order" id="picking_order_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','task_number') || $check_field('add','task_number') || $check_field('get','task_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								任务编号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_task_number" v-model="form['task_number']" placeholder="请输入任务编号" v-if="(form['task_number'] && $check_field('set','task_number')) || (!form['task_number'] && $check_field('add','task_number'))"  :disabled="disabledObj['task_number_isDisabled']"/>
							<span v-else-if="$check_field('get','task_number')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','task_name') || $check_field('add','task_name') || $check_field('get','task_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								任务名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_task_name" v-model="form['task_name']" placeholder="请输入任务名称" v-if="(form['task_name'] && $check_field('set','task_name')) || (!form['task_name'] && $check_field('add','task_name'))"  :disabled="disabledObj['task_name_isDisabled']"/>
							<span v-else-if="$check_field('get','task_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','publishing_users') || $check_field('add','publishing_users') || $check_field('get','publishing_users')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								发布用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_publishing_users" :disabled="disabledObj['publishing_users_isDisabled']" v-model="form['publishing_users']" v-if="(form['publishing_users'] && $check_field('set','publishing_users')) || (!form['publishing_users'] && $check_field('add','publishing_users'))" >
								<option v-for="o in list_user_publishing_users" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','publishing_users')">{{ form['publishing_users'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','item_weight') || $check_field('add','item_weight') || $check_field('get','item_weight')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								物品重量:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_item_weight" v-model="form['item_weight']" placeholder="请输入物品重量" v-if="(form['item_weight'] && $check_field('set','item_weight')) || (!form['item_weight'] && $check_field('add','item_weight'))"  :disabled="disabledObj['item_weight_isDisabled']"/>
							<span v-else-if="$check_field('get','item_weight')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','item_type') || $check_field('add','item_type') || $check_field('get','item_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								物品类型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_item_type" v-model="form['item_type']" placeholder="请输入物品类型" v-if="(form['item_type'] && $check_field('set','item_type')) || (!form['item_type'] && $check_field('add','item_type'))"  :disabled="disabledObj['item_type_isDisabled']"/>
							<span v-else-if="$check_field('get','item_type')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','pickup_address') || $check_field('add','pickup_address') || $check_field('get','pickup_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								取货地址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pickup_address" v-model="form['pickup_address']" placeholder="请输入取货地址" v-if="(form['pickup_address'] && $check_field('set','pickup_address')) || (!form['pickup_address'] && $check_field('add','pickup_address'))"  :disabled="disabledObj['pickup_address_isDisabled']"/>
							<span v-else-if="$check_field('get','pickup_address')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','shipping_address') || $check_field('add','shipping_address') || $check_field('get','shipping_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								送货地址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_shipping_address" v-model="form['shipping_address']" placeholder="请输入送货地址" v-if="(form['shipping_address'] && $check_field('set','shipping_address')) || (!form['shipping_address'] && $check_field('add','shipping_address'))"  :disabled="disabledObj['shipping_address_isDisabled']"/>
							<span v-else-if="$check_field('get','shipping_address')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','task_commission') || $check_field('add','task_commission') || $check_field('get','task_commission')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								任务佣金:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_task_commission" v-model="form['task_commission']" placeholder="请输入任务佣金" v-if="(form['task_commission'] && $check_field('set','task_commission')) || (!form['task_commission'] && $check_field('add','task_commission'))"  :disabled="disabledObj['task_commission_isDisabled']"/>
							<span v-else-if="$check_field('get','task_commission')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','quantity_received') || $check_field('add','quantity_received') || $check_field('get','quantity_received')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领取数量:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_quantity_received" v-model="form['quantity_received']" v-if="(form['quantity_received'] && $check_field('set','quantity_received')) || (!form['quantity_received'] && $check_field('add','quantity_received'))" >
								<option v-for="o in list_quantity_received" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','quantity_received')">{{ form['quantity_received'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','pickup_code') || $check_field('add','pickup_code') || $check_field('get','pickup_code')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								取货码:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pickup_code" v-model="form['pickup_code']" placeholder="请输入取货码" v-if="(form['pickup_code'] && $check_field('set','pickup_code')) || (!form['pickup_code'] && $check_field('add','pickup_code'))"  :disabled="disabledObj['pickup_code_isDisabled']"/>
							<span v-else-if="$check_field('get','pickup_code')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','runner') || $check_field('add','runner') || $check_field('get','runner')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								跑腿用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_runner" :disabled="disabledObj['runner_isDisabled']" v-model="form['runner']" v-if="(form['runner'] && $check_field('set','runner')) || (!form['runner'] && $check_field('add','runner'))" >
								<option v-for="o in list_user_runner" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','runner')">{{ form['runner'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','full_name') || $check_field('add','full_name') || $check_field('get','full_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_full_name" v-model="form['full_name']" placeholder="请输入姓名" v-if="(form['full_name'] && $check_field('set','full_name')) || (!form['full_name'] && $check_field('add','full_name'))"  :disabled="disabledObj['full_name_isDisabled']"/>
							<span v-else-if="$check_field('get','full_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','order_status') || $check_field('add','order_status') || $check_field('get','order_status')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								订单状态:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_order_status" v-model="form['order_status']" v-if="(form['order_status'] && $check_field('set','order_status')) || (!form['order_status'] && $check_field('add','order_status'))" >
								<option v-for="o in list_order_status" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','order_status')">{{ form['order_status'] }}</span>
						</div>
							</div>
	




				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/picking_order/get_obj?",
				url_add: "~/api/picking_order/add?",
				url_set: "~/api/picking_order/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"task_number": "",
							"task_name": "",
							"publishing_users": 0,
							"item_weight": "",
							"item_type": "",
							"pickup_address": "",
							"shipping_address": "",
							"task_commission": "",
							"quantity_received": "",
							"pickup_code": "",
							"runner": 0,
							"full_name": "",
							"order_status": "",
						"picking_order_id": 0,
				},

				obj: {
						"task_number":  '', // 任务编号
							"task_name":  '', // 任务名称
							"publishing_users": 0, // 发布用户
							"item_weight":  '', // 物品重量
							"item_type":  '', // 物品类型
							"pickup_address":  '', // 取货地址
							"shipping_address":  '', // 送货地址
							"task_commission":  '', // 任务佣金
							"quantity_received": null, // 领取数量
							"pickup_code":  '', // 取货码
							"runner": 0, // 跑腿用户
							"full_name":  '', // 姓名
							"order_status":  '', // 订单状态
						"picking_order_id": 0,
				},

				// 表单字段
				form: {
						"task_number":  '', // 任务编号
							"task_name":  '', // 任务名称
							"publishing_users": 0, // 发布用户
							"item_weight":  '', // 物品重量
							"item_type":  '', // 物品类型
							"pickup_address":  '', // 取货地址
							"shipping_address":  '', // 送货地址
							"task_commission":  '', // 任务佣金
							"quantity_received":  '', // 领取数量
							"pickup_code":  '', // 取货码
							"runner": 0, // 跑腿用户
							"full_name":  '', // 姓名
							"order_status":  '', // 订单状态
						"picking_order_id": 0,
				},
				disabledObj:{
						"task_number_isDisabled": false,
							"task_name_isDisabled": false,
							"publishing_users_isDisabled": false,
							"item_weight_isDisabled": false,
							"item_type_isDisabled": false,
							"pickup_address_isDisabled": false,
							"shipping_address_isDisabled": false,
							"task_commission_isDisabled": false,
							"quantity_received_isDisabled": false,
							"pickup_code_isDisabled": false,
							"runner_isDisabled": false,
							"full_name_isDisabled": false,
							"order_status_isDisabled": false,
					},

										// 用户列表
				list_user_publishing_users: [],
																// 领取数量选项列表
				list_quantity_received: ['1'],
										// 用户列表
				list_user_runner: [],
								// 订单状态选项列表
				list_order_status: ['取货中','送货中','已完成'],
		
				// ID字段
				field: "picking_order_id",

			}
		},
		methods: {
			
				
						/**
			 * 获取雇主用户用户列表
			 */
			async get_list_user_publishing_users() {
				// if(this.user_group !== "管理员" && this.form["publishing_users"] === 0) {
				//     this.form["publishing_users"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=雇主用户");
				if(json.result && json.result.list){
					this.list_user_publishing_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
		
				
				
				
				
				
				
				
						/**
			 * 获取跑腿用户用户列表
			 */
			async get_list_user_runner() {
				// if(this.user_group !== "管理员" && this.form["runner"] === 0) {
				//     this.form["runner"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=跑腿用户");
				if(json.result && json.result.list){
					this.list_user_runner = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					async get_user_session_runner(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=跑腿用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["runner"] = user_id
								_this.disabledObj['runner' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "runner") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/picking_order/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
																										
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
												this.get_list_user_publishing_users();
																											this.get_user_session_runner();
					this.get_list_user_runner();
									},
	}
</script>

<style>




</style>
