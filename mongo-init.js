// MongoDB initialization script
db = db.getSiblingDB('activus_invoice_db');

// Create collections with validation
db.createCollection('users', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['email', 'password_hash', 'role'],
      properties: {
        email: { bsonType: 'string' },
        password_hash: { bsonType: 'string' },
        role: { enum: ['admin', 'user', 'super_admin'] }
      }
    }
  }
});

db.createCollection('companies');
db.createCollection('projects');
db.createCollection('invoices');
db.createCollection('items');
db.createCollection('activity_logs');

// Create indexes for better performance
db.users.createIndex({ email: 1 }, { unique: true });
db.companies.createIndex({ company_name: 1 });
db.projects.createIndex({ project_name: 1 });
db.invoices.createIndex({ invoice_number: 1 });
db.items.createIndex({ item_name: 1 });

print('Database initialized successfully');
