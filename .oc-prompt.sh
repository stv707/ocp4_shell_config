#!/bin/bash
__oc_ps1()
{
    oc status &> /dev/null
    if [ $? -eq 0 ]
    then
    # Get current context
    CONTEXT=$(cat ~/.kube/config 2>/dev/null| grep -o '^current-context: [^/]*' | cut -d' ' -f2)

    if [ -n "$CONTEXT" ]; then
        echo "(ocp:${CONTEXT})"
    fi
    else
            echo "(ocp:NULL)"
    fi
}


__oc_user()
{
        oc status &> /dev/null
        if [ $? -eq 0 ]
        then

        GG=$(oc whoami)
        if [ -n "$GG" ]
        then
                echo "(ocu:${GG})"
        fi

        else
        echo "(ocu:NULL)"
        fi
}