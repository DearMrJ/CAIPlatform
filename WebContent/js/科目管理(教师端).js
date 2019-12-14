$(function () {
  var item = document.querySelectorAll('.item')
  var tab_list = document.querySelector('.list');
  var lis = tab_list.querySelectorAll('li');
  for (var i = 0; i < lis.length; i++) {
    lis[i].setAttribute('index', i);
    lis[i].onclick = function () {
      for (var i = 0; i < lis.length; i++) {
        lis[i].className = '';
      }
      this.className = 'current';
      var index = this.getAttribute('index');
      for (var i = 0; i < item.length; i++) {
        item[i].style.display = 'none'
      }
      item[index].style.display = 'block';
    }
  }
  var btn = document.getElementById('send');
  var text = document.getElementById('content');
  var ul = document.getElementById('talk');
  btn.onclick = function () {
    if (text.value == '') {
      alert('您没有输入内容');
      return false
    } else {
      var li = document.createElement('li');
      li.innerHTML = text.value + "<a href='javascript:;' class='del'>删除</a>";
      ul.insertBefore(li, ul.children[0])
      // ul.firstChild.appendChild(li);
      var as = ul.getElementsByTagName('a');
      var as = ul.getElementsByClassName('del');
      for (var i = 0; i < as.length; i++) {
        as[i].onclick = function () {
          ul.removeChild(this.parentNode)
        }
      }
    }
    console.log[as.length];
  }

})