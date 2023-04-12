<template>
	<div class="diy_edit page_i_want_to_customize" id="i_want_to_customize_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row form'>
					<div class="col-12 col-md-12 form_img" style="margin-top: 50px">
						<div class="diy_title">
							<span>封面图:
							</span>
						</div>
						<!-- 图片 -->
						<input type="file" style="display: none;" id="img" title="avatar" @change="change_file($event.target.files,'img')"/>
						<!-- 修改权限 -->
						<div class="diy_field diy_img" v-if="form.img">
							<label for="img">
								<img style="width: 100px;height: 100px" :src="$fullUrl(form.img)" />
							</label>
						</div>
						<!-- 添加权限 -->
						<div class="diy_field diy_img" v-else>
							<label for="img">
								<div class="btn_add_img">
									<span>+</span>
								</div>
							</label>
						</div>
					</div>
					<div class="col-12 col-md-12 form_item" style="margin-top: 20px">
						<div class="diy_title">
							<span>标题:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text diy_input">
							<input type="text" id="title" v-model="form.title" placeholder="请输入标题" />
						</div>
					</div>
					<div class="col-12 col-md-12 form_item">
						<div class="diy_title">
							<span>分类:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text diy_input">
							<select id="type" v-model="form.type">
								<option v-for="o in list_forum_type" :value="o.name">
									{{o.name}}
								</option>
							</select>
						</div>
					</div>
					<div class="col-12 col-md-12 form_item">
						<div class="diy_title">
							<span>标签:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text diy_input">
							<input type="text" id="tag" v-model="form.tag" placeholder="请输入标签，多个标签输入|分隔" />
						</div>
					</div>
					<div class="col-12 col-md-12 form_editor">
						<div class="diy_title">
							<span>正文:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text" style="margin-left: 40px">
							<quill-editor v-model="form.content" class="form_editor_block">
							</quill-editor>
						</div>
					</div>
					<div class="col-12 col-md-12" style="height: 100px">
						<button class="submit_button" @click="submit()">发表内容</button>
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
		data() {
			return {
				field: "forum_id",
				url_add: "~/api/forum/add?",
				url_set: "~/api/forum/set?",
				url_get_obj: "~/api/forum/get_obj?",
				url_upload: "~/api/forum/upload?",

				query: {
					forum_id: 0
				},

				list_forum_type: [],

				form: {
					forum_id: 0,
					user_id: this.$store.state.user.user_id,
					display: 0,
					nickname: this.$store.state.user.nickname,
					hits: 0,
					title: "",
					keywords: "",
					description: "",
					url: "",
					tag: "",
					img: "",
					content: "",
					avatar: this.$store.state.user.avatar,
          type:""
				},

			}
		},
		methods: {

			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/forum/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
						console.log(this.form.img)
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			submit_check(params) {
				var msg = "";
				if (params.title === "") {
					msg = "标题不能为空";
					return msg;
				}
			},

			async get_forum_type() {
				var json = await this.$get("~/api/forum_type/get_list?");
				if(json.result){
					this.list_forum_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
		},
		created(){
			this.get_forum_type();
		}
	}
</script>

<style scoped>
	.btn_add_img{
		color: #D3D3D3;
		text-align: center;
		border: 1px solid #999;
		height: 100px;
		width: 100px;
		position: relative;
	}
	.btn_add_img text{
		font-size: 35px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
	}
	.btn_add_img span{
		display: block;
		color: #999;
		margin-top: 27px;
	}
	.form_img{
		display: flex;
		align-items: center;
		width: 90%;
		height: 100px;
	}
	.form_item{
		display: flex;
		align-items: center;
		width: 90%;
		height: 100px;
	}
	.diy_field{
		margin-left: 20px;
	}
	.form{
		width: 75%;
		margin: 0 auto;
	}
	.diy_text input{
		line-height: 40px;
		width: 300px;
	}
	.diy_text select{
		line-height: 40px;
		width: 300px;
		background-color: white;
		text-align: left;
	}
	.diy_text select option{
		line-height: 40px;
		width: 300px;
		background-color: white;
	}
	.diy_title{
		width: 80px;
	}
	.form_editor{
		display: flex;
		align-items: flex-start;
		width: 90%;
		min-height: 150px;
		margin-top: 30px;
	}
	.submit_button{
		margin: 30px auto;
		display: block;
		background-color: dodgerblue;
		color: white !important;
		width: 100px;
		text-align: center;
		line-height: 30px;
		border-radius: 5px;
	}
	.diy_input{
		margin-left: 15px;
	}
</style>
