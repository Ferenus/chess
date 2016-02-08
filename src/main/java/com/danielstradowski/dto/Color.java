package com.danielstradowski.dto;

/**
 * Created by Daniel on 2016-02-08.
 */
public class Color {
    private String sessionId;
    private String color;

    public Color() {
    }

    public Color(String sessionId, String color) {
        this.sessionId = sessionId;
        this.color = color;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
