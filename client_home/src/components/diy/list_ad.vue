<template>
  <div v-if="list.length" class="list_ad col-12">
    <div v-for="(o, i) in list" v-if="o[vm.location] == location" :key="i" class="ad col-lg-4 col-md-4 col-sm-6">
      <router-link :to="o.url">
        <div v-if="o[vm.content]" v-html="o[vm.content]"/>
        <div v-else class="pic">
          <img :src="$fullUrl(o[vm.img])" alt=""/>
        </div>
      </router-link>
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
    location: {
      type: String,
      default: "",
    },
    vm: {
      type: Object,
      default: function () {
        return {
          location: "location",
          content: "content",
          img: "img",
        };
      },
    },
  },
};
</script>

<style scoped>

.list_ad {
  display: flex;
  flex-wrap: wrap;
  margin: 1rem 0;
}

.pic {
  margin: 0.5rem;
  cursor: pointer;
}

.pic img {
  width: 100%;
  height: 100%;
}
</style>
