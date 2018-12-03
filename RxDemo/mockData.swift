//
//  mockData.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 11/30/18.
//  Copyright © 2018 Fitbit. All rights reserved.
//

import Foundation
let mockData: String = """
{
    \"data\": [
        {
            \"_score\": 2500092.5,
            \"analytics\": {
                \"onclick\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=JIX9t2j0ZTN9S&action_type=CLICK\"
                },
                \"onload\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=JIX9t2j0ZTN9S&action_type=SEEN\"
                },
                \"onsent\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=JIX9t2j0ZTN9S&action_type=SENT\"
                }
            },
            \"bitly_gif_url\": \"https://gph.is/1LjlEFE\",
            \"bitly_url\": \"https://gph.is/1LjlEFE\",
            \"content_url\": \"\",
            \"embed_url\": \"https://giphy.com/embed/JIX9t2j0ZTN9S\",
            \"id\": \"JIX9t2j0ZTN9S\",
            \"images\": {
                \"480w_still\": {
                    \"height\": \"480\",
                    \"size\": \"19581\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/480w_s.jpg\",
                    \"width\": \"480\"
                },
                \"downsized\": {
                    \"height\": \"250\",
                    \"size\": \"982690\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized.gif\",
                    \"width\": \"250\"
                },
                \"downsized_large\": {
                    \"height\": \"720\",
                    \"size\": \"7712339\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif\",
                    \"width\": \"720\"
                },
                \"downsized_medium\": {
                    \"height\": \"576\",
                    \"size\": \"4807852\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized-medium.gif\",
                    \"width\": \"576\"
                },
                \"downsized_small\": {
                    \"height\": \"720\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized-small.mp4\",
                    \"mp4_size\": \"179594\",
                    \"width\": \"720\"
                },
                \"downsized_still\": {
                    \"height\": \"250\",
                    \"size\": \"40785\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized_s.gif\",
                    \"width\": \"250\"
                },
                \"fixed_height\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200.mp4\",
                    \"mp4_size\": \"17842\",
                    \"size\": \"632576\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200.webp\",
                    \"webp_size\": \"158680\",
                    \"width\": \"200\"
                },
                \"fixed_height_downsampled\": {
                    \"height\": \"200\",
                    \"size\": \"163461\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200_d.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200_d.webp\",
                    \"webp_size\": \"46454\",
                    \"width\": \"200\"
                },
                \"fixed_height_small\": {
                    \"height\": \"100\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100.mp4\",
                    \"mp4_size\": \"8988\",
                    \"size\": \"205745\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100.webp\",
                    \"webp_size\": \"65708\",
                    \"width\": \"100\"
                },
                \"fixed_height_small_still\": {
                    \"height\": \"100\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100_s.gif\",
                    \"width\": \"100\"
                },
                \"fixed_height_still\": {
                    \"height\": \"200\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200_s.gif\",
                    \"width\": \"200\"
                },
                \"fixed_width\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w.mp4\",
                    \"mp4_size\": \"17842\",
                    \"size\": \"632576\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w.webp\",
                    \"webp_size\": \"158680\",
                    \"width\": \"200\"
                },
                \"fixed_width_downsampled\": {
                    \"height\": \"200\",
                    \"size\": \"163461\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w_d.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w_d.webp\",
                    \"webp_size\": \"46454\",
                    \"width\": \"200\"
                },
                \"fixed_width_small\": {
                    \"height\": \"100\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100w.mp4\",
                    \"mp4_size\": \"8988\",
                    \"size\": \"205745\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100w.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100w.webp\",
                    \"webp_size\": \"65708\",
                    \"width\": \"100\"
                },
                \"fixed_width_small_still\": {
                    \"height\": \"100\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/100w_s.gif\",
                    \"width\": \"100\"
                },
                \"fixed_width_still\": {
                    \"height\": \"200\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/200w_s.gif\",
                    \"width\": \"200\"
                },
                \"looping\": {
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-loop.mp4\",
                    \"mp4_size\": \"812868\"
                },
                \"original\": {
                    \"frames\": \"25\",
                    \"height\": \"720\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.mp4\",
                    \"mp4_size\": \"52042\",
                    \"size\": \"7712339\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif\",
                    \"webp\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.webp\",
                    \"webp_size\": \"1427374\",
                    \"width\": \"720\"
                },
                \"original_mp4\": {
                    \"height\": \"480\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.mp4\",
                    \"mp4_size\": \"52042\",
                    \"width\": \"480\"
                },
                \"original_still\": {
                    \"height\": \"720\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy_s.gif\",
                    \"width\": \"720\"
                },
                \"preview\": {
                    \"height\": \"378\",
                    \"mp4\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.mp4\",
                    \"mp4_size\": \"37518\",
                    \"width\": \"378\"
                },
                \"preview_gif\": {
                    \"height\": \"92\",
                    \"size\": \"49760\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.gif\",
                    \"width\": \"92\"
                },
                \"preview_webp\": {
                    \"height\": \"166\",
                    \"size\": \"49956\",
                    \"url\": \"https://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.webp\",
                    \"width\": \"166\"
                }
            },
            \"import_datetime\": \"2015-06-18 00:42:05\",
            \"is_sticker\": 0,
            \"rating\": \"g\",
            \"slug\": \"JIX9t2j0ZTN9S\",
            \"source\": \"https://www.reddit.com/r/reactiongifs/comments/3a8akf/my_cats_reaction_when_i_leave_home/\",
            \"source_post_url\": \"https://www.reddit.com/r/reactiongifs/comments/3a8akf/my_cats_reaction_when_i_leave_home/\",
            \"source_tld\": \"www.reddit.com\",
            \"title\": \"funny cat GIF\",
            \"trending_datetime\": \"2017-08-29 19:09:14\",
            \"type\": \"gif\",
            \"url\": \"https://giphy.com/gifs/JIX9t2j0ZTN9S\",
            \"username\": \"\"
        },
        {
            \"_score\": 2300081.8,
            \"analytics\": {
                \"onclick\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=mlvseq9yvZhba&action_type=CLICK\"
                },
                \"onload\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=mlvseq9yvZhba&action_type=SEEN\"
                },
                \"onsent\": {
                    \"url\": \"https://giphy_analytics.giphy.com/simple_analytics?response_id=5c0151856e4f635867054c75&event_type=GIF_SEARCH&gif_id=mlvseq9yvZhba&action_type=SENT\"
                }
            },
            \"bitly_gif_url\": \"https://gph.is/2d8adKP\",
            \"bitly_url\": \"https://gph.is/2d8adKP\",
            \"content_url\": \"\",
            \"embed_url\": \"https://giphy.com/embed/mlvseq9yvZhba\",
            \"id\": \"mlvseq9yvZhba\",
            \"images\": {
                \"480w_still\": {
                    \"height\": \"480\",
                    \"url\": \"https://media4.giphy.com/media/mlvseq9yvZhba/480w_s.jpg\",
                    \"width\": \"480\"
                },
                \"downsized\": {
                    \"height\": \"200\",
                    \"size\": \"132937\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-downsized.gif\",
                    \"width\": \"200\"
                },
                \"downsized_large\": {
                    \"height\": \"200\",
                    \"size\": \"132937\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.gif~c200\",
                    \"width\": \"200\"
                },
                \"downsized_medium\": {
                    \"height\": \"200\",
                    \"size\": \"132937\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.gif~c200\",
                    \"width\": \"200\"
                },
                \"downsized_small\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-downsized-small.mp4\",
                    \"mp4_size\": \"41111\",
                    \"width\": \"200\"
                },
                \"downsized_still\": {
                    \"height\": \"200\",
                    \"size\": \"14369\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-downsized_s.gif\",
                    \"width\": \"200\"
                },
                \"fixed_height\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200.mp4\",
                    \"mp4_size\": \"16843\",
                    \"size\": \"132910\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200.webp\",
                    \"webp_size\": \"165070\",
                    \"width\": \"200\"
                },
                \"fixed_height_downsampled\": {
                    \"height\": \"200\",
                    \"size\": \"73055\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200_d.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200_d.webp\",
                    \"webp_size\": \"76088\",
                    \"width\": \"200\"
                },
                \"fixed_height_small\": {
                    \"height\": \"100\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100.mp4\",
                    \"mp4_size\": \"6437\",
                    \"size\": \"33264\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100.webp\",
                    \"webp_size\": \"53830\",
                    \"width\": \"100\"
                },
                \"fixed_height_small_still\": {
                    \"height\": \"100\",
                    \"size\": \"4400\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100_s.gif\",
                    \"width\": \"100\"
                },
                \"fixed_height_still\": {
                    \"height\": \"200\",
                    \"size\": \"14369\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200_s.gif\",
                    \"width\": \"200\"
                },
                \"fixed_width\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w.mp4\",
                    \"mp4_size\": \"16843\",
                    \"size\": \"132910\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w.webp\",
                    \"webp_size\": \"165070\",
                    \"width\": \"200\"
                },
                \"fixed_width_downsampled\": {
                    \"height\": \"200\",
                    \"size\": \"73055\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w_d.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w_d.webp\",
                    \"webp_size\": \"76088\",
                    \"width\": \"200\"
                },
                \"fixed_width_small\": {
                    \"height\": \"100\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100w.mp4\",
                    \"mp4_size\": \"6437\",
                    \"size\": \"33264\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100w.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100w.webp\",
                    \"webp_size\": \"53830\",
                    \"width\": \"100\"
                },
                \"fixed_width_small_still\": {
                    \"height\": \"100\",
                    \"size\": \"4400\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/100w_s.gif\",
                    \"width\": \"100\"
                },
                \"fixed_width_still\": {
                    \"height\": \"200\",
                    \"size\": \"14369\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/200w_s.gif\",
                    \"width\": \"200\"
                },
                \"looping\": {
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-loop.mp4\",
                    \"mp4_size\": \"1872820\"
                },
                \"original\": {
                    \"frames\": \"13\",
                    \"hash\": \"046a728414fff3b3a778be450d1e8139\",
                    \"height\": \"200\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.mp4\",
                    \"mp4_size\": \"225038\",
                    \"size\": \"132937\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.gif\",
                    \"webp\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.webp\",
                    \"webp_size\": \"165070\",
                    \"width\": \"200\"
                },
                \"original_mp4\": {
                    \"height\": \"480\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy.mp4\",
                    \"mp4_size\": \"95460\",
                    \"width\": \"480\"
                },
                \"original_still\": {
                    \"height\": \"200\",
                    \"size\": \"14369\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy_s.gif\",
                    \"width\": \"200\"
                },
                \"preview\": {
                    \"height\": \"200\",
                    \"mp4\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-preview.mp4\",
                    \"mp4_size\": \"41111\",
                    \"width\": \"200\"
                },
                \"preview_gif\": {
                    \"height\": \"146\",
                    \"size\": \"49595\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-preview.gif\",
                    \"width\": \"146\"
                },
                \"preview_webp\": {
                    \"height\": \"148\",
                    \"size\": \"49660\",
                    \"url\": \"https://media3.giphy.com/media/mlvseq9yvZhba/giphy-preview.webp\",
                    \"width\": \"148\"
                }
            },
            \"import_datetime\": \"2016-09-22 23:30:56\",
            \"is_sticker\": 0,
            \"rating\": \"g\",
            \"slug\": \"funny-cat-mlvseq9yvZhba\",
            \"source\": \"https://photobucket.com/images/funny%20cat%20gifs\",
            \"source_post_url\": \"https://photobucket.com/images/funny%20cat%20gifs\",
            \"source_tld\": \"photobucket.com\",
            \"title\": \"bored cat GIF\",
            \"trending_datetime\": \"2017-07-31 14:30:02\",
            \"type\": \"gif\",
            \"url\": \"https://giphy.com/gifs/funny-cat-mlvseq9yvZhba\",
            \"username\": \"\"
        }
    ],
    \"meta\": {
        \"msg\": \"OK\",
        \"response_id\": \"5c0151856e4f635867054c75\",
        \"status\": 200
    },
    \"pagination\": {
        \"count\": 2,
        \"offset\": 0,
        \"total_count\": 83653
    }
}
"""
