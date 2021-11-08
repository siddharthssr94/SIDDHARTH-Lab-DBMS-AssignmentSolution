CREATE DEFINER=`root`@`localhost` PROCEDURE `Supplier_Verdict`()
BEGIN
	-- Verdict on that rating if any like
		-- 	if rating > 4 then "Genuine Supplier"
		-- 	if rating > 2 "Average Supplier"
		--  else "Supplier should not be considered"
	select supplier.supp_id , supp_name , rat_ratstars,
    case
		when rat_ratstars > 4 then "Genuine Supplier"
        when rat_ratstars > 2 then "Average Supplier"
        else "Supplier should not be considered"
	end as verdict
    from rating inner join supplier on rating.supp_id = supplier.supp_id;
END