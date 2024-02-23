package com.mspr.back.custom_exception;

public class EntityNotFoundException extends RuntimeException {
    EntityNotFoundException(Long id) {
        super("Could not find entity " + id);
    }
}

/*

// Implémentation dans les controller

EntityModel<Employee> one(@PathVariable Long id) {

  Botaniste botaniste = repository.findById(id)
      .orElseThrow(() -> new EntityNotFoundException(id));

  return botaniste;
}
 */