LIBMLX = mlx_linux/libmlx_Linux.a -Imlx_linux

CFLAGS = -Wall -Wextra -Werror -g3 -MMD

LFLAGS = -lXext -lX11 -lm -lz

CC = clang

NAME = cub3d

DIR = src/

SRC_DIR =	camera.c\
			check_line.c\
			color.c\
			deplacer.c\
			draw.c\
			ft_error.c\
			ft_free.c\
			ft_init.c\
			ft_isdigit.c\
			ft_key_hook.c\
			ft_map_tool.c\
			ft_memset.c\
			ft_safe_malloc.c\
			ft_uniforme_walls.c\
			get_next_line.c\
			get_next_line_utils.c\
			image.c\
			load_xpmfiles.c\
			main.c\
			new_intersect.c\
			new_intersect_utils.c\
			parse.c\
			parse_map.c\
			parse_rgb.c\
			parse_tex.c\
			raycasting.c\
			screen.c\
			valid_map.c

SRC = $(addprefix $(DIR), $(SRC_DIR))

OBJ = $(SRC:%.c=%.o)

DEP = $(OBJ:%.o=%.d)

-include $(DEP)

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -I -Imlx_linux -c $< -o $@

$(NAME): $(OBJ)
	make -C mlx_linux
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ) -O3 $(LIBMLX) $(LFLAGS)
	
clean:
	make clean -C mlx_linux
	rm -f $(OBJ)
	rm -f $(DEP)

fclean: clean
	rm -f $(NAME)

re: fclean all

flemme: re
	make clean

.PHONY: clean fclean all re
