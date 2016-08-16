# watch-the-hearing
<p>Ear and eyes are well specialized to extract the most important information from the crazy wave fields surrounding us - in realtime! Sound waves and electromagnetic waves are basicly very similar although the latter is a bit more complex as it has an orientation. But since our eyes don't care about that orientation, we do not as well, and so the two waves are similar in its structure for us.</p>
Hmmm so what would happen if we could hear the electromagnetic waves? How does a specific color sound like? For that task we just had to mathematically abstract the electromagnetic waves and transform them to soundwaves - shouldn't be a big issue. Remember the analog radio? This actually is such a realtime-transformer. But the working frequency range of the radio is far to low for the eyes and are not recognized. Now let's assume, that we would have such a transformer for the optical frequency range. What would we hear while sitting in the garden? Do we hear green? Or blue? Actually we hear everything at the same time!:( If we want to hear the grass, we need to somehow only take the waves from this direction in to account. If we want to hear a single blade of grass, we have to be very very precise respective to the direction. Our eyes have mastered this task by making use of the linse-effect. They have a angular resolution of less than one arc minute (ca. 1 millimeter every 3 meter). Let's say we are technically able to handle this resolution. How does a brown beetle sound? The answer is: There are infinite possibilities!? Because as good as our eyes handle the "direction-problem" as little do they care about the exact frequencies. That means, there are a lot of possible frequency distributions corresponding to different sounds, that are seen as the same brown color. So when looking at a particular color, it is impossible to tell, how exactly the color would sound like. For some special color one can at least make a vague guess, i.e. the color red could sound like a deep thunder (no high frequencies), while blue could correspond to a very high noise. So it seems that we don't need that much information about the frequency distribution of the light. The eyes made a trade off and only care about four particular cornerstone: one for the intensity of the light (levels of grey) and three for sampling the frequencies centered at red,green and blue. The sense of touch of these color-sensores are covering a wide frequencyband around the centerfrequency. They even do overlap each other a bit. It can be shown, that if we only send monochromatic (at one precise frequency) electromagnetic waves at those three frequencies i.e. with LED's, we can cover practically all colors we know. This technique is called "RGB color space" and opened the door to the colored digital world. 
So we see, eyes are pro in detecting from which direction a certain wave is coming in but not so good in telling the exact frequency composition.
The interesting thing is, and that's why I wrote this repo, that it is exactly the other way around by looking at our ear! While we are quite untalented in telling the direction of a specific noise source we are remarkable skilled in analysing the frequency spectrum of sound waves - in real time! Music actually is one gigantic celebration of this ability:) Now as mentioned above its not very reasonable to guess a sound coresponding to a specific color the transformation from sound to color is theoretically unique. So for every noise, there exists exactly one corresponding color, even if there are endlessly other noise corresponding to the same color. The mathematicians call such a transformation surjective, because it is not invertible. 
So what I tryed to do was exactly this task. I modelled the three types of photoreceptor cells, related them to the three dimensional RGB-space and sampled the (sound-)signal of arbitrary mp3-files. The code is written in matlab 
