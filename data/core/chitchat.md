## chitchat
* ask_weather OR ask_builder OR ask_whatspossible OR ask_howdoing OR ask_whoisit OR ask_whatistrakhees
    - action_chitchat

## deny ask_whatspossible
* ask_whatspossible
    - action_chitchat
* deny
    - utter_nohelp

## more chitchat
* greet
    - utter_greet
    - utter_inform_privacypolicy
    - utter_ask_goal
* ask_weather OR ask_builder OR ask_howdoing OR ask_whoisit OR ask_whatistrakhees
    - action_chitchat
    - utter_ask_goal
* ask_weather OR ask_builder OR ask_howdoing OR ask_whoisit OR ask_whatistrakhees
    - action_chitchat
    - utter_ask_goal

## ask_whatspossible
* greet
    - utter_greet
    - utter_inform_privacypolicy
    - utter_ask_goal
* ask_whatspossible
    - action_chitchat

## ask_whatspossible more
* greet
    - utter_greet
    - utter_inform_privacypolicy
    - utter_ask_goal
* ask_whatspossible
    - action_chitchat
* ask_whatspossible
    - action_chitchat
