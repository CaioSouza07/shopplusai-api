package com.univille.api.shopplusai.domain.usuario;

import com.univille.api.shopplusai.domain.usuario.dto.CreateUsuarioRequest;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "usuarios")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false, unique = true)
    private String email;

    public Usuario(CreateUsuarioRequest dados){
        this.nome = dados.nome();
        this.email = dados.email();
    }
}
