<template>
	<div class="list_forum">
		<div class="forum_hot_block">
			<div v-for="(o, i) in list" :key="i" class="forum_hot_border">
				<router-link :to="'/forum/details?forum_id=' + o[vm.forum_id]" class="forum">
					<div class="title_wrap">
						<ul>
							<li>
								<span class="ellipsis_1">
									{{ o[vm.title] }}
								</span>
							</li>
						</ul>
					</div>
				</router-link>
			</div>
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
			vm: {
				type: Object,
				default: function() {
					return {
						img: "img",
						forum_id: "forum_id",
						title: "title",
						description: "description",
						title: "title",
						create_time: "create_time",
						content: "content",
						praise_len: "praise_len",
						hits: "hits",
					};
				},
			},
		},
		methods: {},
	};
</script>

<style scoped>
	.list_forum_hot {
		width: 100%;
	}

	.forum_hot_block {
		display: block;
		margin-top: 18px;
	}

	.title_wrap {
		font-size: 16px;
		font-weight: bold;
	}

	.ellipsis_1 {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
