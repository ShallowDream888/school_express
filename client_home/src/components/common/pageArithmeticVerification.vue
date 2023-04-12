<template>
  <div>
    <input id="inCode" name="inCode" type="text"/><br/>
    <canvas id="cvs" onclick="changeCode()"></canvas>
  </div>
</template>

<script>
import "@/assets/js/ArithmeticVerification.js";

export default {
  name: "arithmeticVerification",
  mounted() {
  },
  methods: {},
};
</script>