package com.danielstradowski.dto;

/**
 * Created by Daniel on 2016-02-08.
 */
public class Color {
    private String sessionId;
    private String color;
    private boolean wait;

    public Color() {
    }

    public Color(String sessionId, String color) {
        this.sessionId = sessionId;
        this.color = color;
        this.wait = wait;
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

    public boolean getWait() {
        return wait;
    }

    public void setWait(boolean wait) {
        this.wait = wait;
    }
}
