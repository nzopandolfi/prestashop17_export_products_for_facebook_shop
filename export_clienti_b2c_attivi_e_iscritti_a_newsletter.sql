SELECT 
	ps_customer.id_customer 'ID Cliente',
    ps_group_lang.name 'Gruppo',
    CONCAT( CONCAT(UPPER(SUBSTRING(ps_customer.firstname,1,1)),LOWER(SUBSTRING(ps_customer.firstname,2))), ' ', CONCAT(UPPER(SUBSTRING(ps_customer.lastname,1,1)),LOWER(SUBSTRING(ps_customer.lastname,2)))) 'Nome Cognome',
	ps_customer.company 'Cliente/Azienda',
	ps_customer.siret 'P.Iva/Cf',
	ps_customer.email 'Email',
    replace(replace(ps_customer.active,0,"No"),1,"Si") AS 'Attivo',
    replace(replace(ps_customer.active,0,"No"),1,"Si") AS 'Iscritto alla Newsletter'
    
FROM ps_customer

INNER JOIN ps_customer_group ON ps_customer.id_customer = ps_customer_group.id_customer
INNER JOIN ps_group_lang ON ps_customer_group.id_group = ps_group_lang.id_group

WHERE ps_group_lang.name NOT LIKE 'Business%'
AND ps_customer.active = 1 AND ps_customer.newsletter = 1  
ORDER BY ps_customer.id_customer ASC;
