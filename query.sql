SELECT 
p.id_product AS 'id',
pl.name AS 'title',
strip_html_tags(pl.description_short) AS 'description',
replace(replace(p.available_for_order,0,"out of stock"),1,"in stock") AS 'availability',
p.condition AS 'condition',
truncate(p.price,2) AS 'price',
concat('https://MYPRESTASHOP.it/', pl.link_rewrite, '.html') AS 'link',
concat('https://MYPRESTASHOP.it/img/p/',mid(im.id_image,1,1),'/', if (length(im.id_image)>1,concat(mid(im.id_image,2,1),'/'),''),if (length(im.id_image)>2,concat(mid(im.id_image,3,1),'/'),''),if (length(im.id_image)>3,concat(mid(im.id_image,4,1),'/'),''),if (length(im.id_image)>4,concat(mid(im.id_image,5,1),'/'),''), im.id_image, '.jpg' ) AS image_link,
m.name 'manufacturer'
FROM ps_product p
INNER JOIN ps_product_lang pl ON p.id_product = pl.id_product
LEFT JOIN ps_manufacturer m ON (p.id_manufacturer = m.id_manufacturer)
LEFT JOIN ps_image im ON p.id_product = im.id_product
WHERE 1=1
and p.active = 1
