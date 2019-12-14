$(function () {

  var father = document.getElementById('father');
  //置顶存在的节点
  var up = father.getElementsByClassName('setTop');
  console.log(up.length);
  for (var i = 0; i < up.length; i++) {

    up[i].onclick = function () {
      console.log(this);
      father.insertBefore(this.parentNode.parentNode, father.children[0]);
    }
  }
})