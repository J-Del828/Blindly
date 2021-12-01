export const initClearMessageForm = () => {
    const messageForm = document.getElementById("new_message")
    if (messageForm) {
        const input = document.getElementById("message_content")
        messageForm.addEventListener("submit", () => {
            setTimeout(() => input.value = null)
        })
    }
}