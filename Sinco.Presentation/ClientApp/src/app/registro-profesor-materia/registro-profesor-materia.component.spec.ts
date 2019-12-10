import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroProfesorMateriaComponent } from './registro-profesor-materia.component';

describe('RegistroProfesorMateriaComponent', () => {
  let component: RegistroProfesorMateriaComponent;
  let fixture: ComponentFixture<RegistroProfesorMateriaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistroProfesorMateriaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistroProfesorMateriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
