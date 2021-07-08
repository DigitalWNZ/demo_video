view: rental_pert {
  derived_table: {
    sql: SELECT
      rented_inventory.film_id,
      rented_inventory.films_rental,
      total_inventory.films_all
      FROM
      (
        Select
        film_id,
        count(*) as films_rental
        FROM inventory
        JOIN rental on rental.inventory_id = inventory.inventory_id
        WHERE rental.return_date is NULL
        GROUP BY 1
      ) as rented_inventory
      LEFT JOIN
      (
        Select
        film_id,
        count(*) as films_all
        FROM inventory
        GROUP BY 1
      ) as total_inventory
      ON rented_inventory.film_id = total_inventory.film_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: film_id {
    type: number
    sql: ${TABLE}.film_id ;;
  }

  dimension: films_rental {
    type: number
    sql: ${TABLE}.films_rental ;;
  }

  dimension: films_all {
    type: number
    sql: ${TABLE}.films_all ;;
  }

  set: detail {
    fields: [film_id, films_rental, films_all]
  }
}