<template>
	<div class="page_account" id="account_login">
		<div class="warp">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="card">
							<!-- 登录 -->
							<div class="form_login">
								<b-form>
									<b-form-group id="input-group-1" label="用户名:" label-for="input-1"
										:state="validation_username" invalid-feedback="账户名长度为在5-16个字符"
										valid-feedback="校验通过">
										<b-form-input id="input-1" v-model="form.username" type="text" placeholder="用户名"
											trim></b-form-input>
									</b-form-group>

									<b-form-group id="input-group-2" label="密码:" label-for="input-2"
										:state="validation_password" invalid-feedback="密码长度为在5-16个字符"
										valid-feedback="校验通过">
										<b-form-input id="input-2" v-model="form.password" type="password"
											placeholder="密码" trim autocomplete="off"></b-form-input>
									</b-form-group>

										<!-- 极验开始 -->
										<div class="geetest_box">
											<div class="geetest_box_title">验证</div>
											<div class="geetest_box_content">
												<SlidePicture @slidePictureState="slidePictureState"></SlidePicture>
											</div>
										</div>
										<!-- 极验结束 -->
									<div class="btns_bottom">
										<div class="btn_item" @click="submit()">登录</div>
										<div class="forgot_nav" @click="$router.push('/account/forgot')">
											忘记密码
										</div>
									</div>
								</b-form>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="card">
							<!-- 创建一个账户 -->
							<div class="more_nav">
								<div style="text-align: center; margin-bottom: 20px">
									没有账户?
								</div>
								<div class="btn_item" @click="$router.push('/account/register')">
									创建一个账户
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
		import SlidePicture from "@/components/common/slidePicture";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 极验状态开始
				isGeeFinish: false,
				// 极验状态结束
				form: {
					username: "",
					password: "",
				},
			};
		},
		methods: {

					// 极验滑块事件开始
			slidePictureState(state) {
						if (state === true) {
							// 成功
							this.$message.success("哇塞~检验成功，速度战胜99%的用户，请进行登录");
							this.isGeeFinish = true;
						} else {
							this.isGeeFinish = false;
						}
					},
			// 极验滑块事件开始

			/**
			 * 提交
			 */
			submit() {
				var _this = this;
				// var condition = this.validation_username && this.validation_password;
				// if (!condition) {
				// 	return this.$message.warning("输入不合法");
				// }
				// 极验开始

				if(!this.validation_username){
					return this.$message.warning("请输入正确账号")
				}else if(!this.validation_password){
					return this.$message.warning("请输入正确密码")
				}
				else if(!this.isGeeFinish){
					return this.$message.warning("请进行拖拽检验")
				}

				// 极验结束
				var form = Object.assign({}, this.form);
				this.$post("~/api/user/login?", form, (res) => {
					if (res.result && res.result.obj) {
						var obj = res.result.obj;

						$.db.set("token", obj.token);
						_this.$store.commit("user_set", obj);

						this.$get_auth(obj.user_group, () => {
							this.$router.push("/");
							location.reload();
						});
						this.$message.success("登录成功！");
					} else if (res.error) {
						console.log(res.error);
					this.$message.error(res.error.message);
					}
				});
			},
		},
		computed: {
			/**
			 * 验证用户名
			 */
			validation_username() {
				var length = this.form.username.length;
				if (!length) {
					return null;
				}
				return length > 4 && length < 17;
			},
			/**
			 * 验证密码
			 */
			validation_password() {
				var length = this.form.password.length;
				if (!length) {
					return null;
				}
				return length > 4 && length < 17;
			},
		},

		components:{
			SlidePicture,
		}

	};
</script>

<style scoped>
	.page_account {
		min-height: 800px;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}

	.flex_cc {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.form_login {
		padding: 1rem;
	}

	.more_nav {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		padding: 1rem;
		margin: auto 0;
	}

	.more_nav .btns_bottom {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.btn_item {
		cursor: pointer;
		width: 100%;
		background-color: var(--color_primary);
		color: #fff;
		text-align: center;
		height: 48px;
		line-height: 48px;
	}

	.forgot_nav {
		text-align: left;
		font-size: 10px;
		margin-top: 5px;
		cursor: pointer;
	}

	/*************************************** */
	.sign_in .form .el-input{
		width: 100%;
	}

	/***************极验************************ */
	.geetest_box{
		display: flex;
		margin-bottom: 30px;
		width: 420px;
	}
	.geetest_box_title{
    width: 48px;
    font-size: 14px;
    text-align: right;
    margin-right: 14px;
	}
	.geetest_box_title::before{
        content: '*';
    color: #F56C6C;
    margin-right: 4px;
	}
	.geetest_box_content{
	}

</style>
