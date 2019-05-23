package com.vladooha.data.entities.courses;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "course_tag")
@Data
public class CourseTag {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique = true)
    private String name;

    @ManyToMany(mappedBy = "tags")
    private Set<Course> courses;

    @OneToMany(mappedBy = "tag", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    private Set<MetatagTag> metatagTags = new HashSet<>();
}
