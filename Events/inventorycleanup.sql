CREATE EVENT inventorycleanup
    ON SCHEDULE EVERY 30 SECOND
    ON COMPLETION preserve
    DO
      delete from Pharmacy.inventory where Deleted = 1; 