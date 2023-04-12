<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="校园新闻"
				source_table="article"
			  ></list_result_search>

				<!-- 论坛搜索结果 -->
			  <list_result_search
				:list="result_forum"
				title="留言板"
				source_table="forum"
			  ></list_result_search>

						  <list_result_search
				v-if="$check_action('/employer_user/list', 'get')"
				:list="result_employer_user_student_number"
				title="雇主用户学号"
				source_table="employer_user"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/employer_user/list', 'get')"
				:list="result_employer_user_major"
				title="雇主用户专业"
				source_table="employer_user"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/employer_user/list', 'get')"
				:list="result_employer_user_department"
				title="雇主用户院系"
				source_table="employer_user"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/runner/list', 'get')"
				:list="result_runner_student_number"
				title="跑腿用户学号"
				source_table="runner"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/runner/list', 'get')"
				:list="result_runner_major"
				title="跑腿用户专业"
				source_table="runner"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/runner/list', 'get')"
				:list="result_runner_department"
				title="跑腿用户院系"
				source_table="runner"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/collecting_tasks_on_behalf/list', 'get')"
				:list="result_collecting_tasks_on_behalf_task_name"
				title="代领任务任务名称"
				source_table="collecting_tasks_on_behalf"
			  ></list_result_search>
																	  <list_result_search
				v-if="$check_action('/collecting_tasks_on_behalf/list', 'get')"
				:list="result_collecting_tasks_on_behalf_item_type"
				title="代领任务物品类型"
				source_table="collecting_tasks_on_behalf"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/picking_order/list', 'get')"
				:list="result_picking_order_task_number"
				title="代领订单任务编号"
				source_table="picking_order"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/picking_order/list', 'get')"
				:list="result_picking_order_task_name"
				title="代领订单任务名称"
				source_table="picking_order"
			  ></list_result_search>
																																						  <list_result_search
				v-if="$check_action('/picking_order/list', 'get')"
				:list="result_picking_order_order_status"
				title="代领订单订单状态"
				source_table="picking_order"
			  ></list_result_search>
						</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
	  "result_forum": [],
						"result_employer_user_student_number":[],
														"result_employer_user_major":[],
								"result_employer_user_department":[],
												"result_runner_student_number":[],
														"result_runner_major":[],
								"result_runner_department":[],
															"result_collecting_tasks_on_behalf_task_name":[],
																	"result_collecting_tasks_on_behalf_item_type":[],
																					"result_picking_order_task_number":[],
								"result_picking_order_task_name":[],
																																						"result_picking_order_order_status":[],
				};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},
	/**
	 * 获取留言板
	 */
	get_forum() {
	  this.$get("~/api/forum/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_forum = json.result.list;
		}
	  });
	},

				/**
	 * 获取student_number
	 */
	get_employer_user_student_number(){
		let url = "~/api/employer_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "student_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_employer_user_student_number = json.result.list;
			result_employer_user_student_number.map(o => o.title = o['student_number'])
	  			this.result_employer_user_student_number = result_employer_user_student_number
		 	}
		});
	},
												/**
	 * 获取major
	 */
	get_employer_user_major(){
		let url = "~/api/employer_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "major": this.query.word }, (json) => {
		  if (json.result) {
			var result_employer_user_major = json.result.list;
			result_employer_user_major.map(o => o.title = o['major'])
	  			this.result_employer_user_major = result_employer_user_major
		 	}
		});
	},
						/**
	 * 获取department
	 */
	get_employer_user_department(){
		let url = "~/api/employer_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "department": this.query.word }, (json) => {
		  if (json.result) {
			var result_employer_user_department = json.result.list;
			result_employer_user_department.map(o => o.title = o['department'])
	  			this.result_employer_user_department = result_employer_user_department
		 	}
		});
	},
										/**
	 * 获取student_number
	 */
	get_runner_student_number(){
		let url = "~/api/runner/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "student_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_runner_student_number = json.result.list;
			result_runner_student_number.map(o => o.title = o['student_number'])
	  			this.result_runner_student_number = result_runner_student_number
		 	}
		});
	},
												/**
	 * 获取major
	 */
	get_runner_major(){
		let url = "~/api/runner/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "major": this.query.word }, (json) => {
		  if (json.result) {
			var result_runner_major = json.result.list;
			result_runner_major.map(o => o.title = o['major'])
	  			this.result_runner_major = result_runner_major
		 	}
		});
	},
						/**
	 * 获取department
	 */
	get_runner_department(){
		let url = "~/api/runner/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "department": this.query.word }, (json) => {
		  if (json.result) {
			var result_runner_department = json.result.list;
			result_runner_department.map(o => o.title = o['department'])
	  			this.result_runner_department = result_runner_department
		 	}
		});
	},
													/**
	 * 获取task_name
	 */
	get_collecting_tasks_on_behalf_task_name(){
		let url = "~/api/collecting_tasks_on_behalf/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "task_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_collecting_tasks_on_behalf_task_name = json.result.list;
			result_collecting_tasks_on_behalf_task_name.map(o => o.title = o['task_name'])
	  			this.result_collecting_tasks_on_behalf_task_name = result_collecting_tasks_on_behalf_task_name
		 	}
		});
	},
															/**
	 * 获取item_type
	 */
	get_collecting_tasks_on_behalf_item_type(){
		let url = "~/api/collecting_tasks_on_behalf/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "item_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_collecting_tasks_on_behalf_item_type = json.result.list;
			result_collecting_tasks_on_behalf_item_type.map(o => o.title = o['item_type'])
	  			this.result_collecting_tasks_on_behalf_item_type = result_collecting_tasks_on_behalf_item_type
		 	}
		});
	},
																			/**
	 * 获取task_number
	 */
	get_picking_order_task_number(){
		let url = "~/api/picking_order/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "task_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_picking_order_task_number = json.result.list;
			result_picking_order_task_number.map(o => o.title = o['task_number'])
	  			this.result_picking_order_task_number = result_picking_order_task_number
		 	}
		});
	},
						/**
	 * 获取task_name
	 */
	get_picking_order_task_name(){
		let url = "~/api/picking_order/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "task_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_picking_order_task_name = json.result.list;
			result_picking_order_task_name.map(o => o.title = o['task_name'])
	  			this.result_picking_order_task_name = result_picking_order_task_name
		 	}
		});
	},
																																				/**
	 * 获取order_status
	 */
	get_picking_order_order_status(){
		let url = "~/api/picking_order/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "order_status": this.query.word }, (json) => {
		  if (json.result) {
			var result_picking_order_order_status = json.result.list;
			result_picking_order_order_status.map(o => o.title = o['order_status'])
	  			this.result_picking_order_order_status = result_picking_order_order_status
		 	}
		});
	},
			
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
	this.get_forum();
					this.get_employer_user_student_number();
													this.get_employer_user_major();
							this.get_employer_user_department();
											this.get_runner_student_number();
													this.get_runner_major();
							this.get_runner_department();
														this.get_collecting_tasks_on_behalf_task_name();
																this.get_collecting_tasks_on_behalf_item_type();
																				this.get_picking_order_task_number();
							this.get_picking_order_task_name();
																																					this.get_picking_order_order_status();
			  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
	  this.get_forum();
				  this.get_employer_user_student_number();
												  this.get_employer_user_major();
						  this.get_employer_user_department();
										  this.get_runner_student_number();
												  this.get_runner_major();
						  this.get_runner_department();
													  this.get_collecting_tasks_on_behalf_task_name();
															  this.get_collecting_tasks_on_behalf_item_type();
																			  this.get_picking_order_task_number();
						  this.get_picking_order_task_name();
																																				  this.get_picking_order_order_status();
				},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
