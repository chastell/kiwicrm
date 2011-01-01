KiwiCRM
=======

Bits of [CiviCRM](http://civicrm.org/) with all wrongs reversed (and tonnes of new ones added!).



Overview
--------

The general idea behind KiwiCRM is to try doing things a bit differently than CiviCRM and see what sticks – Ruby instead of PHP, a document (graph?) database instead of MySQL, etc.

The vague idea of where to start is a system with only two kinds of ‘things’: entities (people, groups, organisations, events, etc.) and relations between them. Each entity type has its own class/collection (vertex?), with a separate, common class/collection (edge?) for relations. Each relation stores the two entities it connects and anything that makes sense in its case (relation type, under what method should the given relation be exposed on either end, maybe dates when it was active, etc.).

The vague idea about the API is to have, say, event.rels.participants returning an enumerable of entity identifiers, with event.participants returning an enumerable with the actual (lazily dereferenced) entities. Ideally, the backend should be db-agnostic, so that the whole suite can work with other databases with little (or no) changes.

One of the initial goals is for this to be trivially extensible; you’re Russian and need to track patrynomics? Sure thing, _just start using them_. You’re running a Jewish organisation and need to track after/before sunset features of your contacts’ birthdays? Go ahead, make them first-class properties in _this_ CRM…

Another idea is that the core (default) set of features is implemented as a ‘core’ extension – and that nothing is special: `Person#given_names` and `Person#surname` are in no way more glorified than `Person#handedness`. Additional logic – like on-the-fly construction of (strung from given names and surname in the order appropriate for a given culture) `Person#name` – is provided by an extension (in this case, probably the ‘core’ one), rather than directly hacked into the CRM itself.

With this approach, various extensions can be developed on top of the field/logic agnostic platform. These extensions can provide new objects (like events) and new relation types; with a schema-less approach the new relations can be picked up by the platform without it being fully aware they differ from anything provided by default (although the extensions can depend on each other, e.g. require that a ‘core’ extension is enabled).



---

© MMXI Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
