test("length is 2", () => {
    expect(Array.prototype.splice).toHaveLength(2);
});

test("basic functionality", () => {
    var array = ["hello", "friends", "denlab", 1, 2];
    var removed = array.splice(3);
    expect(array).toEqual(["hello", "friends", "denlab"]);
    expect(removed).toEqual([1, 2]);

    array = ["hello", "friends", "denlab", 1, 2];
    removed = array.splice(-2);
    expect(array).toEqual(["hello", "friends", "denlab"]);
    expect(removed).toEqual([1, 2]);

    array = ["hello", "friends", "denlab", 1, 2];
    removed = array.splice(-2, 1);
    expect(array).toEqual(["hello", "friends", "denlab", 2]);
    expect(removed).toEqual([1]);

    array = ["denlab"];
    removed = array.splice(0, 0, "hello", "friends");
    expect(array).toEqual(["hello", "friends", "denlab"]);
    expect(removed).toEqual([]);

    array = ["goodbye", "friends", "denlab"];
    removed = array.splice(0, 1, "hello");
    expect(array).toEqual(["hello", "friends", "denlab"]);
    expect(removed).toEqual(["goodbye"]);

    array = ["foo", "bar", "baz"];
    removed = array.splice();
    expect(array).toEqual(["foo", "bar", "baz"]);
    expect(removed).toEqual([]);

    removed = array.splice(0, 123);
    expect(array).toEqual([]);
    expect(removed).toEqual(["foo", "bar", "baz"]);

    array = ["foo", "bar", "baz"];
    removed = array.splice(123, 123);
    expect(array).toEqual(["foo", "bar", "baz"]);
    expect(removed).toEqual([]);

    array = ["foo", "bar", "baz"];
    removed = array.splice(-123, 123);
    expect(array).toEqual([]);
    expect(removed).toEqual(["foo", "bar", "baz"]);

    array = ["foo", "bar"];
    removed = array.splice(1, 1, "baz");
    expect(array).toEqual(["foo", "baz"]);
    expect(removed).toEqual(["bar"]);
});

test("Invalid lengths", () => {
    var length = Math.pow(2, 32);

    var obj = {
        length: length,
    };

    expect(() => {
        Array.prototype.splice.call(obj, 0);
    }).toThrowWithMessage(RangeError, "Invalid array length");
});
