<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="mca.Employeee.messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content-full">
        <div class="chat-container">

            <aside class="chat-sidebar">
                <header class="chat-sidebar-header">
                    <h2>Messages</h2>
                </header>
                <div class="chat-list">
                    <div class="chat-contact active">
                        <div class="applicant-avatar" style="background-color: #c92a2a;">MG</div>
                        <div class="contact-info">
                            <h3 class="contact-name">Maria Garcia</h3>
                            <p class="contact-preview">You: Great, let's set up a time...</p>
                        </div>
                        <span class="contact-time">10m</span>
                    </div>
                    <div class="chat-contact">
                        <div class="applicant-avatar">AJ</div>
                        <div class="contact-info">
                            <h3 class="contact-name">Alex Johnson</h3>
                            <p class="contact-preview">Alex: Yes, I am available for an...</p>
                        </div>
                        <span class="contact-time">1h</span>
                    </div>
                    <div class="chat-contact">
                        <div class="applicant-avatar" style="background-color: #f2994a;">SC</div>
                        <div class="contact-info">
                            <h3 class="contact-name">Sarah Chen</h3>
                            <p class="contact-preview">Sarah: Here is my portfolio link...</p>
                        </div>
                        <span class="contact-time">1d</span>
                    </div>
                    <div class="chat-contact">
                        <div class="applicant-avatar" style="background-color: #27ae60;">DK</div>
                        <div class="contact-info">
                            <h3 class="contact-name">David Kim</h3>
                            <p class="contact-preview">You: Congratulations on the role!</p>
                        </div>
                        <span class="contact-time">3d</span>
                    </div>
                </div>
            </aside>

            <main class="chat-window">
                <header class="chat-header">
                    <h3>Maria Garcia</h3>
                    <p>UX/UI Designer</p>
                </header>

                <div class="chat-messages">
                    <div class="message-day"><span>Yesterday</span></div>

                    <div class="message received">
                        <p>Hello, thank you for reaching out! I'm very interested in the UX/UI Designer position.</p>
                        <span class="message-time">4:30 PM</span>
                    </div>

                    <div class="message sent">
                        <p>
                            Hi Maria, thanks for getting back to me. Your portfolio looks fantastic. Are you available for a brief
              call tomorrow?
                        </p>
                        <span class="message-time">4:32 PM</span>
                    </div>

                    <div class="message-day"><span>Today</span></div>

                    <div class="message received">
                        <p>Yes, I am! Does 10:00 AM work for you?</p>
                        <span class="message-time">9:15 AM</span>
                    </div>

                    <div class="message sent">
                        <p>Great, let's set up a time. I'll send a calendar invite shortly.</p>
                        <span class="message-time">9:17 AM</span>
                    </div>
                </div>

                <footer class="chat-input-area">
                    <button class="icon-button">
                        <svg width="20" height="20">
                            <use href="#icon-paperclip"></use>
                        </svg>
                    </button>
                    <input type="text" placeholder="Type your message...">
                    <button class="send-btn">
                        <svg width="20" height="20">
                            <use href="#icon-send"></use>
                        </svg>
                        <span>Send</span>
                    </button>
                </footer>
            </main>
        </div>
    </main>
</asp:Content>

