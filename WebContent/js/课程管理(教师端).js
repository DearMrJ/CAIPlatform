$(function () {
  var father = document.getElementById('father');
  var btn = document.getElementById('btn');
  var name1 = document.getElementById('name1');
  var year = document.getElementById('year');
  var team = document.getElementById('team');
  var message = document.querySelectorAll('.message');
  var name2 = document.getElementById('name2');
  var year1 = document.getElementById('year1');
  var team1 = document.getElementById('team1');
  var btn1 = document.getElementById('btn1');



  btn.onclick = function () {
    btn.setAttribute('data-dismiss', '');
    console.log(message);
    if (name1.value.length == 0) {
      message[1].className = 'message wrong';
      message[1].innerHTML = '课程名称不能为空'
    } else
      if (year.value.length == 0) {
        message[1].className = 'message wrong';
        message[1].innerHTML = '学年不能为空'
      } else
        if (team.value.length == 0) {
          message[1].className = 'message wrong';
          message[1].innerHTML = '学期不能为空'
        }
        else {
          console.log(father.length);
          // 复制节点
          var son = father.children[0].cloneNode(true);
          son.style.display = 'block';
          son.children[0].children[0].children[0].innerText = name1.value;
          name1.value = '';
          son.children[0].children[0].children[1].innerText = year.value + team.value;
          year.value = ''; team.value = '';
          message.className = 'message';
          message.innerHTML = '请输入课程信息'
          father.insertBefore(son, father.children[1]);


          //删除节点
          var del = father.getElementsByClassName('delete');
          for (var i = 0; i < del.length; i++) {
            del[i].onclick = function () {
              father.removeChild(this.parentNode.parentNode);
            }
          }


          //置顶节点
          var up = father.getElementsByClassName('setTop');

          for (var i = 1; i < up.length; i++) {
            up[i].onclick = function () {
              father.insertBefore(this.parentNode.parentNode, father.children[1]);
            }
          }
          btn.setAttribute('data-dismiss', 'modal');

          //编辑节点

          var edit = father.getElementsByClassName('edit');
          for (i = 1; i < edit.length; i++) {
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

        }
  }

  // 已存在课程编辑的js

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
      father.insertBefore(this.parentNode.parentNode, father.children[1]);
    }
  }



  //  拖动模态框
  var header = document.querySelector('#modal-header');
  var modal = document.querySelector('#modal-content')
  console.log(header);
  console.log(modal);
  header.addEventListener('mousedown', function (e) {
    var x = e.pageX - modal.offsetLeft;
    var y = e.pageY - modal.offsetTop;

    document.addEventListener('mousemove', move)
    function move (e) {
      modal.style.left = e.pageX - x + 'px';
      modal.style.top = e.pageY - y + 'px';

    }
    document.addEventListener('mouseup', function () {
      document.removeEventListener('mousemove', move);
    });
  })

})


