use rutie::*;

pub struct StructWithLifetime<'a> {
    text: &'a str,
}

impl<'a> StructWithLifetime<'a> {
    fn new(text: &'a str) -> Self {
        StructWithLifetime { text }
    }

    fn text(&self) -> &'a str {
        self.text
    }
}

wrappable_struct!(
    StructWithLifetime<'static>,
    StructWithLifetimeWrapper,
    STRUCT_WITH_LIFETIME_WRAPPER_INSTANCE
);

class!(RubyClassWithLifetime);
methods!(
    RubyClassWithLifetime,
    rtself,
    fn pub_node_with_lifetime_new(text: RString) -> RubyClassWithLifetime {
        let text = text.map_err(VM::raise_ex).unwrap().to_string();

        let node = StructWithLifetime::new(&text);

        Class::from_existing("RubyClassWithLifetime").wrap_data(node, &*STRUCT_WITH_LIFETIME_WRAPPER_INSTANCE)
    },
    fn pub_node_with_lifetime_text() -> RString {
        let text = rtself.get_data(&*STRUCT_WITH_LIFETIME_WRAPPER_INSTANCE).text();

        RString::new_utf8(text)
    },
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_rutie_test_wrappable_struct() {
    Class::new("RubyClassWithLifetime", None).define(|klass| {
        klass.def_self("new", pub_node_with_lifetime_new);
        klass.def("text", pub_node_with_lifetime_text);
    });
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_it_wraps() {
        rutie::VM::init();

        super::Init_rutie_test_wrappable_struct();

        let initial_text = "127.0.0.1 127.0.0.1 127.0.0.1";
        let node = StructWithLifetime::new(initial_text);
        let wrapper: RubyClassWithLifetime =
            Class::from_existing("RubyClassWithLifetime")
                .wrap_data(node, &*STRUCT_WITH_LIFETIME_WRAPPER_INSTANCE);

        let unwrapped_node = wrapper.get_data(&*STRUCT_WITH_LIFETIME_WRAPPER_INSTANCE);
        let resulting_text = unwrapped_node.text();

        assert_eq!(initial_text, resulting_text);
    }
}
