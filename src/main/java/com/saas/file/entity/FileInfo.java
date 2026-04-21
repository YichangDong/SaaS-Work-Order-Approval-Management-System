package com.saas.file.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("file_info")
public class FileInfo {

    @TableId
    private Long id;
    private Long tenantId;
    private String bizType;
    private String fileName;
    private String fileKey;
    private String fileUrl;
    private String previewUrl;
    private Long fileSize;
    private String contentType;
    private String storageType;
    private String bucketName;
    private Long createdBy;
    private LocalDateTime createdAt;
}
