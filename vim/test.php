 <?php
                            $paged = ( get_query_var( 'page' ) ) ? get_query_var( 'page' ) : 1;
                            $query = new WP_Query( array(
                                'posts_per_page' => 13,
                                'paged' => $paged
                            ) );
                            ?>
	<?php wp_reset_postdata(); ?>
