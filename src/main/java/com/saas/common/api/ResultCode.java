package com.saas.common.api;

/**
 * Shared result codes used by the backend skeleton.
 */
public enum ResultCode {

    SUCCESS(200, "success"),
    BAD_REQUEST(400, "Request parameter error"),
    UNAUTHORIZED(401, "Unauthorized"),
    FORBIDDEN(403, "Forbidden"),
    NOT_FOUND(404, "Resource not found"),
    CONFLICT(409, "Data conflict"),
    INTERNAL_ERROR(500, "System internal error");

    private final int code;
    private final String message;

    ResultCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
