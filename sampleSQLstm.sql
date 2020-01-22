#Listado de Estudiantes
SELECT curso_categorias.`name` as 'Región',curso.id,curso.fullname as 'Aula',rol.shortname as 'Rol',usuario.username as 'DNI',
	   usuario.firstname as 'Apellido', usuario.lastname as 'Nombre', usuario.email as 'Email'
FROM mdl_course curso
JOIN mdl_context contexto ON curso.id = contexto.instanceid AND contexto.contextlevel = '50'
JOIN mdl_course_categories curso_categorias ON curso.category=curso_categorias.id
JOIN mdl_role_assignments rol_asignaturas ON contexto.id = rol_asignaturas.contextid
JOIN mdl_role rol ON rol_asignaturas.roleid = rol.id
JOIN mdl_user usuario ON rol_asignaturas.userid = usuario.id
WHERE /*rol_asignaturas.roleid =5 AND*/ curso_categorias.`name` IN ('Región 01', 'Región 02', 'Región 03', 'Región 04', 'Región 05',
 'Región 06', 'Región 07', 'Región 08', 'Región 09', 'Región 10', 'Región 11', 'Región 12', 'Región 13', 'Región 14', 'Región 15',
 'Región 16', 'Región 17', 'Región 18', 'Región 19', 'Región 20', 'Región 21', 'Región 22', 'Región 23', 'Región 24', 'Región 25')
ORDER BY curso_categorias.`name`,curso.fullname, usuario.firstname;

#Consulta de calificaciones/grado
SELECT c.id,u.id,curso_categorias.`name`,c.shortname,u.lastname,gi.itemname,gi.gradetype,gi.grademax,gi.grademin,gi.timecreated,gi.timemodified,gg.rawgrade,
gg.rawgrademax,gg.rawgrademin,gg.finalgrade,gg.timecreated,gg.timemodified,a.grade/*,asub.`status`*/
FROM mdl_grade_items gi
JOIN mdl_grade_grades gg ON gi.id=gg.itemid
JOIN mdl_course c ON gi.courseid = c.id
JOIN mdl_context contexto ON c.id = contexto.instanceid AND contexto.contextlevel = '50'
JOIN mdl_course_categories curso_categorias ON c.category=curso_categorias.id
JOIN mdl_user u ON gg.userid=u.id
JOIN mdl_role_assignments ra ON u.id=ra.userid AND ra.roleid = 5 AND contexto.id=ra.contextid
JOIN mdl_assign a ON gi.iteminstance=a.id
#JOIN mdl_assign_submission asub ON gi.iteminstance=asub.assignment
WHERE gi.itemmodule='assign'
AND curso_categorias.`name` IN ('Región 01', 'Región 02', 'Región 03', 'Región 04', 'Región 05',
'Región 06', 'Región 07', 'Región 08', 'Región 09', 'Región 10', 'Región 11', 'Región 12', 'Región 13', 'Región 14', 'Región 15',
'Región 16', 'Región 17', 'Región 18', 'Región 19', 'Región 20', 'Región 21', 'Región 22', 'Región 23', 'Región 24', 'Región 25')
AND contexto.instanceid = c.id
AND gg.finalgrade IS NOT null
#AND asub.`status`='submitted';