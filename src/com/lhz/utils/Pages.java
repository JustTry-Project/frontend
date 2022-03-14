package com.lhz.utils;

import java.util.List;

public class Pages<E> {
    private Long count; //总条数
    private Integer pageIndex;	//当前页码
    private Integer pageSize;	//每页大小
    private Integer indexRow;	//查询开始行数
    private Integer pageCount;	//总页码
    private List<E> List;

    public Pages(){}

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }


    public Integer getPageCount() {
        this.pageCount = (int)(count%pageSize==0?count/pageSize:count/pageSize+1);
        return pageCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getIndexRow() {
        this.indexRow = (pageIndex-1)*pageSize;
        return indexRow;
    }

    public List<E> getList() {
        return List;
    }

    public void setList(List<E> list) {
        List = list;
    }

    @Override
    public String toString() {
        return "Pages{" +
                "count=" + count +
                ", pageIndex=" + pageIndex +
                ", pageSize=" + pageSize +
                ", indexRow=" + indexRow +
                ", pageCount=" + pageCount +
                ", List=" + List +
                '}';
    }
}
