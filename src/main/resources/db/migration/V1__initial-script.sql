CREATE TABLE users (
    id bigserial PRIMARY KEY,
    name varchar(60) NOT NULL,
    lastname varchar(60) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    phone_number varchar(15),
    user_name varchar(30) UNIQUE NOT NULL,
    password varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE roles (
    id bigserial PRIMARY KEY,
    name varchar(100) UNIQUE NOT NULL
);

CREATE TABLE user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE units (
    id bigserial PRIMARY KEY,
    name varchar(20) UNIQUE NOT NULL
);

CREATE TABLE categories (
    id bigserial PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE products (
    id bigserial PRIMARY KEY,
    name varchar(100) NOT NULL,
    description text,
    quantity decimal(8,2) NOT NULL CHECK (quantity > 0),
    unit_id bigint NOT NULL,
    purchase_price decimal(10,2) CHECK (purchase_price >= 0),
    price decimal(10,2) NOT NULL CHECK (price >= 0),
    category_id bigint NOT NULL,
    photo_url text,
    created_at timestamp NOT NULL DEFAULT now(),
    FOREIGN KEY (unit_id) REFERENCES units (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE INDEX idx_products_name ON products (name);
CREATE INDEX idx_products_category ON products (category_id);