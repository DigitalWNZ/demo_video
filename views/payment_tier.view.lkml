view: payment_tier {
  derived_table: {
    sql: SELECT
          `payment`.`customer_id` AS `payment.customer_id`,
          COALESCE(SUM(`payment`.`amount`), 0) AS `payment.sum_payment`
      FROM
          `sakila`.`rental` AS `rental`
          LEFT JOIN `sakila`.`payment` AS `payment` ON `rental`.`rental_id` = `payment`.`rental_id`
      GROUP BY
          1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: payment_customer_id {
    type: number
    sql: ${TABLE}.`payment.customer_id` ;;
  }

  dimension: payment_sum_payment {
    type: number
    sql: ${TABLE}.`payment.sum_payment` ;;
  }

  dimension:payment_tier{
    type: tier
    tiers: [0,50,100,150,200]
    sql: ${payment_sum_payment} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [payment_customer_id, payment_sum_payment]
  }
}
