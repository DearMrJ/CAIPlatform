/**
 * 模块JavaScript
 */
var examIndexPage = {
    init: function (exams) {
        //考试倒计时
        var killTime = new Date();
        for (var i = 0; i < exams.length; i++) {
            if (exams[i].status == 0) {
                killTime = new Date(exams[i].startTime);
            } else {
                break;
            }
        }
        $("#exam-time-countdown").countdown(killTime, function (event) {
            // 事件格式
            var format = event.strftime("距离最近一次考试倒计时还有: %D天 %H时 %M分 %S秒");
            $("#exam-time-countdown").html(format);
        }).on('finish.countdown', function () {
            // 事件完成后回调事件，获取秒杀地址，控制业务逻辑
            window.location.reload();
        });
    },
};