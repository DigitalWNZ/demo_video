view: rental {
  sql_table_name: sakila.rental ;;
  drill_fields: [rental_id]

  dimension: rental_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.rental_id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: inventory_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_id ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_update ;;
  }

  dimension_group: rental {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.rental_date ;;
  }

  dimension_group: return {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.return_date ;;
  }

  dimension: late_rental {
    type: yesno
    sql: datediff(${return_date},${return_date})>7 ;;
  }



  dimension: staff_id {
    type: yesno
    # hidden: yes
    sql: ${TABLE}.staff_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_late_rental {
    type: count
    filters: [late_rental: "yes"]
  }

  measure: num_customer_retained {
    type: count
    filters: [return_date: "NULL"]
  }

  measure: ratio_late {
    type: number
    sql: ${num_late_rental}/${count} ;;
    value_format_name: percent_2
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      rental_id,
      inventory.inventory_id,
      customer.customer_id,
      customer.first_name,
      customer.last_name,
      staff.staff_id,
      staff.first_name,
      staff.last_name,
      staff.username,
      payment.count
    ]
  }
}
