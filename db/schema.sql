
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

CREATE TABLE tunnels (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    subdomain TEXT,
    target_ip TEXT,
    target_port INTEGER,
    protocol TEXT CHECK (protocol IN ('TCP', 'UDP')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ports (
    id SERIAL PRIMARY KEY,
    tunnel_id INTEGER REFERENCES tunnels(id),
    port INTEGER,
    status TEXT
);

CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    tunnel_id INTEGER REFERENCES tunnels(id),
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
