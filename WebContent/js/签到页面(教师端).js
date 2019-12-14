$(function () {

  var datas = [
    {
      student_id: 1,
      name: '肖锦锋',
      date: '',
      statute: 0
    },
    {
      student_id: 2,
      name: '将麒麟',
      date: '',
      statute: 1
    },

    {
      student_id: 3,
      name: '讲起吧',
      date: '',
      statute: 2
    },
    {
      student_id: 4,
      name: '4',
      date: '',
      statute: 2
    },
    {
      student_id: 5,
      name: '5',
      date: '',
      statute: 2
    },
    {
      student_id: 6,
      name: '6',
      date: '',
      statute: 2
    },
    {
      student_id: 7,
      name: '7',
      date: '',
      statute: 2
    },
    {
      student_id: 8,
      name: '8',
      date: '',
      statute: 2
    },
    {
      student_id: 9,
      name: '9',
      date: '',
      statute: 2
    },
    {
      student_id: 'q',
      name: 'q',
      date: '',
      statute: 2
    },
  ];
  $(function () {

    $(".down").click(function () {
      console.log();
    })

    i = 0;
    $("#start").click(function () {
      if ($("input:checked").val() == 'option1') {
        var i = 0;
        if (i < datas.length) {
          $("#name").text(datas[i].name);
          $('.down').css("display", "");
          $('.up').css("display", "");
          $(".qiandao span").eq(1).text($(datas).length);
          $(".qiandao span").eq(2).text(i);
          $(".qiandao span").eq(3).text($(datas).length - i);
        }



        $('.down').click(function () {
          if (i < datas.length) {
            datas[i].statute = $(this).attr("data-value");


            console.log(datas[i].statute);
            i = i + 1;
            $(".qiandao span").eq(2).text(i);
            $(".qiandao span").eq(3).text($(datas).length - i);
            if (i < datas.length) {
              $("#name").text(datas[i].name);
            }
            else $("#name").text('无');
          }


        });

        $(".up").click(function () {
          if (i > 0) {
            i = i - 1;
            $("#name").text(datas[i].name);
            $(".qiandao span").eq(2).text(i);
            $(".qiandao span").eq(3).text($(datas).length - i);
          }
        })


        // 随机考勤
      } else if ($("input:checked").val() == 'option2') {
        i = 0;
        var ch = 0;
        var arr = new Array();
        var number = 0;
        arr[0] = Math.floor(Math.random() * $(datas).length);
        while (i < ($(datas).length * 0.5) - 1) {
          number = Math.floor(Math.random() * $(datas).length);
          console.log(number);
          for (j = 0; j < arr.length; j++) {
            if (arr[j] == number) {
              ch = 1;
              break;
            }
          }
          if (ch == 0) {
            arr[i + 1] = number;
            i = i + 1;
          }

          ch = 0;

        }
        i = 0;
        if (i < arr.length) {
          $("#name").text(datas[arr[i]].name);
          $('.down').css("display", "");
          $('.up').css("display", "");
          $(".qiandao span").eq(1).text(arr.length);
          $(".qiandao span").eq(2).text(i);
          $(".qiandao span").eq(3).text(arr.length - i);
        }
        $('.down').click(function () {
          if (i < arr.length) {
            datas[arr[i]].statute = $(this).attr("data-value");
            console.log(datas[arr[i]].statute);
            i = i + 1;
            $(".qiandao span").eq(2).text(i);
            $(".qiandao span").eq(3).text(arr.length - i);
            if (i < arr.length) {
              $("#name").text(datas[arr[i]].name);
            }
            else $("#name").text('无');
          }


        });

        $(".up").click(function () {
          if (i > 0) {
            i = i - 1;
            $("#name").text(datas[arr[i]].name);
            $(".qiandao span").eq(2).text(i);
            $(".qiandao span").eq(3).text(arr.length - i);
          }
        })


      }


    })

    $("#end").click(function () {
      $('.down').css("display", "none");
      $('.up').css("display", "none");
      $("#name").text('无');
      $(".qiandao span").eq(1).text('');
      $(".qiandao span").eq(2).text('');
      $(".qiandao span").eq(3).text('');
    })




  })
})