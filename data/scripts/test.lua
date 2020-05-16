function on_message_publish(clientid, username, topic, payload, qos, retain)
    content = "{" .. username .."}"
    return topic, content, qos, retain
end

function register_hook()
    return "on_message_publish"
end