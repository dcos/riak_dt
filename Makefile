REBAR            = $(shell pwd)/rebar3

.PHONY: rel deps test

all: compile

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean

check: test xref dialyzer lint cover edoc

test: ct eunit

xref:
	${REBAR} as test xref

dialyzer:
	${REBAR} dialyzer

eunit:
	${REBAR} as test eunit

ct:
	${REBAR} as test ct -v
