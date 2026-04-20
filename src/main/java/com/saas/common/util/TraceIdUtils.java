package com.saas.common.util;

import com.saas.common.constant.TraceConstants;
import java.util.UUID;
import org.slf4j.MDC;

/**
 * Utility methods for trace identifier handling.
 */
public final class TraceIdUtils {

    private TraceIdUtils() {
    }

    public static String currentTraceId() {
        return MDC.get(TraceConstants.TRACE_ID_MDC_KEY);
    }

    public static String getOrCreate(String traceId) {
        if (traceId != null && !traceId.isBlank()) {
            return traceId;
        }
        return UUID.randomUUID().toString().replace("-", "");
    }
}
