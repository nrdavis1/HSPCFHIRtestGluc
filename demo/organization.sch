<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile US Core Organization Profile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>Organization</sch:title>
    <sch:rule context="f:Organization">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">If the resource is contained in another resource, it SHALL NOT contain any narrative</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</sch:assert>
      <sch:assert test="count(f:identifier | f:name) &gt; 0">The organization SHALL at least have a name or an id, and possibly more than one</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Organization.extension</sch:title>
    <sch:rule context="f:Organization/f:extension">
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Organization.telecom</sch:title>
    <sch:rule context="f:Organization/f:telecom">
      <sch:assert test="count(f:use[@value='home']) = 0">The telecom of an organization can never be of use 'home'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Organization.address</sch:title>
    <sch:rule context="f:Organization/f:address">
      <sch:assert test="count(f:use[@value='home']) = 0">An address of an organization can never be of use 'home'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Organization/f:contact</sch:title>
    <sch:rule context="f:Organization/f:contact">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/Extension']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/Extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/Extension']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/Extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Organization.contact</sch:title>
    <sch:rule context="f:Organization/f:contact">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Organization.contact.extension</sch:title>
    <sch:rule context="f:Organization/f:contact/f:extension">
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
