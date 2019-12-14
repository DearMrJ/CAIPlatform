$(function () {
  var father = document.getElementById('father');
  var name2 = document.getElementById('name2');
  var year1 = document.getElementById('year1');
  var team1 = document.getElementById('team1');
  var btn1 = document.getElementById('btn1');
  var message = document.querySelectorAll('.message');

  var edit = father.getElementsByClassName('edit');
  for (i = 0; i < edit.length; i++) {
    edit[i].onclick = function () {
      var a = this;
      btn1.onclick = function () {
        btn1.setAttribute('data-dismiss', '');
        if (name2.value.length == 0) {
          message[0].className = 'message wrong';
          message[0].innerHTML = '课程名称不能为空'
        } else
          if (year1.value.length == 0) {
            message[0].className = 'message wrong';
            message[0].innerHTML = '学年不能为空'
          } else
            if (team1.value.length == 0) {
              message[0].className = 'message wrong';
              message[0].innerHTML = '学期不能为空'
            } else {
              a.parentNode.parentNode.children[0].children[0].children[0].innerText = name2.value;
              name2.value = '';
              a.parentNode.parentNode.children[0].children[0].children[1].innerText = year1.value + team1.value;
              year1.value = ''; team1.value = '';
              message.className = 'message';
              message.innerHTML = '请输入课程信息'
              btn1.setAttribute('data-dismiss', 'modal');
            }

      }
    }
  }

  // 删除已存在的节点
  var del = father.getElementsByClassName('delete');
  for (var i = 0; i < del.length; i++) {
    del[i].onclick = function () {
      father.removeChild(this.parentNode.parentNode);
    }
  }

  //置顶存在的节点
  var up = father.getElementsByClassName('setTop');

  for (var i = 0; i < up.length; i++) {
    up[i].onclick = function () {
      father.insertBefore(this.parentNode.parentNode, father.children[0]);
    }
  }




})