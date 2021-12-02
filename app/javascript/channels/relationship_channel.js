import consumer from "./consumer";

const initRelationshipCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        messagesContainer.scrollTop = messagesContainer.scrollHeight
        const id = messagesContainer.dataset.relationshipId;
        const currentUserId = messagesContainer.dataset.currentUserId;

        consumer.subscriptions.create({ channel: "RelationshipChannel", id: id }, {
            received(data) {
                const el = document.createElement("div")
                data.message.trim()
                el.innerHTML = data.message
                const message = el.children[0]
                message.classList.add(currentUserId == data.sender_id ? "right-chat" : "left-chat")
                messagesContainer.appendChild(message);
                messagesContainer.scrollTop = messagesContainer.scrollHeight
            }
        });
    }
}

export { initRelationshipCable };