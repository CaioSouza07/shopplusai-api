package com.univille.api.shopplusai.domain.usuario.dto;

import com.univille.api.shopplusai.domain.usuario.Usuario;

public record UsuarioResponse(Long id, String nome, String email) {
    public  UsuarioResponse(Usuario usuario){
        this(usuario.getId(), usuario.getNome(), usuario.getEmail());
    }
}
