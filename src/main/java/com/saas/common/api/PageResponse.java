package com.saas.common.api;

import java.util.Collections;
import java.util.List;

/**
 * Common page payload returned inside {@link ApiResponse}.
 *
 * @param <T> list item type
 */
public class PageResponse<T> {

    private List<T> list;
    private long pageNum;
    private long pageSize;
    private long total;
    private long totalPages;

    public PageResponse() {
    }

    public PageResponse(List<T> list, long pageNum, long pageSize, long total, long totalPages) {
        this.list = list;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.total = total;
        this.totalPages = totalPages;
    }

    public static <T> PageResponse<T> of(List<T> list, long pageNum, long pageSize, long total) {
        long resolvedPageSize = pageSize <= 0 ? 1 : pageSize;
        long resolvedTotalPages = (long) Math.ceil(total / (double) resolvedPageSize);
        return new PageResponse<>(list, pageNum, pageSize, total, resolvedTotalPages);
    }

    public static <T> PageResponse<T> empty(long pageNum, long pageSize) {
        return new PageResponse<>(Collections.emptyList(), pageNum, pageSize, 0, 0);
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public long getPageNum() {
        return pageNum;
    }

    public void setPageNum(long pageNum) {
        this.pageNum = pageNum;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(long totalPages) {
        this.totalPages = totalPages;
    }
}
