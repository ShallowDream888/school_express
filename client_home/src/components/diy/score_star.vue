<template>
  <div class="score_star">
    <span v-for="i in 5" :key="i" class="icon_wrap">
      <b-icon v-if="score >= i" icon="star-fill"></b-icon>
      <b-icon
          v-else-if="Math.ceil(score) ===i "
          icon="star-half"
      ></b-icon>
      <b-icon v-else icon="star"></b-icon>
    </span>
  </div>
</template>

<script>
export default {
  props: {
    score: {
      type: Number,
      default() {
        return 0;
      },
    },
  },
  data() {
    return {};
  },
  methods: {},
  components: {},
};
</script>

<style scoped>
.score_star {
  display: flex;
  align-items: center;
  color: var(--color_primary);
}

.icon_wrap {
  padding-right: 3px;
}
</style>
