-- Adminer 4.7.6 PostgreSQL dump

\connect "umuzi";

DROP TABLE IF EXISTS "customers";
CREATE TABLE "public"."customers" (
    "customer_id" integer NOT NULL,
    "first_name" character varying,
    "last_name" character varying,
    "gender" character varying,
    "address" character varying,
    "phone" integer,
    "email" character varying,
    "city" character varying,
    "country" character varying,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customer_id")
) WITH (oids = false);

INSERT INTO "customers" ("customer_id", "first_name", "last_name", "gender", "address", "phone", "email", "city", "country") VALUES
(3,	'leon',	'glen',	'male',	'81 everten rd',	84236158,	'leon@gmail.com',	'durban',	'south africa'),
(4,	'charl',	'muller',	'male',	'290A dprset st',	444236155,	'char_muller@gmail.com',	'berlin',	'germany'),
(5,	'julia',	'stein',	'female',	'2 wernerring',	446315870,	'js2234@yahoo.com',	'frankfurt',	'germany'),
(1,	'lerato',	'mabitso',	'male',	'284 chaucer st',	845236841,	'john@gmail.com',	'johannesburg',	'south africa');

DROP TABLE IF EXISTS "employees";
CREATE TABLE "public"."employees" (
    "employee_id" integer NOT NULL,
    "first_name" character varying,
    "last_name" character varying,
    "email" character varying,
    "job_title" character varying,
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employee_id")
) WITH (oids = false);

INSERT INTO "employees" ("employee_id", "first_name", "last_name", "email", "job_title") VALUES
(1,	'kani',	'matthew',	'mat@gmail.com',	'clerk'),
(2,	'lesly',	'cronje',	'lesC@gmail.com',	'manager'),
(3,	'gideon',	'maduka',	'm@gmail.com',	'accountant');

DROP TABLE IF EXISTS "orders";
CREATE TABLE "public"."orders" (
    "order_id" integer NOT NULL,
    "product_id" integer,
    "payment_id" integer,
    "fulfilled_by_employee_id" integer,
    "date_required" date,
    "date_shipped" date,
    "status" character varying,
    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id"),
    CONSTRAINT "orders_fulfilled_by_employee_id_fkey" FOREIGN KEY (fulfilled_by_employee_id) REFERENCES employees(employee_id) NOT DEFERRABLE,
    CONSTRAINT "orders_payment_id_fkey" FOREIGN KEY (payment_id) REFERENCES payments(payment_id) NOT DEFERRABLE,
    CONSTRAINT "orders_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(product_id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "orders" ("order_id", "product_id", "payment_id", "fulfilled_by_employee_id", "date_required", "date_shipped", "status") VALUES
(1,	1,	1,	2,	'2018-09-05',	NULL,	'not shipped'),
(2,	1,	2,	2,	'2018-09-04',	'2018-09-03',	'shipped'),
(3,	3,	3,	3,	'2018-09-06',	NULL,	'not shipped');

DROP TABLE IF EXISTS "payments";
CREATE TABLE "public"."payments" (
    "customer_id" integer,
    "payment_id" integer NOT NULL,
    "payment_date" date,
    "amount" numeric,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("payment_id"),
    CONSTRAINT "payments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "payments" ("customer_id", "payment_id", "payment_date", "amount") VALUES
(1,	1,	'2018-09-01',	150.75),
(5,	2,	'2018-09-03',	150.75),
(4,	3,	'2018-09-03',	700.60);

DROP TABLE IF EXISTS "products";
CREATE TABLE "public"."products" (
    "product_id" integer NOT NULL,
    "product_name" character varying,
    "description" character varying,
    "buy_price" numeric,
    CONSTRAINT "products_pkey" PRIMARY KEY ("product_id")
) WITH (oids = false);

INSERT INTO "products" ("product_id", "product_name", "description", "buy_price") VALUES
(1,	'harley davidson chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	150.75),
(2,	'classic car',	'Turnable front wheels, steering function',	550.75),
(3,	'sports car',	'Turnable front wheels, steering function',	700.60);

-- 2020-03-05 12:59:23.02994+00
