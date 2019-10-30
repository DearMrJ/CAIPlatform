package org.exam.vo.base;

import java.util.List;

import com.github.pagehelper.PageInfo;


public class PageResultVo {
    private List rows;
    private Long total;
    private PageInfo pageInfo;

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
    

    public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageResultVo(List rows ,Long total, PageInfo pageInfo) {
        this.total = total;
        this.rows = rows;
        this.pageInfo = pageInfo;
    }

	@Override
	public String toString() {
		return "PageResultVo [rows=" + rows + ", total=" + total + ", pageInfo=" + pageInfo + "]";
	}
	
}
