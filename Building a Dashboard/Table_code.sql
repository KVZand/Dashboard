CREATE TABLE products (
  productID INTEGER PRIMARY KEY,
  productName (VARCHAR 255) NOT NULL,
  supplierID INTEGER NOT NULL,
  categoryID INTEGER NOT NULL,
  quantityPerUnit (VARCHAR 255) NOT NULL,
  unitPrice NUMERIC NOT NULL,
  unitsInStock INTEGER,
  unitsOnOrder INTEGER,
  reorderLevel INTEGER,
  discontinued BOOL,
);
