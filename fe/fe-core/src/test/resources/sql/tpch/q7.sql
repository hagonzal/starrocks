[result]
TOP-N (order by [[46: N_NAME ASC NULLS FIRST, 51: N_NAME ASC NULLS FIRST, 55: year ASC NULLS FIRST]])
    TOP-N (order by [[46: N_NAME ASC NULLS FIRST, 51: N_NAME ASC NULLS FIRST, 55: year ASC NULLS FIRST]])
        AGGREGATE ([GLOBAL] aggregate [{57: sum=sum(57: sum)}] group by [[46: N_NAME, 51: N_NAME, 55: year]] having [null]
            EXCHANGE SHUFFLE[46, 51, 55]
                AGGREGATE ([LOCAL] aggregate [{57: sum=sum(56: expr)}] group by [[46: N_NAME, 51: N_NAME, 55: year]] having [null]
                    INNER JOIN (join-predicate [46: N_NAME = CANADA AND 51: N_NAME = IRAN OR 46: N_NAME = IRAN AND 51: N_NAME = CANADA AND 11: L_SUPPKEY = 1: S_SUPPKEY] post-join-predicate [null])
                        INNER JOIN (join-predicate [50: N_NATIONKEY = 39: C_NATIONKEY] post-join-predicate [null])
                            SCAN (columns[50: N_NATIONKEY, 51: N_NAME] predicate[51: N_NAME IN (IRAN, CANADA)])
                            EXCHANGE SHUFFLE[39]
                                INNER JOIN (join-predicate [9: L_ORDERKEY = 26: O_ORDERKEY] post-join-predicate [null])
                                    SCAN (columns[19: L_SHIPDATE, 9: L_ORDERKEY, 11: L_SUPPKEY, 14: L_EXTENDEDPRICE, 15: L_DISCOUNT] predicate[19: L_SHIPDATE >= 1995-01-01 AND 19: L_SHIPDATE <= 1996-12-31])
                                    EXCHANGE SHUFFLE[26]
                                        INNER JOIN (join-predicate [27: O_CUSTKEY = 36: C_CUSTKEY] post-join-predicate [null])
                                            SCAN (columns[26: O_ORDERKEY, 27: O_CUSTKEY] predicate[null])
                                            EXCHANGE BROADCAST
                                                SCAN (columns[36: C_CUSTKEY, 39: C_NATIONKEY] predicate[null])
                        EXCHANGE BROADCAST
                            INNER JOIN (join-predicate [45: N_NATIONKEY = 4: S_NATIONKEY] post-join-predicate [null])
                                SCAN (columns[45: N_NATIONKEY, 46: N_NAME] predicate[46: N_NAME IN (CANADA, IRAN)])
                                EXCHANGE SHUFFLE[4]
                                    SCAN (columns[1: S_SUPPKEY, 4: S_NATIONKEY] predicate[null])
[end]

