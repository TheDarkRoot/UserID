trap 'printf "\n";partial;exit 1' 1

banner() {
printf "\n"
printf "\033[36;1m            UserID\033[32;1m v1.0.0 \e[0m\n"
printf "\033[33;1m #     #\033[0;1m ####################\033[33;1m ### ######  \e[0m\n"
printf "\033[33;1m #     #  ####  ###### #####   #  #     # \e[0m\n"
printf "\033[33;1m #     # #      #      #    #  #  #     # \e[0m\n"
printf "\033[33;1m #     #  ####  #####  #    #  #  #     # \e[0m\n"
printf "\033[33;1m #     #      # #      #####   #  #     # \e[0m\n"
printf "\033[33;1m #     # #    # #      #   #   #  #     # \e[0m\n"
printf "\033[33;1m  #####   ####  ###### #    # ### ######  \e[0m\n"
printf "\033[0;1m ############[\033[36;1m TheDarkRoot\033[0;1m ]############# \e[0m\n"
printf "\n"
}

partial() {

if [[ -e $username.txt ]]; then
printf "\033[34;1m[\e[0m\033[32;1m*\e[0m\033[34;1m]\e[0m\033[36;1m Saved:\e[0m\033[32;1m %s.txt\n" $username
fi
}

scanner() {

read -p $'\033[34;1m[\e[0m\033[33;1m?\e[0m\033[34;1m]\e[0m\033[36;1m Input UserID:\e[0m\033[33;1m ' username

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username
rm -rf $username.txt
fi
printf "\n"
printf "\033[34;1m[\e[0m\033[33;1m*\e[0m\033[34;1m]\e[0m\033[36;1m Checking UserID\033[0;1m %s\e[0m\033[36;1m on: \e[0m\n" $username

# Instagram
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Instagram: \e[0m\033[0;1m"
check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)

if [[ $check_insta == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://www.instagram.com/%s\n" $username
printf "https://www.instagram.com/%s\n" $username > $username.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Facebook
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Facebook: \e[0m\033[0;1m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)

if [[ $check_face == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://www.facebook.com/%s\n" $username
printf "https://www.facebook.com/%s\n" $username >> $username.txt
elif [[ $check_face == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Twitter
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Twitter: \e[0m\033[0;1m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_twitter == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://www.twitter.com/%s\n" $username
printf "https://www.twitter.com/%s\n" $username >> $username.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# YouTube
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m YouTube: \e[0m\033[0;1m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)

if [[ $check_youtube == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://www.youtube.com/%s\n" $username
printf "https://www.youtube.com/%s\n" $username >> $username.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# GooglePlus
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m GooglePlus: \e[0m\033[0;1m"
check=$(curl -s "https://plus.google.com/+$username/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://plus.google.com/+%s/posts\n" $username
printf "https://plus.google.com/+%s/posts\n" $username >> $username
elif [[ $check == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Reddit
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Reddit: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.reddit.com/user/%s\n" $username
printf "https://www.reddit.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Wordpress
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Wordpress: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.wordpress.com\n" $username
printf "https://%s.wordpress.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Pinterest
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Pinterest: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.pinterest.com/%s\n" $username
printf "https://www.pinterest.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Github
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Github: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.github.com/%s\n" $username
printf "https://www.github.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Gitlab
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Gitlab: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.gitlab.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.gitlab.com/%s\n" $username
printf "https://www.gitlab.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Tumblr
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Tumblr: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.tumblr.com\n" $username
printf "https://%s.tumblr.com\n" $username >> $username.txt
elif [[ $check1 == *'2'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Flickr
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Flickr: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.flickr.com/photos/%s\n" $username
printf "https://www.flickr.com/photos/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Steam
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Steam: \e[0m\033[0;1m"
check1=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://steamcommunity.com/id/%s\n" $username
printf "https://steamcommunity.com/id/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Vimeo
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Vimeo: \e[0m\033[0;1m"
check1=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://vimeo.com/%s\n" $username
printf "https://vimeo.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# SoundCloud
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m SoundCloud: \e[0m\033[0;1m"
check1=$(curl -s -i "https://soundcloud.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://soundcloud.com/%s\n" $username
printf "https://soundcloud.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Blogger
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Blogger: \e[0m\033[0;1m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)

if [[ $check == *'1'* ]]; then
printf "\033[32;1m Found!\e[0m https://%s.blogspot.com\n" $username
printf "https://%s.blogspot.com\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Disqus
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Disqus: \e[0m\033[0;1m"
check1=$(curl -s -i "https://disqus.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://disqus.com/%s\n" $username
printf "https://disqus.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Medium
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Medium: \e[0m\033[0;1m"
check1=$(curl -s -i "https://medium.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://medium.com/@%s\n" $username
printf "https://medium.com/@%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# DeviantART
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m DeviantART: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.deviantart.com\n" $username
printf "https://%s.deviantart.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# VK
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m VK: \e[0m\033[0;1m"
check1=$(curl -s -i "https://vk.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://vk.com/%s\n" $username
printf "https://vk.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# About.me
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m About.me: \e[0m\033[0;1m"
check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://about.me/%s\n" $username
printf "https://about.me/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Imgur
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Imgur: \e[0m\033[0;1m"
check1=$(curl -s -i "https://imgur.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://imgur.com/user/%s\n" $username
printf "https://imgur.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# FlipBoard
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Flipboard: \e[0m\033[0;1m"
check1=$(curl -s -i "https://flipboard.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://flipboard.com/@%s\n" $username
printf "https://flipboard.com/@%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# SlideShare
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m SlideShare: \e[0m\033[0;1m"
check1=$(curl -s -i "https://slideshare.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://slideshare.net/%s\n" $username
printf "https://slideshare.net/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Fotolog
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Fotolog: \e[0m\033[0;1m"
check1=$(curl -s -i "https://fotolog.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://fotolog.com/%s\n" $username
printf "https://fotolog.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Spotify
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Spotify: \e[0m\033[0;1m"
check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://open.spotify.com/user/%s\n" $username
printf "https://open.spotify.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# MixCloud
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m MixCloud: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.mixcloud.com/$username" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.mixcloud.com/%s\n" $username
printf "https://www.mixcloud.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Scribd
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Scribd: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.scribd.com/$username" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.scribd.com/%s\n" $username
printf "https://www.scribd.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Badoo
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Badoo: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.badoo.com/en/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.badoo.com/en/%s\n" $username
printf "https://www.badoo.com/en/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Patreon
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Patreon: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.patreon.com/%s\n" $username
printf "https://www.patreon.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# BitBucket
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m BitBucket: \e[0m\033[0;1m"
check1=$(curl -s -i "https://bitbucket.org/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://bitbucket.org/%s\n" $username
printf "https://bitbucket.org/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# DailyMotion
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m DailyMotion: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.dailymotion.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.dailymotion.com/%s\n" $username
printf "https://www.dailymotion.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Etsy
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Etsy: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.etsy.com/shop/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.etsy.com/shop/%s\n" $username
printf "https://www.etsy.com/shop/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# CashMe
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m CashMe: \e[0m\033[0;1m"
check1=$(curl -s -i "https://cash.me/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://cash.me/%s\n" $username
printf "https://cash.me/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Behance
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Behance: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.behance.net/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.behance.net/%s\n" $username
printf "https://www.behance.net/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# GoodReads
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m GoodReads: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.goodreads.com/%s\n" $username
printf "https://www.goodreads.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Instructables
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Instructables: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.instructables.com/member/$username" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.instructables.com/member/%s\n" $username
printf "https://www.instructables.com/member/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# KeyBase
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Keybase: \e[0m\033[0;1m"
check1=$(curl -s -i "https://keybase.io/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://keybase.io/%s\n" $username
printf "https://keybase.io/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Kongregate
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Kongregate: \e[0m\033[0;1m"
check1=$(curl -s -i "https://kongregate.com/accounts/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://kongregate.com/accounts/%s\n" $username
printf "https://kongregate.com/accounts/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Livejournal
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m LiveJournal: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.livejournal.com\n" $username
printf "https://%s.livejournal.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# AngelList
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m AngelList: \e[0m\033[0;1m"
check1=$(curl -s -i "https://angel.co/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://angel.co/%s\n" $username
printf "https://angel.co/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Last.fm
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Last.fm: \e[0m\033[0;1m"
check1=$(curl -s -i "https://last.fm/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://last.fm/user/%s\n" $username
printf "https://last.fm/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Dribbble
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Dribbble: \e[0m\033[0;1m"
check1=$(curl -s -i "https://dribbble.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://dribbble.com/%s\n" $username
printf "https://dribbble.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Codecademy
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Codecademy: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.codecademy.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.codecademy.com/%s\n" $username
printf "https://www.codecademy.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Gravatar
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Gravatar: \e[0m\033[0;1m"
check1=$(curl -s -i "https://en.gravatar.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://en.gravatar.com/%s\n" $username
printf "https://en.gravatar.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Pastebin
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Pastebin: \e[0m\033[0;1m"
check1=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://pastebin.com/u/%s\n" $username
printf "https://pastebin.com/u/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Foursquare
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Foursquare: \e[0m\033[0;1m"
check1=$(curl -s -i "https://foursquare.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://foursquare.com/%s\n" $username
printf "https://foursquare.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Roblox
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Roblox: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://foursquare.com/%s\n" $username
printf "https://foursquare.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Gumroad
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Gumroad: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.gumroad.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.gumroad.com/%s\n" $username
printf "https://www.gumroad.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Newgrounds
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Newgrounds: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.newgrounds.com\n" $username
printf "https://%s.newgrounds.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Wattpad
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Wattpad: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.wattpad.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.wattpad.com/user/%s\n" $username
printf "https://www.wattpad.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Canva
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Canva: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.canva.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.canva.com/%s\n" $username
printf "https://www.canva.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# CreativeMarket
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m CreativeMarket: \e[0m\033[0;1m"
check1=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://creativemarket.com/%s\n" $username
printf "https://creativemarket.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Trakt
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Trakt: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.trakt.tv/users/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.trakt.tv/users/%s\n" $username
printf "https://www.trakt.tv/users/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# 500px
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m 500px: \e[0m\033[0;1m"
check1=$(curl -s -i "https://500px.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://500px.com/%s\n" $username
printf "https://500px.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Buzzfeed
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Buzzfeed: \e[0m\033[0;1m"
check1=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://buzzfeed.com/%s\n" $username
printf "https://buzzfeed.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# TripAdvisor
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m TripAdvisor: \e[0m\033[0;1m"
check1=$(curl -s -i "https://tripadvisor.com/members/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://tripadvisor.com/members/%s\n" $username
printf "https://tripadvisor.com/members/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# HubPages
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m HubPages: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.hubpages.com/\n" $username
printf "https://%s.hubpages.com/\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Contently
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Contently: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.contently.com\n" $username
printf "https://%s.contently.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Houzz
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Houzz: \e[0m\033[0;1m"
check1=$(curl -s -i "https://houzz.com/user/$username" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://houzz.com/user/%s\n" $username
printf "https://houzz.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# blip.fm
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Blip.fm: \e[0m\033[0;1m"
check1=$(curl -s -i "https://blip.fm/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://blip.fm/%s\n" $username
printf "https://blip.fm/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Wikipedia
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Wikipedia: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.wikipedia.org/wiki/User:%s\n" $username
printf "https://www.wikipedia.org/wiki/User:%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# HackerNews
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m HackerNews: \e[0m\033[0;1m"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://news.ycombinator.com/user?id=%s\n" $username
printf "https://news.ycombinator.com/user?id=%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# CodeMentor
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m CodeMentor: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.codementor.io/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.codementor.io/%s\n" $username
printf "https://www.codementor.io/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# ReverbNation
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m ReverbNation: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.reverbnation.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.reverbnation.com/%s\n" $username
printf "https://www.reverbnation.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Designspiration
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Designspiration: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.designspiration.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.designspiration.net/%s\n" $username
printf "https://www.designspiration.net/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Bandcamp
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Bandcamp: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.bandcamp.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.bandcamp.com/%s\n" $username
printf "https://www.bandcamp.com/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# ColourLovers
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m ColourLovers: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.colourlovers.com/love/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.colourlovers.com/love/%s\n" $username
printf "https://www.colourlovers.com/love/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# IFTTT
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m IFTTT: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.ifttt.com/p/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.ifttt.com/p/%s\n" $username
printf "https://www.ifttt.com/p/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Ebay
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Ebay: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.ebay.com/usr/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.ebay.com/usr/%s\n" $username
printf "https://www.ebay.com/usr/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Slack
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Slack: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.slack.com\n" $username
printf "https://%s.slack.com\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# OkCupid
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m OkCupid: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.okcupid.com/profile/%s\n" $username
printf "https://www.okcupid.com/profile/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Trip
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Trip: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.trip.skyscanner.com/user/%s\n" $username
printf "https://www.trip.skyscanner.com/user/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Ello
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Ello: \e[0m\033[0;1m"
check1=$(curl -s -i "https://ello.co/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://ello.co/%s\n" $username
printf "https://ello.co/%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Tracky
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Tracky: \e[0m\033[0;1m"
check1=$(curl -s -i "https://tracky.com/user/$username" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://tracky.com/~%s\n" $username
printf "https://tracky.com/~%s\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Tripit
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Tripit: \e[0m\033[0;1m"
check1=$(curl -s -i "https://www.tripit.com/people/$username#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location: https://www.tripit.com/home' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://www.tripit.com/people/%s#/profile/basic-info\n" $username
printf "https://www.tripit.com/people/%s#/profile/basic-info\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi

# Basecamp
printf "\033[34;1m[\e[0m\033[33;1m+\e[0m\033[34;1m]\e[0m\033[33;1m Basecamp: \e[0m\033[0;1m"
check1=$(curl -s -i "https://$username.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\033[32;1m Found!\e[0m https://%s.basecamphq.com/login\n" $username
printf "https://%s.basecamphq.com/login\n" $username >> $username.txt
elif [[ $check1 == *'0'* ]]; then 
printf "\033[31;1mNot Found!\e[0m\n"
fi
partial
}
banner
scanner
