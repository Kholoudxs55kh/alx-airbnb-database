# **Normalized Schema**

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

---

## **2. Property**

- **Attributes:**
  - property_id (Primary Key, UUID, Indexed)
  - host_id (Foreign Key, references User(user_id))
  - name (VARCHAR, NOT NULL)
  - description (TEXT, NOT NULL)
  - location_id (Foreign Key, references Location(location_id))
  - price_per_night (DECIMAL, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

## **3. Location**

- **Attributes:**
  - location_id (Primary Key, UUID)
  - location_name (VARCHAR, NOT NULL)

---

## **4. Booking**

- **Attributes:**
  - booking_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - start_date (DATE, NOT NULL)
  - end_date (DATE, NOT NULL)
  - total_price (DECIMAL, NOT NULL)
  - status (ENUM: pending, confirmed, canceled, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **5. Payment**

- **Attributes:**
  - payment_id (Primary Key, UUID, Indexed)
  - booking_id (Foreign Key, references Booking(booking_id))
  - amount (DECIMAL, NOT NULL)
  - payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

---

## **6. Review**

- **Attributes:**
  - review_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - comment (TEXT, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **7. Message**

- **Attributes:**
  - message_id (Primary Key, UUID, Indexed)
  - sender_id (Foreign Key, references User(user_id))
  - recipient_id (Foreign Key, references User(user_id))
  - message_body (TEXT, NOT NULL)
  - sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **Normalization Steps**

#### **Step 1: First Normal Form (1NF)**

- **Objective:** Ensure that all attributes are atomic, with no repeating groups or arrays.
  - No arrays or multi-valued fields were present in the original schema.
  - Each table has a primary key, ensuring unique identification of rows.

---

#### **Step 2: Second Normal Form (2NF)**

- **Objective:** Ensure that all non-key attributes are fully functionally dependent on the entire primary key.
  - The original schema already satisfies 2NF, as there are no partial dependencies. For example, in the `Booking` table, attributes like `start_date` and `total_price` depend entirely on the composite relationship between `property_id` and `user_id`.

---

#### **Step 3: Third Normal Form (3NF)**

- **Objective:** Remove transitive dependencies, ensuring non-key attributes depend only on the primary key.
  - **Issue Identified: Location redundancy in the `Property` table.**
    - In the original schema, `location` was a string attribute in the `Property` table. If multiple properties were in the same location, the location data would be repeated, violating 3NF.
    - **Solution:** A new `Location` table was created, and a `location_id` foreign key was added to the `Property` table.

---

# Normalization Process

## Objective

To ensure the database schema adheres to third normal form (3NF), eliminating redundancy and ensuring data integrity.

## Normalization Steps

### Step 1: First Normal Form (1NF)

- Ensured all attributes are atomic.
- No multi-valued attributes or repeating groups were present in the schema.

### Step 2: Second Normal Form (2NF)

- Verified all non-key attributes depend fully on the primary key.
- No partial dependencies were identified in the schema.

### Step 3: Third Normal Form (3NF)

- Removed transitive dependencies:
  - Identified a potential redundancy in the `Property` table (`location` field).
  - Created a separate `Location` table to store unique location data.
  - Replaced the `location` attribute in the `Property` table with a `location_id` foreign key referencing the `Location` table.

## Final Schema

The schema now adheres to 3NF, with no partial or transitive dependencies. Redundancy is minimized, and data integrity is ensured.

## Benefits of Normalization

- Reduces data duplication and redundancy.
- Improves data consistency and integrity.
- Simplifies schema maintenance and scalability.
