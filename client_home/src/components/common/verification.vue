<template>
  <div style="display:flex;">
    <el-input type="text" value="" v-model="val" placeholder="不区分大小写"
    style=" color: black; font-size:15px; margin-right: 30px; margin-left: -15px;" />
              <canvas id="canvas" width="100" height="43"  @click="dj" style="border: 1px solid #ccc;
              border-radius: 5px; background-color: aliceblue;"></canvas>
  </div>
</template>
<script>
   export default {
     name:'verification',
     mounted(){
      this.draw(this.show_num);
      this.$emit('sublim')
     },
     data(){
       return{
         val:'',
         num:'',
         show_num:[]
       }
     },
     methods:{
      sublim() {
        this.num = this.show_num.join("");
      if (this.val == '') {
        this.$message.warning("请输入验证码");
        return false
      } else if (this.val.toUpperCase() == this.num.toUpperCase()) {
        this.val = ''
        this.draw(this.show_num);
        return true
      } else {
        this.$message.error("校验失败");
        return false
      }
     },
     dj(){
       console.log(1)
      this.draw(this.show_num);
     },

     draw(show_num) {
      var canvas_width = document.getElementById('canvas').clientWidth;
      var canvas_height = document.getElementById('canvas').clientHeight;
      var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
      var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
      canvas.width = canvas_width;
      canvas.height = canvas_height;
      var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";
      var aCode = sCode.split(",");
      var aLength = aCode.length;//获取到数组的长度

      for (var i = 0; i <= 3; i++) {
        var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
        var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
        var txt = aCode[j];//得到随机的一个内容
        show_num[i] = txt;
        var x = 10 + i * 20;//文字在canvas上的x坐标
        var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
        context.font = "bold 23px 微软雅黑";

        context.translate(x, y);
        context.rotate(deg);

        context.fillStyle = this.randomColor();
        context.fillText(txt, 0, 0);

        context.rotate(-deg);
        context.translate(-x, -y);
      }
      for (var i = 0; i <= 5; i++) { //验证码上显示线条
        context.strokeStyle = this.randomColor();
        context.beginPath();
        context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.stroke();
      }
      for (var i = 0; i <= 30; i++) { //验证码上显示小点
        context.strokeStyle = this.randomColor();
        context.beginPath();
        var x = Math.random() * canvas_width;
        var y = Math.random() * canvas_height;
        context.moveTo(x, y);
        context.lineTo(x + 1, y + 1);
        context.stroke();
      }
    },

    //  得到随机的颜色值
    randomColor() {//得到随机的颜色值
      var r = Math.floor(Math.random() * 256);
      var g = Math.floor(Math.random() * 256);
      var b = Math.floor(Math.random() * 256);
      return "rgb(" + r + "," + g + "," + b + ")";
      }
    }
  }
</script>