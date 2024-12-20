---
title: Home
layout: base
colorset: light
permalink: index.html
---

# Welcome to Baltic

Baltic is a code-centric Jekyll theme, heavily inspired by the Nord color theme but with some custom color choices.

---

## **Nord-Style** Syntax Highlighting
Accomplished with Rouge.

```rust
// Example Rust

impl Solution {
    pub fn fisr_sqrt(f: i32) -> i32 {
        
        // Cast to float and u32
        let x = f as f32;
        let yu = x.to_bits();
        
        // Kadlec's numbers
        // see https://en.wikipedia.org/wiki/Fast_inverse_square_root#Magic_number
        let yu = 0x5F1FFFF9 - (yu >> 1);
        let yf = f32::from_bits(yu);
        let z = 0.703952253 * yf * (2.38924456 - x * yf * yf);

        // 2x newton's method; accuracy drops significantly
        // with any less
        let z = z * (1.5 - (0.5 * x * z * z));
        let z = z * (1.5 - (0.5 * x * z * z));

        // We may overshoot by 1
        // This will fix it
        let mut sqrt = (1.0/z).floor() as i32;
	
        if (sqrt*sqrt) > f { sqrt -= 1; }
    
        sqrt
    }
}
```

```py
# example python

from dataclasses import dataclass
import statistics 

@dataclass
class Point:
    x: int
    y: int
    def manhattan_dist(self, b: "Point") -> int:
        return abs(b.x - self.x) + abs(b.y-self.y)

class Solution:
    INT_FRIEND = 1

    def minTotalDistance(self, grid: List[List[int]]) -> int:
        friends = deque()
        x_points = []
        y_points = []
        h = len(grid)
        w = len(grid[0])

        for y in range(0, h): 
            for x in range (0, w):
                if grid[y][x] == self.INT_FRIEND:
                    friends.append(Point(x,y))
                    x_points.append(x)
                    y_points.append(y)

        median = Point(statistics.median(x_points), statistics.median(y_points))

        travel_dist = 0
        for friend in friends:
            travel_dist += median.manhattan_dist(friend)

        return int(travel_dist)
```

```js
// Example JavaScript
// Source: https://github.com/amacgillivray/448_g13_p4/blob/master/game.js#L846
class Game {

    // ... 

    /**
     * @brief Creates combat animations to visually indicate a firefight between the source and target units.
     * @param {Unit}  source 
     * @param {array} targets
     *        Array of Unit objects that the source is firing at. 
     * @param {number} tick
     *        The tick # of the combat generating the animation. Used so that old animations can be removed.
     */
    static animateUnitCombat( source, targets, tick )
    {
        let container = document.getElementById("combat-layer");
        let craterctn = document.getElementById("crater-layer");

        let sbb = document.getElementById(source.id).getBBox();

        if (source._count == 0)
            return;
        
        let sx = sbb.x + (Math.random()*sbb.width);
        let sy = sbb.y + (Math.random()*sbb.height);

        // Remove old animations
        if (tick > 0)
        {
            let old_anims = document.getElementsByClassName("cbt_t_" + (tick-1).toString());
            for (let i = old_anims.length-1; i >= 0; i--)
                old_anims[i].remove();
        }

        // ... omit long code for example
    }
}
```


---

## *\_includes* Elements

Baltic provides a number of `_includes` that help format common content types like images, videos, and publications.

{%- include spacer.html -%}

### Formatted **Publications**

{%- include publication.html 
    title="Combining Quantum Key Distribution with Chaotic Systems for Free-Space Optical Communications"
    venue="Quantum Information Processing"
    date="2021-10-26"
    volume="20"
    number="354"
    pages="1-25"
    doi="10.1007/s11128-021-03299-3"
    authors="Naveed Mahmud, Andrew MacGillivray, Apurva Rai, Jenna Patterson, Adam Gharaibeh, Esam El-Araby, Harry Shaw, Lavida Cooper"
    link="https://ui.adsabs.harvard.edu/abs/2021QuIP...20..354M/abstract"
    link_text="ui.adsabs.harvard.edu"
-%}

{%- include publication.html
    title="The Battle Over Taiwan"
    venue="The Wall Street Journal (Future View)"
    date="2021-11-02"
    link="https://www.wsj.com/articles/dangerous-flashpoint-in-american-foreign-policy-china-iran-taiwan-primacy-11635885161"
    link_text="www.wsj.com"
    authors="Andrew MacGillivray"
    summary="WSJ Future View is a weekly opinion page featuring short essays from a handful of students."
-%}

{%- include spacer.html -%}

{% comment %}
 TODO: takes too much space + video playback seems broken and not sure why.

### Embeddable **Video**

{%- include embed-video.html 
    source_list="./example-snow-drive.mp4" 
    caption="<b>We lied about having snow tires.</b> The drive into Yosemite was treacherous - but the valley itself was free of snow.<br/><br/>Add multiple sources (encoding variants) with comma separators.<br/>Leave caption empty to omit. You can always fall back to your own HTML for full control." -%}

{% endcomment %}

### Captioned **Images** 

{% comment %}
To-Do: add a size parameter that adds one of three css classes (that can be overriden by users)
{% endcomment %}

{%- include embed-image.html 
    source="./example-el-cap.jpg"
    caption="El Capitan on a stormy April day in Yosemite." -%}

{% comment %}
{%- include embed-image.html 
    source="./example-ritz-nola.jpg"
    caption="Leaving the Ritz Carlton in New Orleans." -%}


### Media **Galleries** 
To-Do.
{% endcomment %}

{%- include spacer.html -%}