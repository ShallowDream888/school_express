
window.onload = function(){
    var _iframe = document.getElementById('demoAdmin').contentWindow;
    function log_mod() {
        setInterval(() => {
            var timeOne = new Date();
            let year = timeOne.getFullYear();
            let month = timeOne.getMonth() + 1;
            let day = timeOne.getDate();
            let hour = timeOne.getHours();
            let minute = timeOne.getMinutes();
            let second = timeOne.getSeconds();
            month = month > 9 ? month : '0' + month
            hour = hour > 9 ? hour : '0' + hour
            minute = minute > 9 ? minute : '0' + minute
            second = second > 9 ? second : '0' + second
            return logs = ` ${year}-${month}-${day} ${hour}:${minute}:${second}`;

        }, 1000);
        watch: {
            let ul_l = document.querySelector(".list_ul")

            let data_hory = sessionStorage.getItem("log_msg")

            let get_log_arr = data_hory ? JSON.parse(data_hory) : []
            console.log(get_log_arr);
            for (let j = 0; j < get_log_arr.length; j++) {

                let li = document.createElement("li");
                li.className = 'texts'
                li.textContent = get_log_arr[j];
                document.querySelector('ul_l')
                ul_l.appendChild(li);


            }
            //获取所有模块标签元素
            function getAllElements(selector,selectorto) {
                if (selector){
                    return document.querySelectorAll(selector);
                }else {
                    return document.querySelectorAll(selectorto);
                }

            }

            //拿到a标签
            let a_l = getAllElements("a[target='main_self_frame']","a[href$=html]" )
            // console.log(a_l[12].href);



            //遍历a标签


            for (let i = 0; i < a_l.length; i++) {
                var log_arr = [];
                var arrs = [];
                a_l[i].addEventListener("click", function () {

                    log_arr.push(user_group + "--" + a_l[i].innerText + logs)

                    arrs.push(user_group + "--" + a_l[i].innerText + logs)
                    // console.log(arrs);
                    sessionStorage.setItem('log_msg', JSON.stringify(arrs))

                    if (log_arr.length > 1) {

                        log_arr.shift()

                    }

                    // console.log(log_arr);
                    for (let i = 0; i < log_arr.length; i++) {

                        let li = document.createElement("li");
                        li.className = 'texts'
                        li.textContent = log_arr[i];
                        ul_l.appendChild(li);


                    }

                })

            }



        }

    }
    log_mod()

}

document.querySelector(".log_bntx").onclick = function () {

    if (this.innerText === '隐藏') {

        document.querySelector(".contersa").style.display = 'none'
        this.innerText = '显示'

    } else if (this.innerText === '显示') {
        document.querySelector(".contersa").style.display = 'block'
        this.innerText = '隐藏'
    }
}






