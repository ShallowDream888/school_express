var valicode;
  function changeCode() {
  var cvs = document.getElementById("cvs");
  valicode = drawcode(cvs);
}
  function valiCode() {
  var code = document.getElementById("inCode")
  if (code.value.toString() === valicode.toString()) {
    return true;
  } else {
    changeCode();
    return false;
  }
}
window.onload = changeCode;
  
  //定义变量
  var w = 80;
  var h = 24;
  var fontsize = h - 6;
  var str = "+-";

  //随机生成最大值不超过max的整数
  function randInt(max) {
    return Math.floor(Math.random() * 100000 % max);
  }

  //生成随机长度的字符串验证码
  function randCode(len) {
    var one = randInt(10);
    var two = randInt(10);
    var op = str.charAt(randInt(str.length));
    return "" + one + op + two + "=";
  }

  //生成随机颜色
  function randColor() {
    var r = randInt(256);
    var g = randInt(256);
    var b = randInt(256);
    return "rgb(" + r + "," + g + "," + b + ")";
  }

  //绘制图片
  function drawcode(canvas) {
    var valicode = randCode();
    w = 5 + fontsize * valicode.length;

    if (canvas != null && canvas.getContext && canvas.getContext("2d")) {
      //设置显示区域
      canvas.style.width = w;
      //设置画板
      canvas.setAttribute("width", w);
      canvas.setAttribute("height", h);
      //设置画笔
      var pen = canvas.getContext("2d");
      //绘制背景
      pen.fillStyle = "rgb(255, 255, 255)";
      pen.fillRect(0, 0, w, h);
      //设置水平线位置
      pen.textBaseline = "top";
      //绘制内容
      for (var i = 0; i < valicode.length; i++) {
        pen.fillStyle = randColor();
        pen.font = "bold " + (fontsize + randInt(3)) + "px 微软雅黑";
        pen.fillText(valicode.charAt(i), 5 + fontsize * i, randInt(5));
      }
      //绘制噪音线
      for (var i = 0; i < 2; i++) {
        pen.moveTo(randInt(w) / 2, randInt(h));//设置起点
        pen.lineTo(randInt(w), randInt(h));//设置终点
        pen.strokeStyle = randColor();
        pen.lineWidth = 2;//线条粗细
        pen.stroke();
      }
      //substr() 方法可在字符串中抽取从 start 下标开始的指定数目的字符。
      valicode = valicode.substr(0, valicode.length - 1);
      //eval()方法，把字符串当表达式处理
      return eval(valicode);
    }
  }