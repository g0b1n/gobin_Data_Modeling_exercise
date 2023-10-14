CREATE TABLE "doctors" (
    "id" serial   NOT NULL,
    "dr_name" text   NOT NULL,
    "dr_spicilaty" text   NOT NULL,
    "patient_id" INTERGER   NOT NULL,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "pt_visits" (
    "id" serial   NOT NULL,
    "doctor_id" INTERGER   NOT NULL,
    "patients_id" INTERGER   NOT NULL,
    "visit_date" text   NOT NULL,
    CONSTRAINT "pk_pt_visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patients" (
    "id" serial   NOT NULL,
    "pt_name" text   NOT NULL,
    "pt_bday" text   NOT NULL,
    "pt_insurance" text   NOT NULL,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diseases" (
    "id" serial   NOT NULL,
    "diesease_name" text   NOT NULL,
    "diesease_desc" text   NOT NULL,
    "patient_diseases" INTERGER   NOT NULL,
    CONSTRAINT "pk_diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diagnoses" (
    "id" serial   NOT NULL,
    "pt_visit_id" INTERGER   NOT NULL,
    "diseases_id" INTERGER   NOT NULL,
    "dr_notes" text   NOT NULL,
    CONSTRAINT "pk_diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "pt_visits" ADD CONSTRAINT "fk_pt_visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctors" ("id");

ALTER TABLE "pt_visits" ADD CONSTRAINT "fk_pt_visits_patients_id" FOREIGN KEY("patients_id")
REFERENCES "patients" ("id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_pt_visit_id" FOREIGN KEY("pt_visit_id")
REFERENCES "pt_visits" ("id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_diseases_id" FOREIGN KEY("diseases_id")
REFERENCES "diseases" ("id");
