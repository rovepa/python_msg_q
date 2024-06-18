CREATE OR REPLACE PROCEDURE generate_and_insert_xmls AS
    v_base_value_a VARCHAR2(50) := 'ValueA';   -- Example value for element <a>
    v_base_value_b VARCHAR2(50) := 'ValueB';   -- Example value for element <b>
    v_base_value_c NUMBER := 100;              -- Initial value for element <c>
    v_xml_data XMLTYPE;                        -- XML data to be inserted
BEGIN
    -- Create XMLType object
    FOR i IN 1..500 LOOP -- Assuming you want to generate 500 XML files
        -- Generate XML content
        v_xml_data := XMLTYPE('<root><a>' || v_base_value_a || '</a><b>' || v_base_value_b || '</b><c>' || TO_CHAR(v_base_value_c + (i - 1) * 100) || '</c></root>');

        -- Insert XML content into table
        INSERT INTO xml_table (xml_data) VALUES (v_xml_data);
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('XML data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END generate_and_insert_xmls;
/
----------------------------------------

CREATE OR REPLACE PROCEDURE generate_and_insert_xmls AS
BEGIN
    FOR i IN 1..500 LOOP -- Generate 500 XML records
        -- Construct XML data
        INSERT INTO xml_table (xml_data)
        VALUES (XMLTYPE('<root><a>ValueA</a><b>ValueB</b><c>' || TO_CHAR(100 + (i - 1) * 100) || '</c></root>'));
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('XML data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END generate_and_insert_xmls;
/
