---
title: Home
layout: base
colorset: light
permalink: index.html
---

# Welcome to Baltic

Baltic is a code-centric Jekyll theme, heavily inspired by the Nord color theme.

---

## *\_includes* Elements

### Embeddable **Video**

{%- include embed-video.html 
    source_list="https://i.imgur.com/G4a8ZW6.mp4" 
    caption="An excursion in Muskoka.<br/> Add multiple sources with comma separators.<br/>Leave caption empty to omit." -%}

{%- include embed-video.html 
    source_list="https://i.imgur.com/LWizlJu.mp4" 
    caption="" -%}

### Captioned **Images** 

{% comment %}
To-Do: add a size parameter that adds one of three css classes (that can be overriden by users)
{% endcomment %}

{%- include embed-image.html 
    source="https://i.imgur.com/ma0fHrn.png"
    caption="Lake Ontario" -%}

{%- include embed-image.html 
    source="https://i.imgur.com/8zIBlRj.png"
    caption="Lake Muskoka" -%}

{% comment %}
### Media **Galleries** 
To-Do.
{% endcomment %}

--- 

## **Nord-Style** Syntax Highlighting
Accomplished with Rouge.

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

        let cl = 0;
        let reftgt = null;
        let refbb;
        let refx, refy, refw, refh; // this allows us to get the width and heigh just once, avoiding a reflow/repaint event
        let cg = document.createElement('g');
            cg.setAttribute("id", 'craters_' + battle_ct + '_' + tick + '_' + source.side + '_' + source._type);

        // Add firing animations for the source unit towards the enemy units
        for (let i = 0; i < 3; i++)
        {
            let tx, ty;

            if (targets[i] != null && targets[i].count > 0 && Math.random() > 0.5)
            {
                if (reftgt == null)
                {
                    reftgt = targets[i];
                    refbb = document.getElementById(reftgt.region + "r").getBBox();
                    refx = refbb.x; 
                    refy = refbb.y;
                    refw = refbb.width;
                    refh = refbb.height;
                }
                let  tbb = document.getElementById(targets[i].id).getBBox();

                tx = tbb.x + (Math.random() * tbb.width);
                ty = tbb.y + (Math.random() * tbb.height);

                // on rare occasions, make the animation visibly miss its target
                if (Math.random() < 0.2)
                {
                    let xs = (Math.random() > 0.5) ? (-1) : (1);
                    let ys = (Math.random() > 0.5) ? (-1) : (1);
                    let df = (Math.random() < 0.05) ? 2 : 6;

                    tx += (2*Math.random()*xs*tbb.width);
                    ty += (2*Math.random()*ys*tbb.height);
                }

                let fire = document.createElement("path");
                fire.setAttribute("d", 
                "M " + sx.toString() + " " + sy.toString() + " " + 
                "L " + tx.toString() + " " + ty.toString());
                fire.setAttribute("class", "cbtFire " + source._type + " " + source._side + " cbt_no_" + battle_ct + " cbt_t_" + tick);
                
                container.innerHTML += fire.outerHTML;
            }

            // Add craters to enemy region if the type is armor or helicopter
            // Note that craters are not removed at the end of combat
            if (reftgt != null && troop_type_names.indexOf(source._type) > 0)
            {
                let ct = Math.floor(2*Math.random());
                if (ct == 0) return;
                let cgid = "crater_c" + battle_ct + "_t" + tick + "_" + source._side + "_" + source.type;
                for (let i = 0; i < ct; i++)
                {
                    let circle = document.createElement("circle");
                    circle.setAttribute("cx", (refx + (Math.random() * refw)).toString());
                    circle.setAttribute("cy", (refy + (Math.random() * refh)).toString());
                    circle.setAttribute("r", (Math.random() * 6));
                    circle.setAttribute("class", "crater");
                    circle.setAttribute("style", "animation-delay: " + (0.5*Math.random()) + "s");
                    circle.setAttribute("id", cgid + "_" + i);
                    cg.appendChild(circle);
                    cl++;
                    region_terrain[reftgt.region]["craters"] += 0.003
                }
            }
        }

        if (cl > 0) {
            craterctn.innerHTML += cg.innerHTML;
        }

        let cc = document.getElementsByClassName("crater");
        for (let e = cc.length-1; e >= 0; e--)
        {
            cc[e].addEventListener("animationend", GameUI.craterCb, true);
            cc[e].addEventListener("animationiteration", GameUI.craterCb, true);
        }
    }
}
```

![Up North](./header.jpg)