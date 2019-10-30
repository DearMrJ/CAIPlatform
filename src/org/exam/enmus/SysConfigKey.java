package org.exam.enmus;

public enum SysConfigKey {
	
    
	SITE_PHONE("SITE_PHONE", "电话"),
	SITE_FAX("SITE_FAX","传真"),
	SITE_EMAIL("SITE_EMAIL","问题反馈"),
	SITE_ADDRESS("SITE_ADDRESS","通讯地址"),
	SITE_NAME("SITE_NAME","系统名称"),
	SITE_URL("SITE_URL","网址"),
	SITE_DESC("SITE_DESC","系统描述"),
    CLOUD_STORAGE_CONFIG("CLOUD_STORAGE_CONFIG","云存储配置"),
    ;

    private String value;
    private String describe;

    private SysConfigKey(String value, String describe) {
        this.value = value;
        this.describe = describe;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDescribe() {
        return this.describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

}