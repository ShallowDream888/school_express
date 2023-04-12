let banner = document.querySelector('.banner')
let blankBox = document.querySelector('.blank-box')
let block = document.querySelector('.block')
let k
let moveBlock = document.querySelector('.move-block')
let isDrop = false //是否可滑动
let x, y, targetleft //偏移量,左边定位距离
moveBlock.onmousedown = function (e) {
  var e = e || window.event
  x = e.clientX - block.offsetLeft
  y = e.clientY - block.offsetTop
  isDrop = true
}

moveBlock.onmousemove = function (e) {
  if (isDrop) {
    var e = e || window.event
    let left = e.clientX - x
    let maxX = banner.offsetWidth - block.offsetWidth
    //范围限定
    if (left < 0) {
      left = 0
    }
    if (left > maxX) {
      left = maxX
    }
    block.style.left = left + 'px'
    moveBlock.style.left = left + 'px'
    //200大图里面缺失区域距离左边的位置
    if (Math.abs(left - targetleft) <= 5) {
      layer.msg('验证成功')
      isDrop = false
      k = true
    }
  }
}
document.onmouseup = function () {
  isDrop = false
}

//随机定位
function randomPosition() {
  /*随机数公式取 n-m之间的随机数  Math.random() * (m-n)+n*/
  let ranX = Math.round(Math.random() * (banner.offsetWidth - 100) + 0)
  let ranY = Math.round(Math.random() * (banner.offsetHeight - 0) + 0)

  targetleft = ranX
  blankBox.style.left = ranX + 'px'
  blankBox.style.top = ranY + 'px'

  block.style.top = ranY + 'px'
  block.style.backgroundPosition = -ranX + 'px ' + -ranY + 'px'
}
randomPosition()
