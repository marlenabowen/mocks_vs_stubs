##### Mocks = Mock *Objects*
##### Stubs = Stubbed *Objects*

The difference is in the **design** of the object. Mock objects are designed to exhibit *behavior*. Stubbed objects are designed to exhibit *state*.

##### Example:

Let’s say we have an application for placing orders from a shoe store. The application has an `Order` object, and a `Store` object. `Order` has a method called `place_order`. The `place_order` method has a dependency on `Store`:

```
class Order
  def place_order(number_of_shoes) do
    store.purchase(number_of_shoes)
  end
end
```

A mock of `Store` would look like this:

```
class MockStore
  def purchase(number_of_shoes) do
    print(“MockStore.purchase called with #{number_of_shoes} number of shoes”
  end
end
```

The mock tells us that **the `purchase` method was called with some `number_of_shoes`**, and that’s what our unit test would assert.

A stub of `Store` would look like this:

```
class StoreStub
  def init(number_of_shoes_in_stock) do
    self.shoes_in_stock = number_of_shoes_in_stock
  end

  def purchase(number_of_shoes) do
    self.shoes_in_stock -= number_of_shoes
  end
end
```

The stub keeps track of the state of the `StoreStub` (**how many shoes are in stock**). Our unit test would assert that the correct number of shoes is left after the method call.
