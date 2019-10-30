package org.exam.enmus;


public enum ResponseStatus {

    SUCCESS(200, "操作成功！"),
    FORBIDDEN(403, "您没有权限访问！"),
    ERROR(500, "服务器内部错误！"),
   	FILE_IS_NOT_EXCEL(1004,"文件不是Excel"),
   	DATA_IS_NULL(1005,"数据为空，请填写数据"),
    NOT_FOUND(404, "资源不存在！");
   

    private Integer code;
    private String message;

    ResponseStatus(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
