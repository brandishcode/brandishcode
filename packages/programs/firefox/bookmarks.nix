{
  force = true;
  settings = [
    {
      name = "toolbar";
      toolbar = true;
      bookmarks = [
        {
          name = "ricing";
          bookmarks = [
            {
              name = "waybar wiki";
              url = "https://github.com/Alexays/Waybar/wiki";
            }
          ];
        }
        {
          name = "git";
          tags = [ "git" ];
          keyword = "git";
          url = "https://github.com/brandishcode?tab=repositories";
        }
        {
          name = "3D";
          bookmarks = [
            {
              name = "Projection Matrix";
              url = "http://www.songho.ca/opengl/gl_projectionmatrix.html";
            }
            {
              name = "Learn OpenGL";
              url = "https://learnopengl.com/";
            }
            {
              name = "Grid";
              url = "https://asliceofrendering.com/scene%20helper/2020/01/05/InfiniteGrid/";
            }
          ];
        }
      ]
      ++ (import ./bookmarks);
    }
  ];
}
