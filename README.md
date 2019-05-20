##### Mocks = Mock *Objects*
##### Stubs = Stubbed *Objects*

The difference is in the **design** of the object. Mock objects are designed to exhibit *behavior* (method calls). Stubbed objects are designed to exhibit *state*.

##### Example:

Let’s say we have an application for placing orders from a shoe store. The application has an `Order` object, and a `Store` object. `Order` has a dependency on a `Store` object, via a method called `place_order`:

```
class Order
  def place_order(store, number_of_shoes)
    store.purchase(number_of_shoes)
  end
end
```

Our test for the `place_order` method will require a `Store` object, and will make a call to that object's `purchase` method. To rule out non-determinism in our test, we want to create a test double for `Store`.

##### A mock of `Store` would look like this:

```
class MockStore
  def purchase(number_of_shoes)
    "mock_store.purchase called for #{number_of_shoes} shoes"
  end
end
```

The mock tells us that **the `purchase` method was called with some `number_of_shoes`**, and that’s what our unit test would assert.


###### [Test assertion](https://github.com/marlenabowen/mocks_vs_stubs/blob/master/spec/order_spec.rb#L6): `place_order` calls `mock_store.purchase` with expected arguments


##### A stub of `Store` would look like this:

```
class StoreStub
  def init(number_of_shoes_in_stock)
    @number_of_shoes_in_stock = number_of_shoes_in_stock
  end

  def purchase(number_of_shoes)
    @number_of_shoes_in_stock -= number_of_shoes
  end
end
```

The stub keeps track of the state of the `StoreStub` (**how many shoes are in stock**). Our unit test would assert that the correct number of shoes is left after the method call.

###### [Test assertion](https://github.com/marlenabowen/mocks_vs_stubs/blob/master/spec/order_spec.rb#L16): `place_order` changes the state of `StoreStub` by reducing the `number_of_shoes_in_stock`

