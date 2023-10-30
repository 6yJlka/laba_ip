function output(node, indentLevel) {
    const indent = "  ".repeat(indentLevel);
  
    if (node.nodeType === Node.ELEMENT_NODE) {

        const el = document.createElement("pre");
        el.textContent = indent + "<" + node.tagName + ">";
        document.body.appendChild(el);

        for (let i = 0; i < node.childNodes.length; i++) {
            output(node.childNodes[i], indentLevel + 1);
        }

        const elb = document.createElement("pre");
        elb.textContent = indent + "</" + node.tagName + ">";
        document.body.appendChild(elb);
    }
}
