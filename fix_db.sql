ALTER TABLE properties
    RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties
    RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties
    RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties
ALTER COLUMN melting_point_celsius
SET NOT NULL;
ALTER TABLE properties
ALTER COLUMN boiling_point_celsius
SET NOT NULL;
ALTER TABLE elements
ADD CONSTRAINT symbol_unq UNIQUE(symbol);
ALTER TABLE elements
ADD CONSTRAINT name_unq UNIQUE(name);
ALTER TABLE elements
ALTER COLUMN symbol
SET NOT NULL;
ALTER TABLE elements
ALTER COLUMN name
SET NOT NULL;
ALTER TABLE properties
ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
CREATE TABLE types(
    type_id INT PRIMARY KEY,
    type VARCHAR(30) NOT NULL
);
ALTER TABLE properties
ADD COLUMN type_id INTEGER REFERENCES types(type_id);
INSERT INTO types (type, type_id)
VALUES ('nonmetal', 1),
    ('metal', 2),
    ('metalloid', 3);
UPDATE properties SET type_id = 1 where type = 'nonmetal';
UPDATE properties SET type_id = 2 where type = 'metal';
UPDATE properties SET type_id = 3 where type = 'metalloid';
ALTER TABLE properties
ALTER COLUMN type_id SET NOT NULL;
update elements
set symbol = initcap(symbol);
update elements
set symbol = 'MT'
WHERE symbol = 'Mt';
alter table properties
alter column atomic_mass type decimal;
update properties
set atomic_mass = atomic_mass::real;
insert INTO elements(atomic_number, symbol, name)
VALUES (9, 'F', 'Fluorine');
insert into properties(
        atomic_number,
        type, type_id,
        atomic_mass,
        melting_point_celsius,
        boiling_point_celsius
    )
VALUES (9, 'nonmetal', 1, 18.998, -220, -188.1);
insert INTO elements(atomic_number, symbol, name)
VALUES (10, 'Ne', 'Neon');
insert into properties(
        atomic_number,
        type, type_id,
        atomic_mass,
        melting_point_celsius,
        boiling_point_celsius
    )
VALUES (10, 'nonmetal', 1, 20.18, -248.6, -246.1);
delete from properties
where atomic_number = 1000;
delete from elements
where atomic_number = 1000;