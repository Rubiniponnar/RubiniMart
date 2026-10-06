<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- RubiniMart AI Chatbot Floating Widget (Section 11 / Phase 3) -->
<div id="rubini-chat-widget" class="chat-widget-container">
    <!-- Floating Launcher Button -->
    <button id="chat-launcher-btn" class="chat-launcher-btn" title="Chat with RubiniMart AI Assistant" aria-label="Open Chat Assistant">
        <span class="chat-launcher-icon">💬</span>
        <span class="chat-launcher-badge">AI</span>
    </button>

    <!-- Chat Modal Window -->
    <div id="chat-modal" class="chat-modal" style="display: none;">
        <!-- Header -->
        <div class="chat-modal-header">
            <div class="chat-modal-title">
                <span class="chat-bot-avatar">🤖</span>
                <div>
                    <strong>RubiniMart AI Assistant</strong>
                    <div class="chat-online-status">
                        <span class="status-dot"></span> Online · Instant Support
                    </div>
                </div>
            </div>
            <div class="chat-modal-actions">
                <button id="chat-clear-btn" class="chat-icon-btn" title="Clear chat history" aria-label="Clear chat">🗑️</button>
                <button id="chat-close-btn" class="chat-icon-btn" title="Close chat" aria-label="Close chat">✕</button>
            </div>
        </div>

        <!-- Quick Suggestion Chips -->
        <div class="chat-chips-container" id="chat-chips">
            <button class="chat-chip" data-query="What categories do you sell?">🛍️ Categories</button>
            <button class="chat-chip" data-query="How do I track my order?">📦 Track Order</button>
            <button class="chat-chip" data-query="What is your return policy?">🔄 Return Policy</button>
            <button class="chat-chip" data-query="What payment methods are supported?">💳 Payments</button>
            <button class="chat-chip" data-query="How can I register as a seller?">🏪 Sell with us</button>
        </div>

        <!-- Messages Body -->
        <div class="chat-messages" id="chat-messages">
            <div class="chat-message chat-message-bot">
                <div class="chat-bubble">
                    👋 Namaste! I am your <strong>RubiniMart AI Shopping Assistant</strong>. Ask me anything about our 28+ products, prices in Rupees (₹), delivery timelines, order tracking, or returns!
                </div>
                <span class="chat-timestamp">Just now</span>
            </div>
        </div>

        <!-- Typing Indicator -->
        <div id="chat-typing-indicator" class="chat-typing-indicator" style="display: none;">
            <span></span><span></span><span></span>
            <small style="margin-left: 8px; color: var(--text-muted);">RubiniMart AI is typing...</small>
        </div>

        <!-- Input Footer -->
        <form id="chat-form" class="chat-input-form" onsubmit="return false;">
            <input type="text" id="chat-input" class="chat-input" placeholder="Type your question here (max 300 chars)..." maxlength="300" autocomplete="off" required>
            <button type="submit" id="chat-send-btn" class="chat-send-btn" title="Send message" aria-label="Send message">
                ➤
            </button>
        </form>
    </div>
</div>
