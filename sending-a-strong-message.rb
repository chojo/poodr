# Writing maintainable code is all about focusing our mental energy on one task at a
# time, and equally importantly, on one level of abstraction at a time. The ship's
# captain doesn't think about oil pressure and driveshaft RPMs when she says "all
# ahead full!". In order to be equally clear-headed commanders of our code, we need
# to be able to trust that the objects we send messages to will respond to, and
#   understand, those messages.

# 1. We must identify the messages we want to send in order to accomplish the task at hand.
# 2. We must identify the roles which correspond to those messages.
# 3. We must ensure the method's logic receives objects which can play those roles.


# It's our task to write a method which handles imports of CSV data from the old
# system to the new system. We'll call the method #import_legacy_purchase_data. Here's what it needs to do:
# 1. Parse the purchase records from the CSV contained in a provided IO object.
# 2. For each purchase record, use the record's email address to get the associated customer record, or, if the email hasn't been seen before, create a new customer record in our system.
# 3. Use the legacy record's product ID to find or create a product record in our system.
# 4. Add the product to the customer record's list of purchases.
# 5. Notify the customer of the new location where they can download their files and update their account info.
# 6. Log the successful import of the purchase record

# Identifying the messages
# We know what the method needs to do. Now let's see if we can identify the messages we want to send in order to make it happen (element #1 in our list of three prerequisites). We'll rewrite the list of steps and see if we can flush out some messages.
# 1. #parse_legacy_purchase_records.
# 2. For #each purchase record, use the record's #email_address to #get_customer.
# 3. Use the record's #product_id to #get_product.
# 4. #add_purchased_product to the customer record.
# 5. #notify_of_files_available for the purchased product.
# 6. #log_successful_import of the purchase record.
# 
# We decide that the "find or create" aspects of getting customer or product records are details which can be safely glossed over at this level with #get_customer and #get_product, respectively.
# 
# Identifying the roles
# Now that we've identified some messages, let's identify the roles which seem like appropritate recipients. What's a role? Rebecca Wirfs-Brock calls it "a set of related responsibilities". If a message identifies one responsibility, a role brings together one or more responsibilities that make sense to be handled by the same object.
# However, a role is not the same concept as a class: more than one type of object may play a given role, and in some cases a single object might play more than one role.

# Message                        Receiver Role
# #parse_legacy_purchase_records legacy_data_parser
# #each                          purchase_list
# #email_address,                #product_id purchase_record
# #get_customer                  customer_list
# #get_product                   product_inventory
# #add_purchased_product         customer
# #notify_of_files_available     customer
# #log_successful_import         data_importer

# With our list of roles in hand, we'll once again rewrite the steps.
# 1. legacy_data_parser.parse_purchase_records.
# 2. For purchase_list.each purchase_record, use
# purchase_record.email_address to
# customer_list.get_customer.
# 3. Use the purchase_record.product_id to
# product_inventory.get_product.
# 4. customer.add_purchased_product.
# 5. customer.notify_of_files_available for the product.
# 6. self.log_successful_import of the purchase_record.
# This is starting to look a lot like code. Let's take it the rest of the way.

def import_legacy_purchase_data(data)
  purchase_list = legacy_data_parser.parse_purchase_records(data)
  purchase_list.each do |purchase_record|
    customer = customer_list.get_customer(purchase_record.email_address)
    product = product_inventory.get_product(purchase_record.product_id)
    customer.add_purchased_product(product)
    customer.notify_of_files_available(product)
    log_successful_import(purchase_record)
  end
end
