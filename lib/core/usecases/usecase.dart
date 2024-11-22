// Generic abstract class representing a use case, encapsulating a single unit of business logic.
abstract class UseCase<Type, Params> {
  // The main method to be implemented by concrete use case classes.
  // It takes parameters (if any) and returns a Future containing the result of the use case.
  Future<Type> call({Params params});
}
