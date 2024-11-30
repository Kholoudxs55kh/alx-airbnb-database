# **Entities and Attributes**

## **1. User**

- **Attributes:**
  - user_id (Primary Key, UUID, Indexed)
  - first_name (VARCHAR, NOT NULL)
  - last_name (VARCHAR, NOT NULL)
  - email (VARCHAR, UNIQUE, NOT NULL)
  - password_hash (VARCHAR, NOT NULL)
  - phone_number (VARCHAR, NULL)
  - role (ENUM: guest, host, admin, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## **2. Property**

- **Attributes:**
  - property_id (Primary Key, UUID, Indexed)
  - host_id (Foreign Key, references User(user_id))
  - name (VARCHAR, NOT NULL)
  - description (TEXT, NOT NULL)
  - location (VARCHAR, NOT NULL)
  - price_per_night (DECIMAL, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

## **3. Booking**

- **Attributes:**
  - booking_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - start_date (DATE, NOT NULL)
  - end_date (DATE, NOT NULL)
  - total_price (DECIMAL, NOT NULL)
  - status (ENUM: pending, confirmed, canceled, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## **4. Payment**

- **Attributes:**
  - payment_id (Primary Key, UUID, Indexed)
  - booking_id (Foreign Key, references Booking(booking_id))
  - amount (DECIMAL, NOT NULL)
  - payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

## **5. Review**

- **Attributes:**
  - review_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - comment (TEXT, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## **6. Message**

- **Attributes:**
  - message_id (Primary Key, UUID, Indexed)
  - sender_id (Foreign Key, references User(user_id))
  - recipient_id (Foreign Key, references User(user_id))
  - message_body (TEXT, NOT NULL)
  - sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---
---

## **Relationships**

1. **User ↔ Property**
   - **Relationship:** One-to-Many
   - **Details:** A user (host) can own multiple properties, but each property belongs to one host.

2. **User ↔ Booking**
   - **Relationship:** One-to-Many
   - **Details:** A user (guest) can make multiple bookings, but each booking is associated with one user.

3. **Property ↔ Booking**
   - **Relationship:** One-to-Many
   - **Details:** A property can have multiple bookings, but each booking refers to one property.

4. **Booking ↔ Payment**
   - **Relationship:** One-to-One
   - **Details:** Each booking can have one payment, and each payment is tied to one booking.

5. **Property ↔ Review**
   - **Relationship:** One-to-Many
   - **Details:** A property can have multiple reviews, but each review is linked to one property.

6. **User ↔ Review**
   - **Relationship:** One-to-Many
   - **Details:** A user (guest) can leave multiple reviews, but each review is tied to one user.

7. **User ↔ Message**
   - **Relationship:** Recursive (User to User)
   - **Details:** A user can send messages to other users. Each message has one sender and one recipient.
