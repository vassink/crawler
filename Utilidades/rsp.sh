#!/bin/bash
#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

#Define variables:
a='General update'
b='Modified file(s)'
c='Renamed file(s)'
d='File(s) added'
e='File(s) deleted'
chg=('M' 'R' 'A' 'D')
gitdiff=$(git diff-index HEAD | awk '{print $5}' | uniq)
first=$(echo "$gitdiff" | grep -m 1 [MRAD])

#Function:
rsp() {
    git add -A
    wait

    for i in {0..3}
    do
        if [[ "$first" != "${chg[$i]}" ]]; then
           rest+=("${chg[$i]}")
        fi
    done

    if [[ $(echo "$gitdiff" | grep -e "${rest[0]}" -e "${rest[1]}" -e "${rest[2]}") ]]; then
        git commit -m "$a"
    elif [ "$first" = 'M' ]; then
        git commit -m "$b"
    elif [ "$first" = 'R' ]; then
        git commit -m "$c"
    elif [ "$first" = 'A' ]; then
        git commit -m "$d"
    elif [ "$first" = 'D' ]; then
        git commit -m "$e"
    fi
        git push origin main
}

#Call:
rsp

#Note:
#Me demoré mucho en esto porque fue como moverse en una casa que no conozco y totalmente a oscuras. Las superficies vendrían a ser la sintaxis de bash y de grep. Avancé gracias a que iba probando y errando, y formando ideas acerca de lo que tenía que googlear. El error más misterioso era que no podía usar "${chg[@]}" en mi 'for loop' porque '$i' nunca se actualizaba. La razón era que no se puede expandir datos dentro de '{}' en una variable. Otra cosa extraña es que el código funcionaba bien como script, pero como parte de '.bashrc' arrojaba errores.
