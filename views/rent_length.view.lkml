view: rent_length {
  derived_table: {
    sql: select
          customer_id,
          rental_date,
          (
              select rental_date
              from rental t1
              where t1.customer_id = t.customer_id and t1.rental_date < t.rental_date
              order by t1.rental_date desc
              limit 1
          ) prev_date
      from rental t
      order by customer_id,rental_date



      -- select customer_id,rental_date from rental where customer_id=47 order by rental_date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: rental_date {
    type: time
    sql: ${TABLE}.rental_date ;;
  }

  dimension_group: prev_date {
    type: time
    sql: ${TABLE}.prev_date ;;
  }

  dimension: rental_length {
    label: "rental length in hour"
    type: number
    sql: timestampdiff(HOUR,${prev_date_raw},${rental_date_raw}) ;;
  }

  measure: avg_length {
    label: "Avg Rental length in hours"
    type: average
    sql: ${rental_length} ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [customer_id, rental_date_time, prev_date_time]
  }
}