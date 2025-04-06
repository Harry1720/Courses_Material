-- user table
CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR UNIQUE,
    password VARCHAR,
    phone_no VARCHAR(10),
    gender VARCHAR(10),
    user_img TEXT,
    status VARCHAR(10) CHECK (status IN ('active', 'banned'))
);

-- buyer table
CREATE TABLE buyer (
    buyer_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id) ON DELETE CASCADE UNIQUE,
    name VARCHAR,
    address VARCHAR
);

-- seller table
CREATE TABLE seller (
    seller_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id) ON DELETE CASCADE UNIQUE,
    shop_name VARCHAR,
    bank_account VARCHAR,
    tax_code VARCHAR(50)
);

-- seller_address table
CREATE TABLE seller_address (
    seller_address_id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES seller(seller_id) ON DELETE CASCADE,
    address VARCHAR
);

-- category table
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR
);

-- brand table
CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(250)
);

-- product table
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES seller(seller_id) ON DELETE SET NULL,
    category_id INT REFERENCES category(category_id),
    brand_id INT REFERENCES brand(brand_id),
    product_name VARCHAR,
    description TEXT
);

-- product_type table
CREATE TABLE product_type (
    product_type_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(product_id) ON DELETE CASCADE,
    product_type_name VARCHAR(100),
    price DECIMAL,
    list_price DECIMAL,
    inventory INT
);

-- product_img table
CREATE TABLE product_img (
    img_id SERIAL PRIMARY KEY,
    product_type_id INT REFERENCES product_type(product_type_id) ON DELETE CASCADE,
    img_url VARCHAR(250)
);

-- order table
CREATE TABLE "order" (
    order_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyer(buyer_id) ON DELETE SET NULL,
    order_date TIMESTAMP,
    total_amount DECIMAL,
    status VARCHAR(20) CHECK (status IN ('wait_to_pick_up', 'shipping', 'completed'))
);

-- order_item table
CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES "order"(order_id),
    product_id INT REFERENCES product(product_id),
    quantity INT,
    price DECIMAL
);

-- cart table
CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyer(buyer_id)
);

-- cart_item table
CREATE TABLE cart_item (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INT REFERENCES cart(cart_id),
    product_id INT REFERENCES product(product_id),
    quantity INT
);

-- shipment table
CREATE TABLE shipment (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES "order"(order_id),
    status VARCHAR(20) CHECK (status IN ('wait_to_pick_up', 'shipping', 'completed')),
    pickup_time TIMESTAMP,
    delivery_time TIMESTAMP
);

-- administrator table
CREATE TABLE administrator (
    admin_id SERIAL PRIMARY KEY,
    admin_name VARCHAR UNIQUE,
    password VARCHAR,
    phone_no VARCHAR(10),
    email VARCHAR(50),
    gender VARCHAR(10)
);

-- rating table
CREATE TABLE rating (
    rating_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyer(buyer_id) ON DELETE CASCADE,
    product_id INT REFERENCES product(product_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- seller_response table
CREATE TABLE seller_response (
    response_id SERIAL PRIMARY KEY,
    rating_id INT REFERENCES rating(rating_id) ON DELETE CASCADE UNIQUE,
    seller_id INT REFERENCES seller(seller_id) ON DELETE CASCADE,
    response_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- chat table
CREATE TABLE chat (
    chat_id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES seller(seller_id) ON DELETE CASCADE,
    buyer_id INT REFERENCES buyer(buyer_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- message table
CREATE TABLE message (
    message_id SERIAL PRIMARY KEY,
    chat_id INT REFERENCES chat(chat_id) ON DELETE CASCADE,
    user_id INT REFERENCES "user"(user_id) ON DELETE CASCADE,
    message_text TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- complaint table
CREATE TABLE complaint (
    complaint_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyer(buyer_id) ON DELETE CASCADE,
    complaint_title VARCHAR(250),
    complaint_text TEXT,
    status VARCHAR(20) CHECK (status IN ('pending', 'in_progress', 'resolved')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE verification_tokens (
    token_id SERIAL PRIMARY KEY,
    token VARCHAR(255) NOT NULL UNIQUE,
    user_id INT REFERENCES "user"(user_id) ON DELETE CASCADE,
    expiry_date TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

ALTER TABLE "user" 
DROP CONSTRAINT user_status_check,
ADD CONSTRAINT user_status_check CHECK (status IN ('active', 'banned', 'inactive'));