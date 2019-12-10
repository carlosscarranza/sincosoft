import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroAlumnoMateriaComponent } from './registro-alumno-materia.component';

describe('RegistroAlumnoMateriaComponent', () => {
  let component: RegistroAlumnoMateriaComponent;
  let fixture: ComponentFixture<RegistroAlumnoMateriaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistroAlumnoMateriaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistroAlumnoMateriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
