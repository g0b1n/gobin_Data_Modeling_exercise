CREATE TABLE "reginons" (
    "id" serial   NOT NULL,
    "reg_name" text   NOT NULL,
    CONSTRAINT "pk_reginons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" serial   NOT NULL,
    "post_title" text   NOT NULL,
    "post_text" text   NOT NULL,
    "location" text   NOT NULL,
    "user_id" INTERGER   NOT NULL,
    "region_id" INTERGER   NOT NULL,
    "category_id" INTERGER   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "id" serial   NOT NULL,
    "username" text   NOT NULL,
    "password" text   NOT NULL,
    "preferred_reg_id" INTERGER   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_region_id" FOREIGN KEY("region_id")
REFERENCES "reginons" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("id");

