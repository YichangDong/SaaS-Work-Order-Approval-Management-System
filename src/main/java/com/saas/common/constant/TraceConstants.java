package com.saas.common.constant;

/**
 * Constants used by trace propagation.
 */
public final class TraceConstants {

    public static final String TRACE_ID_HEADER = "X-Trace-Id";
    public static final String TRACE_ID_MDC_KEY = "traceId";

    private TraceConstants() {
    }
}
