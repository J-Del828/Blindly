import consumer from "./consumer";

const initRelationshipCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        const id = messagesContainer.dataset.relationshipId;

        consumer.subscriptions.create({ channel: "RelationshipChannel", id: id }, {
            received(data) {
                messagesContainer.insertAdjacentHTML('beforeend', data);
            }
        });
    }
}

export { initRelationshipCable };