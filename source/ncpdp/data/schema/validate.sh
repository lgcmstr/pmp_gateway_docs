#  Test that this schema works for the MedicationDispensed Nodes.
xmllint -noout -schema medication_dispensed_schema.xsd medication_dispensed_valid.xml
