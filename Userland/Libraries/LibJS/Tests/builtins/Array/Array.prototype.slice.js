test("length is 0", () => {
    expect(Array.prototype.slice).toHaveLength(2);
});

test("basic functionality", () => {
    var array = ["hello", "friends", "denlab", 1];

    var slice = array.slice();
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["hello", "friends", "denlab", 1]);

    slice = array.slice(1);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["friends", "denlab", 1]);

    slice = array.slice(0, 2);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["hello", "friends"]);

    slice = array.slice(-1);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual([1]);

    slice = array.slice(1, 1);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual([]);

    slice = array.slice(1, -1);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["friends", "denlab"]);

    slice = array.slice(2, -1);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["denlab"]);

    slice = array.slice(0, 100);
    expect(array).toEqual(["hello", "friends", "denlab", 1]);
    expect(slice).toEqual(["hello", "friends", "denlab", 1]);
});

test("Invalid lengths", () => {
    var length = Math.pow(2, 32);

    var obj = {
        length: length,
    };

    expect(() => {
        Array.prototype.slice.call(obj, 0);
    }).toThrowWithMessage(RangeError, "Invalid array length");
});
